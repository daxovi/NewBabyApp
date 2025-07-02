import AVFoundation
import MediaPlayer
import Combine
import UIKit

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    static let shared = AudioManager()

    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var currentTitle: String = ""
    @Published var currentFile: String? = nil

    var currentTime: TimeInterval { player?.currentTime ?? 0 }
    var duration: TimeInterval { player?.duration ?? 0 }

    private var player: AVAudioPlayer?
    private var timer: Timer?

    private override init() {
        super.init()
        configureAudioSession()
        setupRemoteTransportControls()
        observeLifecycle()
    }

    func togglePlay(fileName: String, title: String) {
        if currentFile != fileName {
            load(fileName: fileName, title: title)
        }
        guard let player else { return }
        if player.isPlaying {
            pause()
        } else {
            play()
        }
    }

    func play() {
        guard let player else { return }
        player.play()
        isPlaying = true
        startTimer()
        updateNowPlaying(playbackRate: 1)
    }

    func pause() {
        guard let player else { return }
        player.pause()
        isPlaying = false
        stopTimer()
        updateNowPlaying(playbackRate: 0)
    }

    func seek(to progress: Double) {
        guard let player else { return }
        let clamped = max(0, min(progress, 1))
        player.currentTime = clamped * player.duration
        self.progress = clamped
        updateNowPlaying(playbackRate: player.isPlaying ? 1 : 0)
    }

    // MARK: - Private

    private func load(fileName: String, title: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
            currentFile = fileName
            currentTitle = title
            progress = 0
        }
    }

    private func configureAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback, mode: .spokenAudio, options: [.allowAirPlay, .allowBluetooth])
            try session.setActive(true)
            UIApplication.shared.beginReceivingRemoteControlEvents()
        } catch {
            print("Audio session setup failed: \(error)")
        }
    }

    private func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.play(); return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.pause(); return .success
        }
    }

    private func observeLifecycle() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(activateSession),
                                               name: UIApplication.didEnterBackgroundNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(activateSession),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
    }

    @objc private func activateSession() {
        try? AVAudioSession.sharedInstance().setActive(true)
    }

    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self, let player = self.player else { return }
            self.progress = player.duration > 0 ? player.currentTime / player.duration : 0
            self.updateNowPlaying(playbackRate: player.isPlaying ? 1 : 0)
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func updateNowPlaying(playbackRate: Float = 0) {
        guard let player else { return }
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: currentTitle,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: player.currentTime,
            MPMediaItemPropertyPlaybackDuration: player.duration,
            MPNowPlayingInfoPropertyPlaybackRate: playbackRate
        ]
    }

    // MARK: - AVAudioPlayerDelegate

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        progress = 0
        stopTimer()
        updateNowPlaying(playbackRate: 0)
    }
}
