#!/usr/bin/env python3
"""
Tạo vietnam.mbtiles (vector tiles MapLibre, thứ tự hàng TMS) từ OpenFreeMap planet.

MapLibre truy vấn MBTiles với y lật ngược (TMS row):
    tile_row = 2^z - 1 - y_slippy   (định dạng MBTiles/TMS chuẩn)

Chiến lược tải:
  - z <= 9: TẤT CẢ thế giới (1023 tiles) -> không bị trống khi kéo map ra ngoài VN
  - z >= 10: chỉ bbox Việt Nam (kèm padding 1 tile)

Cách dùng:
  python3 make_vietnam_mbtiles.py [--min-zoom 0] [--max-zoom 13] [--workers 8] [--out OUT]
"""
import argparse
import json
import math
import os
import sqlite3
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed

UA = "Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0"
TILESET_JSON = "https://tiles.openfreemap.org/planet"
# Chiến lược 3 tầng (cân đối dung lượng <-> trải nghiệm):
#   z 0-2 : cả thế giới (21 tiles, ~16MB)
#   z 3-9 : khu vực Đông Nam Á (pan ra xung quanh VN không bị trống)
#   z10-13: lõi Việt Nam (chi tiết đường cho lái xe)
SEA = (4.0, 96.0, 26.0, 115.0)  # minlat, minlon, maxlat, maxlon
VN = (8.5, 102.0, 23.5, 109.5)  # minlat, minlon, maxlat, maxlon
WORLD_MAX_Z = 2
SEA_MAX_Z = 9

_URL_TEMPLATE = None


def tile_url_template():
    """Lấy template URL tile (có prefix snapshot, ví dụ planet/20260913_164504_pt/{z}/{x}/{y}.pbf)
    từ tileset JSON — URL cứng sẽ hỏng mỗi khi OpenFreeMap release snapshot mới."""
    global _URL_TEMPLATE
    if _URL_TEMPLATE is None:
        req = urllib.request.Request(TILESET_JSON, headers={"User-Agent": UA})
        with urllib.request.urlopen(req, timeout=30) as r:
            data = json.loads(r.read())
        _URL_TEMPLATE = data["tiles"][0]
        assert "{z}/{x}/{y}" in _URL_TEMPLATE, f"URL template không hợp lệ: {_URL_TEMPLATE}"
    return _URL_TEMPLATE


def deg2tile(lon, lat, z):
    n = 2 ** z
    tx = int((lon + 180.0) / 360.0 * n)
    ty = int((1.0 - math.asinh(math.tan(math.radians(lat))) / math.pi) / 2.0 * n)
    return max(0, min(n - 1, tx)), max(0, min(n - 1, ty))


def tile_range(z, pad=1):
    """Trả về (x0, y0, x1, y1) theo slippy tile coordinate."""
    if z <= WORLD_MAX_Z:
        return 0, 0, 2 ** z - 1, 2 ** z - 1
    bbox = SEA if z <= SEA_MAX_Z else VN
    minlat, minlon, maxlat, maxlon = bbox
    x0, y0 = deg2tile(minlon, maxlat, z)  # góc tây-bắc
    x1, y1 = deg2tile(maxlon, minlat, z)  # góc đông-nam
    n = 2 ** z
    x0 = max(0, x0 - pad)
    y0 = max(0, y0 - pad)
    x1 = min(n - 1, x1 + pad)
    y1 = min(n - 1, y1 + pad)
    return x0, y0, x1, y1


def fetch(z, x, y, retries=4):
    """Tải tile, trả về (z, x, tile_row_tms, data) hoặc data=None nếu lỗi."""
    for a in range(retries):
        try:
            url = tile_url_template().replace("{z}", str(z)).replace("{x}", str(x)).replace("{y}", str(y))
            req = urllib.request.Request(url, headers={"User-Agent": UA})
            with urllib.request.urlopen(req, timeout=30) as r:
                if r.status == 200:
                    data = r.read()
                    if len(data) >= 4:
                        return (z, x, (2 ** z - 1) - y, data)
        except Exception:
            pass
        time.sleep(1.0 * (2 ** a))
    return (z, x, (2 ** z - 1) - y, None)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-zoom", type=int, default=0)
    ap.add_argument("--max-zoom", type=int, default=13)
    ap.add_argument("--workers", type=int, default=8)
    ap.add_argument("--out", default="vietnam.mbtiles")
    args = ap.parse_args()

    db = sqlite3.connect(args.out)
    db.execute("PRAGMA journal_mode=WAL")
    db.execute("PRAGMA synchronous=NORMAL")
    db.execute(
        """CREATE TABLE IF NOT EXISTS tiles (
            zoom_level INTEGER NOT NULL,
            tile_column INTEGER NOT NULL,
            tile_row INTEGER NOT NULL,
            tile_data BLOB NOT NULL,
            PRIMARY KEY (zoom_level, tile_column, tile_row))"""
    )
    db.execute("CREATE TABLE IF NOT EXISTS metadata (name TEXT, value TEXT)")
    db.execute("PRAGMA user_version=3")

    for z in range(args.min_zoom, args.max_zoom + 1):
        x0, y0, x1, y1 = tile_range(z)
        coords = [(z, x, y) for y in range(y0, y1 + 1) for x in range(x0, x1 + 1)]
        total = len(coords)
        print(f"[z{z}] {total} tiles (x {x0}-{x1}, y {y0}-{y1})", flush=True)
        ok = miss = 0
        batch = []
        with ThreadPoolExecutor(max_workers=args.workers) as ex:
            futs = [ex.submit(fetch, z, x, y) for (z, x, y) in coords]
            for i, f in enumerate(as_completed(futs)):
                zz, xx, yy, data = f.result()
                if data is not None:
                    batch.append((zz, xx, yy, data))
                    ok += 1
                else:
                    miss += 1
                if len(batch) >= 500:
                    db.executemany(
                        "INSERT OR REPLACE INTO tiles VALUES (?,?,?,?)", batch
                    )
                    batch = []
                    db.commit()
                if (i + 1) % 1000 == 0:
                    print(f"  {i + 1}/{total} ok={ok} miss={miss}", flush=True)
        if batch:
            db.executemany("INSERT OR REPLACE INTO tiles VALUES (?,?,?,?)", batch)
        db.commit()
        print(f"[z{z}] done: ok={ok} miss={miss}", flush=True)

    meta = [
        ("name", "Vietnam Offline Vector (OpenFreeMap planet)"),
        ("description", "Generated for SpeedNotify by tools/make_vietnam_mbtiles.py"),
        ("format", "pbf"),
        ("bounds", "102.0,8.5,109.5,23.5"),
        ("minzoom", str(args.min_zoom)),
        ("maxzoom", str(args.max_zoom)),
        ("center", "105.8542,21.0285,5"),
        ("attribution", "\u00a9 OpenStreetMap contributors \u00a9 OpenFreeMap"),
    ]
    db.executemany("INSERT OR REPLACE INTO metadata VALUES (?,?)", meta)
    db.commit()
    db.execute("VACUUM")
    db.close()
    size = os.path.getsize(args.out)
    print(f"DONE: {args.out} = {size / 1e9:.2f} GB", flush=True)


if __name__ == "__main__":
    main()