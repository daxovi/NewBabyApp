import AVFoundation
import MediaPlayer
import Combine
import SwiftUI

class AudioManager: NSObject, ObservableObject, AVAudioPlayerDelegate {
    static let shared = AudioManager()

    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0
    @Published var currentTitle: String = ""
    @Published var currentFile: String? = nil
    @Published var isOverlayPlayerVisible: Bool = false

    var currentTime: TimeInterval { player?.currentTime ?? 0 }
    var duration: TimeInterval {
        guard let player else { return 0 }
        if #available(iOS 16.0, *) {
            return player.duration
        } else {
            return player.duration
        }
    }

    private var player: AVAudioPlayer?
    private var timer: Timer?

    private override init() {
        super.init()
        configureAudioSession()
        setupRemoteTransportControls()
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
        isOverlayPlayerVisible = true
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
    
    func stop() {
        pause()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.isOverlayPlayerVisible = false
        }
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
        try? session.setCategory(.playback, mode: .default)
        try? session.setActive(true)
    }

    private func setupRemoteTransportControls() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget { [weak self] _ in
            self?.play(); return .success
        }
        commandCenter.pauseCommand.addTarget { [weak self] _ in
            self?.pause(); return .success
        }
        commandCenter.changePlaybackPositionCommand.addTarget { [weak self] event in
            guard let self = self, let event = event as? MPChangePlaybackPositionCommandEvent else { return .commandFailed }
            let newProgress = event.positionTime / self.duration
            self.seek(to: newProgress)
            return .success
        }
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

        var nowPlayingInfo: [String: Any] = [
            MPMediaItemPropertyTitle: currentTitle,
            MPNowPlayingInfoPropertyElapsedPlaybackTime: player.currentTime,
            MPMediaItemPropertyPlaybackDuration: player.duration,
            MPNowPlayingInfoPropertyPlaybackRate: playbackRate
        ]

        // Přidání obrázku alba, pokud existuje
        if let albumImage = UIImage(named: "podcast") {
            let artwork = MPMediaItemArtwork(boundsSize: albumImage.size) { _ in albumImage }
            nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
        }

        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }

    // MARK: - AVAudioPlayerDelegate

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        isPlaying = false
        progress = 0
        stopTimer()
        updateNowPlaying(playbackRate: 0)
    }
}
