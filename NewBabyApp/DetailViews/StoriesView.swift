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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var player: AVPlayer?

    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var timerProgress: CGFloat = 0
    @State var videoProgressGroup: [Double] = []

    var body: some View {
        TabView(selection: $selectedStory, content: {
            ForEach(storiesGroup.stories.indices, id: \.self) { index in
                GeometryReader { proxy in
                    if storiesGroup.stories[index].type == .video {
                        VideoTabView(videoName: storiesGroup.stories[index].sourceName, progress: $videoProgressGroup[index])
                            .overlay(topShadow, alignment: .top)
                            .ignoresSafeArea()
                            .scaledToFill()
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                    } else {
                        if let image = getImage(imageName: storiesGroup.stories[index].sourceName) {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .overlay(topShadow, alignment: .top)

                                    .ignoresSafeArea()
                                    .frame(
                                        width: proxy.size.width,
                                        height: proxy.size.height
                                    )
                            }
                    }
                }
            }
            
        })
        .onAppear {
            videoProgressGroup = Array(repeating: 0.0, count: storiesGroup.stories.count)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(Color.black)
        .onReceive(timer) { _ in
            if timerProgress < 1 {
                if storiesGroup.stories[selectedStory].type == .video {
                    if videoProgressGroup[selectedStory] > 0 {
                        timerProgress = videoProgressGroup[selectedStory]
                    } else {
                        timerProgress = 0.0
                    }
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
            colors: [Color("dark-shadow").opacity(0.8), Color("dark-shadow").opacity(0.0)],
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
                        if timerProgress > 0.2 {
                            if selectedStory > 0 {
                                selectedStory -= 1
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                    selectedStory += 1
                                    timerProgress = 0
                                }
                            } else {
                                selectedStory += 1
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                                    selectedStory -= 1
                                    timerProgress = 0
                                }
                            }
                        } else {
                            if selectedStory > 0 {
                                selectedStory -= 1
                            }
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
