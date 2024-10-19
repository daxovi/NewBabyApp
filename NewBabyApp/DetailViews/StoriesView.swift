//
//  StoryView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//

import AVKit
import SwiftUI

struct StoriesView: View {

    var storiesGroup: StoriesModel
    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>

    @State var player: AVPlayer?

    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var timerProgress: CGFloat = 0

    var body: some View {
        ZStack {
            Color.black
            VStack {
                GeometryReader { proxy in
                    if storiesGroup.stories[selectedStory].type == .video {
                        if let (newPlayer, playerView) = getVideo(
                            videoName: storiesGroup.stories[selectedStory]
                                .sourceName)
                        {
                            playerView
                                .scaledToFill()
                                .frame(
                                    width: proxy.size.width,
                                    height: proxy.size.height
                                )
                                .overlay(topShadow, alignment: .top)
                                .onAppear {
                                    player = newPlayer
                                    player?.play()
                                }
                        }

                    } else {
                        getImage(
                            imageName: storiesGroup.stories[selectedStory]
                                .sourceName)!
                            .resizable()
                            .scaledToFill()
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                            .overlay(topShadow, alignment: .top)
                    }
                }
            }
        }
        .onReceive(timer) { _ in
            if timerProgress < 1 {
                if storiesGroup.stories[selectedStory].type == .video {
                    let currentTime = player?.currentTime().seconds ?? 1
                    let totalTime = player?.currentItem?.duration.seconds ?? 1
                    let fraction = currentTime / totalTime
                    if fraction > 0 {
                        timerProgress = currentTime / totalTime
                    } else {
                        timerProgress = 0.0
                    }
                    player?.play()
                } else {
                    timerProgress += 0.01
                }
            } else {
                if selectedStory < storiesGroup.stories.count - 1
                {
                    selectedStory += 1
                } else {
                    presentationMode.wrappedValue.dismiss()
                }
                player?.seek(to: .zero)
                timerProgress = 0
                
            }
        }
        .ignoresSafeArea()
  //      .overlay(storiesText, alignment: .topLeading)
        .overlay(progressBar, alignment: .topTrailing)
        .background(.black)
        .overlay(controls)
        .gesture(
            DragGesture(minimumDistance: 100, coordinateSpace: .local)
                .onEnded({ value in
                    if value.translation.height > 0 {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
        )
        .navigationBarBackButtonHidden(true)
    }

    var topShadow: some View {
        LinearGradient(
            colors: [.black.opacity(0.8), .black.opacity(0.0)],
            startPoint: .top, endPoint: .bottom
        )
        .frame(height: 200)
    }

    var progressBar: some View {
        VStack {
            HStack(spacing: 5) {
                ForEach(storiesGroup.stories.indices, id: \.self) { index in

                    let isCompleted = index < selectedStory
                    let isActive = index == selectedStory

                    GeometryReader { proxy in
                        let width = proxy.size.width

                        Capsule()
                            .fill(.gray.opacity(0.5))
                            .overlay(alignment: .leading) {
                                if isActive {
                                    Capsule()
                                        .fill(.white)
                                        .frame(width: width * timerProgress)
                                } else if isCompleted {
                                    Capsule()
                                        .fill(.white)
                                }
                            }
                    }
                }
            }
            .frame(height: 2.4)
            HStack(alignment: .top) {
                Text(storiesGroup.stories[selectedStory].text)
                    .foregroundStyle(.white)
                    .padding(.top, 10)
                Spacer()
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                }
            }

        }
        .padding()
    }

    var controls: some View {
        HStack(spacing: 0) {
            Color.black.opacity(0.01)
                .onTapGesture {
                    if storiesGroup.stories[selectedStory].type == .video {
                        if timerProgress < 0.1 && selectedStory > 0 {
                            selectedStory -= 1
                        }
                        player?.seek(to: .zero)
                    } else {
                        if selectedStory > 0 {
                            selectedStory -= 1
                        }
                        timerProgress = 0
                    }
                }
                .allowsHitTesting(true)
            Color.black.opacity(0.01)
                .simultaneousGesture(
                    LongPressGesture(minimumDuration: 0.1)
                        .onEnded { _ in
                            timer.upstream.connect().cancel()
                            player?.pause()
                        }.sequenced(
                            before: TapGesture(count: 1).onEnded({ _ in
                                timer = Timer.publish(
                                    every: 0.1, on: .main, in: .common
                                ).autoconnect()
                                player?.play()
                            }))
                )
            Color.black.opacity(0.01)
                .onTapGesture {
                    if selectedStory < storiesGroup.stories.count - 1 {
                        selectedStory += 1
                        timerProgress = 0
                        if storiesGroup.stories[selectedStory].type == .video {
                            player?.seek(to: .zero)
                        }
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            //  .allowsHitTesting(true)
        }
        .padding(.top, 100)
    }

    var storiesText: some View {
        HStack {
            Text(storiesGroup.stories[selectedStory].text)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding()
        .padding(.top)
    }
}

#Preview {
    ContentView()
}
