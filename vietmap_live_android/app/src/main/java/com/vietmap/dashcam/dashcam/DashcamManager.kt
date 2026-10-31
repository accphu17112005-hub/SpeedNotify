package com.vietmap.dashcam.dashcam

import android.util.Log
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.net.HttpURLConnection
import java.net.URL

/**
 * Quản lý kết nối và điều khiển Camera Hành Trình (Dashcam) qua CGI / Local HTTP APIs
 * Hỗ trợ các chip: Hisilicon, Novatek, MStar / SigmaStar, JL
 *
 * Các endpoint dưới đây lấy từ reverse-engineer app Vietmap Live (không có tài liệu API
 * chính thức của hãng chip). Những chỗ tên tham số/ID lệnh không được xác nhận rõ trong
 * nguồn gốc đều có ghi chú "chưa xác nhận" — cần bắt gói tin thực tế trên đúng camera nếu
 * gọi không thành công.
 */
class DashcamManager {

    enum class Chipset {
        HISILICON, NOVATEK, MSTAR, JIELI, UNKNOWN
    }

    private var currentChipset: Chipset = Chipset.NOVATEK
    private var cameraIp: String = "192.168.1.254" // Default Novatek IP

    fun setCameraConfig(chipset: Chipset, ip: String) {
        this.currentChipset = chipset
        this.cameraIp = ip
    }

    /**
     * Lấy URL RTSP Stream để xem trực tiếp (Live View)
     */
    fun getRtspStreamUrl(): String {
        return when (currentChipset) {
            Chipset.HISILICON -> "rtsp://$cameraIp:554/livestream/"
            Chipset.NOVATEK -> "rtsp://$cameraIp/xxx.mov"
            Chipset.MSTAR -> "rtsp://$cameraIp/liveRTSP/v1"
            Chipset.JIELI -> "rtsp://$cameraIp:554/264_rt/XXX.sd"
            Chipset.UNKNOWN -> "rtsp://$cameraIp:554/live"
        }
    }

    /**
     * Gửi lệnh chụp ảnh nhanh từ Dashcam
     */
    suspend fun snapPhoto(): Boolean = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=1001"
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/getcameravalues.cgi?&-act=snap"
            Chipset.MSTAR -> "http://$cameraIp/cgi-bin/Config.cgi?action=set&property=Snapshot"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Bắt đầu hoặc Dừng ghi hình Video trên Camera
     */
    suspend fun toggleVideoRecording(start: Boolean): Boolean = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=2001&par=${if (start) 1 else 0}"
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/setcamparam.cgi?&-record=${if (start) 1 else 0}"
            Chipset.MSTAR -> "http://$cameraIp/cgi-bin/Config.cgi?action=set&property=Video&value=${if (start) "start" else "stop"}"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Đồng bộ thời gian hệ thống và GPS vào Camera
     */
    suspend fun syncSystemTime(): Boolean = withContext(Dispatchers.IO) {
        val timestamp = System.currentTimeMillis() / 1000
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/setsystime.cgi?&-time=$timestamp"
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=3024&time=$timestamp"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Lấy trạng thái thẻ nhớ (dung lượng, đã format hay chưa, v.v. — tùy nội dung camera trả về)
     */
    suspend fun getSdCardStatus(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/getsdstatus.cgi?"
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=3017"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    /**
     * Format thẻ nhớ trên camera — thao tác XÓA TOÀN BỘ dữ liệu, chỉ gọi khi người dùng xác nhận.
     */
    suspend fun formatSdCard(): Boolean = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/sdcommand.cgi?&-format"
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=3010"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Lấy danh sách file media (video/ảnh) đang lưu trên thẻ nhớ camera
     */
    suspend fun getFileList(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/getdirfilelist.cgi?"
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=3015"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    /**
     * Xóa 1 file trên thẻ nhớ camera theo tên (lấy từ [getFileList]).
     * Tên tham số truyền filename (-name / name) chưa được xác nhận trong nguồn gốc-engineer
     * (chỉ biết tên cgi/cmd id) — nếu không xóa được, cần bắt gói tin thực tế để đối chiếu.
     */
    suspend fun deleteFile(fileName: String): Boolean = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/deletefile.cgi?&-name=$fileName"
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=4003&name=$fileName"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Lấy cấu hình WiFi hiện tại của camera (SSID...). Chỉ xác nhận có trên chip Hisilicon.
     */
    suspend fun getWifiConfig(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/getwifi.cgi?"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    /**
     * Đổi SSID/mật khẩu WiFi hotspot của camera. Tên tham số (-ssid/-pwd) chưa được xác nhận
     * trong nguồn gốc-engineer — nếu không áp dụng được, cần bắt gói tin thực tế để đối chiếu.
     */
    suspend fun setWifiConfig(ssid: String, password: String): Boolean = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.HISILICON -> "http://$cameraIp/cgi-bin/hisnet/setwifi.cgi?&-ssid=$ssid&-pwd=$password"
            else -> ""
        }
        return@withContext sendHttpRequest(endpoint)
    }

    /**
     * Lấy dung lượng / thời lượng ghi hình còn lại trên thẻ nhớ (chỉ xác nhận trên Novatek).
     */
    suspend fun getRecordingRemaining(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=2009"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    /**
     * Lấy dữ liệu tọa độ GPS gắn kèm video đã ghi (getVideoGps, chỉ xác nhận trên Novatek).
     */
    suspend fun getVideoGpsData(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.NOVATEK -> "http://$cameraIp/?custom=1&cmd=9945"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    /**
     * Cài đặt nâng cao trên Novatek (chế độ đỗ xe/Parking Mode, G-Sensor, cảnh báo giọng nói,
     * hiển thị tốc độ, GPS stamp...) — nguồn gốc-engineer chỉ xác nhận dải lệnh cmd=6800-6859
     * dùng cho nhóm tính năng này, KHÔNG xác định được cmd id chính xác cho từng tính năng cụ
     * thể. Truyền đúng [cmdId] đã xác nhận trên camera thật (bắt gói tin) trước khi dùng.
     */
    suspend fun sendAdvancedSetting(cmdId: Int, value: Int): Boolean = withContext(Dispatchers.IO) {
        require(cmdId in 6800..6859) { "cmdId phải trong dải 6800-6859 (advanced settings Novatek)" }
        if (currentChipset != Chipset.NOVATEK) return@withContext false
        return@withContext sendHttpRequest("http://$cameraIp/?custom=1&cmd=$cmdId&par=$value")
    }

    /**
     * Tải danh mục menu/cấu hình tùy chỉnh của camera (chỉ xác nhận trên MStar/SigmaStar).
     */
    suspend fun getCameraMenu(): String? = withContext(Dispatchers.IO) {
        val endpoint = when (currentChipset) {
            Chipset.MSTAR -> "http://$cameraIp/cdv/cammenu.xml"
            else -> ""
        }
        return@withContext sendHttpGetForBody(endpoint)
    }

    private fun sendHttpRequest(urlString: String): Boolean {
        if (urlString.isEmpty()) return false
        return try {
            val url = URL(urlString)
            val conn = url.openConnection() as HttpURLConnection
            conn.connectTimeout = 3000
            conn.readTimeout = 3000
            conn.requestMethod = "GET"
            val responseCode = conn.responseCode
            conn.disconnect()
            Log.d("DashcamManager", "Sent command to $urlString -> Response: $responseCode")
            responseCode in 200..299
        } catch (e: Exception) {
            Log.w("DashcamManager", "Không thể kết nối tới Dashcam ($urlString): ${e.message}")
            false
        }
    }

    /** Giống [sendHttpRequest] nhưng đọc và trả về nội dung response — dùng cho các endpoint "get" (status/list/config). */
    private fun sendHttpGetForBody(urlString: String): String? {
        if (urlString.isEmpty()) return null
        return try {
            val url = URL(urlString)
            val conn = url.openConnection() as HttpURLConnection
            conn.connectTimeout = 3000
            conn.readTimeout = 3000
            conn.requestMethod = "GET"
            val responseCode = conn.responseCode
            val body = if (responseCode in 200..299) {
                conn.inputStream.bufferedReader().use { it.readText() }
            } else {
                null
            }
            conn.disconnect()
            Log.d("DashcamManager", "GET $urlString -> Response: $responseCode")
            body
        } catch (e: Exception) {
            Log.w("DashcamManager", "Không thể kết nối tới Dashcam ($urlString): ${e.message}")
            null
        }
    }
}
