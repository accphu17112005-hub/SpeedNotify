package com.speednotify.map

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.RectF

/**
 * Sinh bitmap marker cho bản đồ MapLibre v13:
 * - [makeCameraPin]: badge tròn viền màu + icon camera CCTV vẽ bằng Canvas
 * - [makeCarPuck]: mũi tên tam giác xanh đậm chỉ hướng di chuyển (navigation arrow)
 *
 * MapLibre v13: style.addImage(name, Bitmap) — không còn Property.Image wrapper.
 * Port từ dự án tham chiếu (vietmap_live_android), vẽ glyph trực tiếp bằng Paint
 * để không phụ thuộc icon drawable.
 */
object CameraMarkerHelper {

    private const val SIZE_DP = 46

    fun makeCameraPin(context: Context, borderColor: Int): Bitmap {
        val density = context.resources.displayMetrics.density
        val sizePx = (SIZE_DP * density).toInt()
        val radius = sizePx / 2f
        val center = radius

        val bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)

        // Màu viền phân biệt loại camera, nền trắng tăng tương phản trên bản đồ sáng.
        val ring = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = borderColor
            style = Paint.Style.FILL
        }
        canvas.drawCircle(center, center, radius, ring)

        val bg = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.WHITE
        }
        canvas.drawCircle(center, center, radius * 0.86f, bg)

        // Icon camera CCTV tối màu để nổi rõ trên nền biển trắng.
        val cameraInk = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.parseColor("#17312D")
            style = Paint.Style.FILL
        }
        val bodyW = sizePx * 0.42f
        val bodyH = sizePx * 0.26f
        val bodyRect = RectF(
            center - bodyW / 2f, center - bodyH / 2f - sizePx * 0.04f,
            center + bodyW / 2f, center + bodyH / 2f - sizePx * 0.04f
        )
        canvas.drawRoundRect(bodyRect, bodyH * 0.4f, bodyH * 0.4f, cameraInk)
        // Ống kính
        canvas.drawCircle(center + bodyW * 0.18f, center - bodyH * 0.5f, sizePx * 0.07f, cameraInk)
        // Chân đế
        val standW = sizePx * 0.16f
        val standH = sizePx * 0.10f
        canvas.drawRect(
            center - standW / 2f, center + bodyH / 2f - sizePx * 0.02f,
            center + standW / 2f, center + bodyH / 2f + standH - sizePx * 0.02f, cameraInk
        )

        return bitmap
    }

    /**
     * Tạo bitmap mũi tên hình tam giác điều hướng (Navigation Triangle Arrow).
     * Mũi tên chỉ hướng lên trên (0 độ = Bắc) để xoay theo bearing GPS.
     */
    fun makeCarPuck(context: Context): Bitmap {
        val density = context.resources.displayMetrics.density
        val sizePx = (38 * density).toInt()

        val bitmap = Bitmap.createBitmap(sizePx, sizePx, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bitmap)

        val cx = sizePx / 2f
        val topY = sizePx * 0.08f
        val botY = sizePx * 0.90f
        val notchY = sizePx * 0.72f
        val leftX = sizePx * 0.14f
        val rightX = sizePx * 0.86f

        // Đường dẫn hình tam giác điều hướng
        val arrowPath = android.graphics.Path().apply {
            moveTo(cx, topY)
            lineTo(rightX, botY)
            lineTo(cx, notchY)
            lineTo(leftX, botY)
            close()
        }

        // 1. Đổ bóng mờ phía dưới mũi tên tạo chiều sâu (elevation)
        val shadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.parseColor("#45000000")
            style = Paint.Style.FILL
        }
        val shadowPath = android.graphics.Path(arrowPath).apply {
            offset(0f, 2.5f * density)
        }
        canvas.drawPath(shadowPath, shadowPaint)

        // 2. Viền trắng nổi bật trên mọi nền bản đồ (sáng hoặc tối)
        val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.WHITE
            style = Paint.Style.STROKE
            strokeWidth = 3.5f * density
            strokeJoin = Paint.Join.ROUND
            strokeCap = Paint.Cap.ROUND
        }
        canvas.drawPath(arrowPath, strokePaint)

        // 3. Nền xanh đậm điều hướng (Dark Royal Blue)
        val fillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.parseColor("#1E40AF")
            style = Paint.Style.FILL
        }
        canvas.drawPath(arrowPath, fillPaint)

        // 4. Đổ bóng một nửa bên phải tạo khối 3D cho mũi tên (như Google Maps / Apple Maps)
        val halfPath = android.graphics.Path().apply {
            moveTo(cx, topY)
            lineTo(rightX, botY)
            lineTo(cx, notchY)
            close()
        }
        val shadePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.parseColor("#20000000")
            style = Paint.Style.FILL
        }
        canvas.drawPath(halfPath, shadePaint)

        return bitmap
    }
}