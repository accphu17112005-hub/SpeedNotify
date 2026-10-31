package com.vietmap.dashcam.map

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RectF

/**
 * Helper tạo Bitmap icon camera dạng pin tròn / giọt nước 
 * có hình ống kính camera giám sát bên trong giống Vietmap / VinFast map.
 */
object CameraMarkerHelper {

    private const val PIN_SIZE_DP = 40f

    fun makeCameraPin(context: Context, strokeColor: Int = Color.parseColor("#38BDF8")): Bitmap {
        val dp = context.resources.displayMetrics.density
        val size = (PIN_SIZE_DP * dp).toInt()

        val bmp = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bmp)
        val p = Paint(Paint.ANTI_ALIAS_FLAG)

        val cx = size / 2f
        val cy = size / 2f
        val radius = size / 2f - 2f * dp

        // 1. Drop shadow nhẹ
        p.color = Color.argb(80, 0, 0, 0)
        p.setShadowLayer(4f * dp, 0f, 2f * dp, Color.argb(100, 0, 0, 0))
        canvas.drawCircle(cx, cy, radius, p)
        p.clearShadowLayer()

        // 2. Viền ngoài màu xanh / nổi bật
        p.color = strokeColor
        canvas.drawCircle(cx, cy, radius, p)

        // 3. Nền trong màu xanh đen đậm (Dark Slate / Navy)
        p.color = Color.parseColor("#0F172A")
        canvas.drawCircle(cx, cy, radius - 2.5f * dp, p)

        // 4. Biểu tượng Camera CCTV màu trắng nghiêng bên trong
        p.color = Color.WHITE
        p.style = Paint.Style.FILL

        // Thân camera (Rounded Rect nghiêng nhẹ hoặc nằm ngang)
        val bodyW = radius * 0.9f
        val bodyH = radius * 0.5f
        val bodyRect = RectF(
            cx - bodyW * 0.45f,
            cy - bodyH * 0.4f,
            cx + bodyW * 0.35f,
            cy + bodyH * 0.4f
        )
        canvas.drawRoundRect(bodyRect, 3f * dp, 3f * dp, p)

        // Ống kính camera hướng về góc trái
        val lensPath = Path().apply {
            moveTo(bodyRect.left, cy - bodyH * 0.25f)
            lineTo(bodyRect.left - bodyW * 0.28f, cy - bodyH * 0.45f)
            lineTo(bodyRect.left - bodyW * 0.28f, cy + bodyH * 0.45f)
            lineTo(bodyRect.left, cy + bodyH * 0.25f)
            close()
        }
        canvas.drawPath(lensPath, p)

        // Chân đế camera (Mounting bracket) ở bên phải
        p.strokeWidth = 2f * dp
        p.style = Paint.Style.STROKE
        p.color = Color.WHITE
        val bracketPath = Path().apply {
            moveTo(bodyRect.right, cy)
            lineTo(bodyRect.right + bodyW * 0.25f, cy + bodyH * 0.4f)
        }
        canvas.drawPath(bracketPath, p)

        // Chấm đỏ LED cảnh báo trên thân camera
        p.style = Paint.Style.FILL
        p.color = Color.parseColor("#EF4444")
        canvas.drawCircle(bodyRect.right - 3f * dp, bodyRect.top + 3f * dp, 1.8f * dp, p)

        return bmp
    }

    private const val CAR_PUCK_SIZE_DP = 32f

    /** Chấm tròn "vị trí của bạn" kiểu Google Maps: viền trắng + halo mờ + tâm xanh dương. */
    fun makeCarPuck(context: Context): Bitmap {
        val dp = context.resources.displayMetrics.density
        val size = (CAR_PUCK_SIZE_DP * dp).toInt()

        val bmp = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888)
        val canvas = Canvas(bmp)
        val p = Paint(Paint.ANTI_ALIAS_FLAG)

        val cx = size / 2f
        val cy = size / 2f
        val outerRadius = size / 2f - 2f * dp

        // Halo mờ xung quanh để dễ thấy trên nền bản đồ
        p.color = Color.argb(60, 56, 189, 248)
        canvas.drawCircle(cx, cy, outerRadius, p)

        // Viền trắng
        p.color = Color.WHITE
        canvas.drawCircle(cx, cy, outerRadius * 0.62f, p)

        // Tâm xanh dương
        p.color = Color.parseColor("#2563EB")
        canvas.drawCircle(cx, cy, outerRadius * 0.48f, p)

        return bmp
    }
}
