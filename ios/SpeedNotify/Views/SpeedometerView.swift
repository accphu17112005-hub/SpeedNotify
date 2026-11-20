import SwiftUI

/// Đồng hồ đo tốc độ phong cách HUD xe hơi hiện đại
public struct SpeedometerView: View {
    public let currentSpeedKmh: Double
    public let speedLimit: Int
    public let isOverSpeed: Bool
    public var size: CGFloat = 260

    private var progress: Double {
        let maxDisplaySpeed: Double = 160.0
        return min(max(currentSpeedKmh / maxDisplaySpeed, 0.0), 1.0)
    }

    private var speedColor: Color {
        if isOverSpeed {
            return Color.red
        }
        if speedLimit > 0 && currentSpeedKmh > Double(speedLimit) - 5 {
            return Color.orange
        }
        return Color.cyan
    }

    public var body: some View {
        ZStack {
            // Vòng cung nền (240 độ)
            Circle()
                .trim(from: 0.15, to: 0.85)
                .stroke(
                    Color.white.opacity(0.12),
                    style: StrokeStyle(lineWidth: 18, lineCap: .round)
                )
                .rotationEffect(.degrees(90))
                .frame(width: size, height: size)

            // Vòng cung tốc độ với hiệu ứng chuyển màu
            Circle()
                .trim(from: 0.15, to: 0.15 + (progress * 0.70))
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [
                            Color.cyan,
                            Color.green,
                            Color.yellow,
                            speedColor
                        ]),
                        center: .center,
                        startAngle: .degrees(144),
                        endAngle: .degrees(396)
                    ),
                    style: StrokeStyle(lineWidth: 18, lineCap: .round)
                )
                .rotationEffect(.degrees(90))
                .frame(width: size, height: size)
                .animation(.easeOut(duration: 0.3), value: currentSpeedKmh)

            // Vạch chia tốc độ (Tick marks)
            ForEach(0..<17) { index in
                Rectangle()
                    .fill(Color.white.opacity(index % 2 == 0 ? 0.4 : 0.2))
                    .frame(width: index % 2 == 0 ? 3 : 1.5, height: index % 2 == 0 ? 10 : 6)
                    .offset(y: -(size / 2 - 24))
                    .rotationEffect(.degrees(Double(index) * 15.0 - 120.0))
            }

            // Màn hình hiển thị số tốc độ điện tử trung tâm
            VStack(spacing: 2) {
                Text("\(Int(currentSpeedKmh))")
                    .font(.system(size: size * 0.34, weight: .bold, design: .rounded))
                    .foregroundColor(isOverSpeed ? .red : .white)
                    .contentTransition(.numericText())
                    .shadow(color: speedColor.opacity(0.6), radius: isOverSpeed ? 12 : 6, x: 0, y: 0)

                Text("KM/H")
                    .font(.system(size: 16, weight: .heavy, design: .monospaced))
                    .foregroundColor(Color.gray)
                    .tracking(2)

                if isOverSpeed {
                    HStack(spacing: 4) {
                        Image(systemName: "exclamationmark.triangle.fill")
                        Text("QUÁ TỐC ĐỘ")
                    }
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(.red)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(8)
                    .padding(.top, 4)
                }
            }
        }
        .frame(width: size, height: size)
    }
}

#Preview {
    ZStack {
        Color.black.edgesIgnoringSafeArea(.all)
        VStack(spacing: 40) {
            SpeedometerView(currentSpeedKmh: 45, speedLimit: 50, isOverSpeed: false)
            SpeedometerView(currentSpeedKmh: 85, speedLimit: 80, isOverSpeed: true)
        }
    }
}

