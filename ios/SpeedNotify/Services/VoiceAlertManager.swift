import Foundation
import AVFoundation
import AudioToolbox

/// Quản lý phát âm thanh cảnh báo và giọng đọc tiếng Việt qua AVSpeechSynthesizer (Port từ AudioManagerHelper.kt)
public final class VoiceAlertManager: NSObject, AVSpeechSynthesizerDelegate {
    public static let shared = VoiceAlertManager()

    private let speechSynthesizer = AVSpeechSynthesizer()
    private var audioPlayer: AVAudioPlayer?
    private var vietnameseVoice: AVSpeechSynthesisVoice?

    // Cooldown giữa các cảnh báo (12 giây, khớp với WARNING_COOLDOWN_MS trên Android)
    private var lastSpeedWarningTime: TimeInterval = 0
    private var lastCameraWarningTime: TimeInterval = 0
    private let warningCooldownSeconds: TimeInterval = 12.0

    override private init() {
        super.init()
        speechSynthesizer.delegate = self
        setupAudioSession()
        findVietnameseVoice()
    }

    private func setupAudioSession() {
        do {
            let session = AVAudioSession.sharedInstance()
            // Cho phép phát âm thanh nền và giảm nhỏ tiếng nhạc của app khác khi phát cảnh báo (Audio Ducking)
            try session.setCategory(.playback, mode: .voicePrompt, options: [.duckOthers, .interruptSpokenAudioAndMixWithOthers])
            try session.setActive(true)
        } catch {
            // Log ignored
        }
    }

    private func findVietnameseVoice() {
        // Tìm giọng đọc tiếng Việt được cài đặt trên iOS (vi-VN)
        vietnameseVoice = AVSpeechSynthesisVoice(language: "vi-VN")
    }

    /// Phát cảnh báo giọng nói bằng tiếng Việt
    public func speak(_ text: String, force: Bool = false) {
        if !force && speechSynthesizer.isSpeaking {
            return
        }

        // Đảm bảo audio session đang active
        try? AVAudioSession.sharedInstance().setActive(true)

        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = vietnameseVoice ?? AVSpeechSynthesisVoice(language: "vi-VN")
        utterance.rate = AVSpeechUtteranceDefaultSpeechRate * 0.95 // Tốc độ vừa phải, rõ ràng khi lái xe
        utterance.pitchMultiplier = 1.0
        utterance.volume = 1.0

        if speechSynthesizer.isSpeaking {
            speechSynthesizer.stopSpeaking(at: .immediate)
        }
        speechSynthesizer.speak(utterance)
    }

    /// Phát cảnh báo vượt tốc độ
    public func warnOverSpeed(currentSpeed: Double, speedLimit: Int) {
        let now = Date().timeIntervalSince1970
        guard now - lastSpeedWarningTime >= warningCooldownSeconds else { return }
        lastSpeedWarningTime = now

        // Phát âm thanh bíp cảnh báo trước, sau đó phát giọng nói
        playSound(named: "warning_speed")

        let message = "Cảnh báo vượt tốc độ! Tốc độ hiện tại \(Int(currentSpeed)) ki lô mét trên giờ, giới hạn \(speedLimit)."
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            self?.speak(message)
        }
    }

    /// Phát cảnh báo camera phía trước
    public func warnCameraAhead(camera: Camera, distanceMeters: Double) {
        let now = Date().timeIntervalSince1970
        guard now - lastCameraWarningTime >= warningCooldownSeconds else { return }
        lastCameraWarningTime = now

        let soundName: String
        let message: String
        let distInt = Int(distanceMeters)

        switch camera.type {
        case .speed:
            soundName = "warning_camera"
            if camera.speedLimit > 0 {
                message = "Phía trước \(distInt) mét có camera bắn tốc độ, giới hạn \(camera.speedLimit) ki lô mét trên giờ."
            } else {
                message = "Phía trước \(distInt) mét có camera bắn tốc độ."
            }
        case .redlight:
            soundName = "warning_redlight"
            message = "Phía trước \(distInt) mét có camera phạt nguội vượt đèn đỏ."
        case .ai:
            soundName = "warning_camera"
            message = "Phía trước \(distInt) mét có camera AI phạt nguội."
        case .other:
            soundName = "warning_generic"
            message = "Phía trước \(distInt) mét có camera giao thông."
        }

        playSound(named: soundName)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
            self?.speak(message)
        }
    }

    /// Phát âm thanh hiệu ứng từ file .wav đi kèm
    public func playSound(named soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            // Fallback system sound
            AudioServicesPlaySystemSound(1005)
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            AudioServicesPlaySystemSound(1005)
        }
    }
}

