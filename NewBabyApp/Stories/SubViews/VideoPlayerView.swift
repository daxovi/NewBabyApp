//
//  VideoTabView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.10.2024.
//
import SwiftUI
import _AVKit_SwiftUI

struct VideoPlayerView: View {
    var videoName: String
    @StateObject var videoPlayerViewModel: VideoPlayerViewModel
    @Binding var progress: Double // Binding pro přenos progressu do ContentView
    @Binding var shouldRestart: Bool
    @Binding var isPaused: Bool
    
    init(videoName: String, progress: Binding<Double>, shouldRestart: Binding<Bool>, isPaused: Binding<Bool>) {
        _videoPlayerViewModel = StateObject(wrappedValue: VideoPlayerViewModel(videoName: videoName))
        _progress = progress
        _shouldRestart = shouldRestart
        _isPaused = isPaused
        self.videoName = videoName
    }
    
    var body: some View {
        VideoPlayer(player: videoPlayerViewModel.player)
            .onAppear (perform: videoPlayerViewModel.restart)
            .onDisappear (perform: videoPlayerViewModel.pauseAndSeekToZero)
            .onReceive(videoPlayerViewModel.$currentProgress) { newProgress in
                progress = newProgress // Aktualizace bindingu v ContentView
            }
            .onChange(of: videoName) { newValue in
                videoPlayerViewModel.updateVideoName(newValue)
            }
            .onChange(of: shouldRestart) { newValue in
                if newValue {
                    videoPlayerViewModel.restart()
                    shouldRestart = false
                }
            }
            .onChange(of: isPaused) { newValue in
                if newValue {
                    videoPlayerViewModel.pause()
                } else {
                    videoPlayerViewModel.resume()
                }
            }
    }
}
