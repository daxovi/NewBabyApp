//
//  AudioPlayerOverlay.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 31.07.2025.
//

import SwiftUI
import Combine

struct AudioPlayerOverlay: View {
    @StateObject var audioManager = AudioManager.shared
    @State private var localProgress: Double? = nil
    @State private var isSeeking: Bool = false
    @State private var isHidden: Bool = true
        
    var body: some View {
        if audioManager.isOverlayPlayerVisible {
            VStack {
                Spacer()
                    .frame(height: 30)
                //                    .allowsHitTesting(false)
                HStack {
                    Image(systemName: audioManager.isPlaying ? "pause.fill" : "play.fill")
                        .onTapGesture {
                            if audioManager.isPlaying {
                                audioManager.pause()
                            } else {
                                audioManager.play()
                            }
                        }
                        .frame(width: 20)
                    Text(audioManager.currentTitle)
                        .font(.callout)
                    Spacer()
                    Text("\(PodcastView.formatTime(audioManager.progress * audioManager.duration))/\(PodcastView.formatTime(audioManager.duration))")
                        .font(.callout)
                    Image(systemName: "xmark")
                        .onTapGesture {
                            audioManager.stop()
                            isHidden = true
                        }
                }
                .padding()
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(alignment: .topLeading, content: { progressBar })
                .background(Material.regular)
                .cornerRadius(4)
                .shadow(color: .black.opacity(0.1), radius: 2)
                .opacity(isHidden ? 0 : 1)
                .offset(y: isHidden ? 80 : 0)
                .animation(.spring(duration: 0.25, bounce: 0.4), value: isHidden)
                .onAppear{ isHidden = false }
            }
        }
    }
    
    var progressBar: some View {
        GeometryReader { geo in
            VStack {
                
                HStack(spacing: 0) {
                    Color.accent
                        .frame(width: (localProgress ?? audioManager.progress) * geo.size.width)
                    Spacer(minLength: 0)
                }
                .frame(height: isSeeking ? 8 : 2)
            }
            .frame(height: 10, alignment: .top)
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        if !isSeeking{
                            withAnimation {
                                isSeeking = true
                            }
                        }
                        localProgress = Double(rel)
                    }
                    .onEnded { value in
                        let rel = min(max(0, value.location.x / geo.size.width), 1)
                        localProgress = nil
                        withAnimation {
                            isSeeking = false
                        }
                        audioManager.seek(to: rel)
                    }
            )
        }
    }
}
