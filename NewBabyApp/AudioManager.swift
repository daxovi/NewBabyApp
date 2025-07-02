import AVFoundation
import MediaPlayer
import Combine
import UIKit

/// Global audio manager that keeps playback alive even when the app
/// goes to the background. Uses `AVPlayer` so we can display system
/// media controls on the lock screen.
class AudioManager: NSObject, ObservableObject {
    static let shared = AudioManager()

    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var currentTitle: String = ""
    @Published var currentFile: String? = nil

    var currentTime: TimeInterval {
        guard let player else { return 0 }
        return CMTimeGetSeconds(player.currentTime())
    }

    var duration: TimeInterval {
        guard let item = player?.currentItem else { return 0 }
        return CMTimeGetSeconds(item.asset.duration)
    }

    private var player: AVPlayer?
    private var timeObserver: Any?

    private override init() {
        super.init()
        configureAudioSession()
        setupRemoteTransportControls()
        observeLifecycle()
    }

    deinit {
        removeTimeObserver()
        NotificationCenter.default.removeObserver(self)
    }

    func togglePlay(fileName: String, title: String) {
        if currentFile != fileName {
            load(fileName: fileName, title: title)
        }
        guard player != nil else { return }
        if isPlaying {
            pause()
        } else {
            play()
        }
    }

    func play() {
        guard let player else { return }
        player.play()
        isPlaying = true
        if timeObserver == nil { startTimer() }
        updateNowPlaying(playbackRate: 1)
    }

    func pause() {
        guard let player else { return }
        player.pause()
        isPlaying = false
        updateNowPlaying(playbackRate: 0)
    }

    func seek(to progress: Double) {
        guard let player = player, let item = player.currentItem else { return }
        let clamped = max(0, min(progress, 1))
        let newTime = clamped * CMTimeGetSeconds(item.asset.duration)
        player.seek(to: CMTime(seconds: newTime, preferredTimescale: 600))
        self.progress = clamped
        updateNowPlaying(playbackRate: isPlaying ? 1 : 0)
    }

    // MARK: - Private

    private func load(fileName: String, title: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") {
            removeTimeObserver()
            let item = AVPlayerItem(url: url)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerDidFinishPlaying),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: item)
            player = AVPlayer(playerItem: item)
            currentFile = fileName
            currentTitle = title
            progress = 0
            startTimer()
            updateNowPlaying()
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
        guard let player else { return }
        removeTimeObserver()
        let interval = CMTime(seconds: 0.5, preferredTimescale: 600)
        timeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: .main) { [weak self] time in
            guard let self, let item = player.currentItem else { return }
            let duration = CMTimeGetSeconds(item.asset.duration)
            if duration > 0 {
                self.progress = CMTimeGetSeconds(time) / duration
            } else {
                self.progress = 0
            }
            self.updateNowPlaying(playbackRate: self.isPlaying ? 1 : 0)
        }
    }

    private func removeTimeObserver() {
        if let observer = timeObserver, let player = player {
            player.removeTimeObserver(observer)
            timeObserver = nil
        }
    }

    private func updateNowPlaying(playbackRate: Float = 0) {
        guard let player = player, let item = player.currentItem else { return }
        let elapsed = CMTimeGetSeconds(player.currentTime())
        let duration = CMTimeGetSeconds(item.asset.duration)
        MPNowPlayingInfoCenter.default().nowPlayingInfo = [
            MPMediaItemPropertyTitle: currentTitle,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: elapsed,
            MPMediaItemPropertyPlaybackDuration: duration,
            MPNowPlayingInfoPropertyPlaybackRate: playbackRate
        ]
    }

    // MARK: - Player Notifications

    @objc private func playerDidFinishPlaying() {
        isPlaying = false
        progress = 0
        removeTimeObserver()
        updateNowPlaying(playbackRate: 0)
    }
}
