import SwiftUI

/// Màn hình lịch sử các chuyến đi đã hoàn thành
public struct TripHistoryView: View {
    @ObservedObject var tripRecorder = TripRecorder.shared
    @State private var showingClearConfirmation = false

    public var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.07, green: 0.08, blue: 0.11)
                    .edgesIgnoringSafeArea(.all)

                if tripRecorder.tripHistory.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "road.lanes")
                            .font(.system(size: 60))
                            .foregroundColor(.gray.opacity(0.4))
                        Text("Chưa có lịch sử chuyến đi")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        Text("Khi bạn bật \"BẮT ĐẦU CHẠY\" trên bảng điều khiển, các chuyến đi sẽ được ghi nhận tại đây.")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                    }
                } else {
                    List {
                        ForEach(tripRecorder.tripHistory) { trip in
                            tripCard(trip)
                                .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Lịch sử chuyến đi")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                if !tripRecorder.tripHistory.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: { showingClearConfirmation = true }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .confirmationDialog("Xóa toàn bộ lịch sử chuyến đi?", isPresented: $showingClearConfirmation, titleVisibility: .visible) {
                Button("Xóa tất cả", role: .destructive) {
                    tripRecorder.clearHistory()
                }
                Button("Hủy", role: .cancel) {}
            }
        }
    }

    private func tripCard(_ trip: TripRecord) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "calendar")
                        .foregroundColor(.cyan)
                    Text(formatDate(trip.startTime))
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                }
                Spacer()
                Text(trip.formattedDuration)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray)
            }

            Divider()
                .background(Color.white.opacity(0.08))

            HStack(spacing: 24) {
                statItem(title: "Quãng đường", value: trip.formattedDistance, icon: "arrow.triangle.swap")
                statItem(title: "Tốc độ TB", value: "\(Int(trip.averageSpeedKmh)) km/h", icon: "gauge.medium")
                statItem(title: "Tốc độ tối đa", value: "\(Int(trip.maxSpeedKmh)) km/h", icon: "gauge.badge.plus")
            }
        }
        .padding(14)
        .background(Color.white.opacity(0.04))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.08), lineWidth: 1)
        )
    }

    private func statItem(title: String, value: String, icon: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm, dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

#Preview {
    TripHistoryView()
}

