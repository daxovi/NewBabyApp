//
//  StoryView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//

import AVKit
import SwiftUI

struct StoriesView: View {
    // TODO: ošetřit vyjímku kdy nebude žádné stories aby aplikace nespadla
    
    var storiesGroup: StoriesModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismissStories
    
    @State var player: AVPlayer?
    
    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var timerProgress: CGFloat = 0
    @State var videoProgressGroup: [Double] = [0.0]
    
    var body: some View {
        if storiesGroup.stories.isEmpty {
            Text("Tady není nic k vidění") // TODO: dodělat vtipný emptyview
        } else {
            ZStack (alignment: .topTrailing) {
                TabView(selection: $selectedStory, content: {
                    ForEach(storiesGroup.stories.indices, id: \.self) { index in
                        GeometryReader { proxy in
                            
                            VStack(spacing: 8) {
                                progressBar
                                    .padding(.top, 6)
                                HStack(alignment: .top) {
                                    storiesText
                                    Spacer(minLength: 24)
                                    Image(systemName: "xmark")
                                        .font(.title2)
                                        .foregroundColor(.black)
                                        .padding()
                                        .opacity(0.0)
                                }
                                .padding()

                                VStack {
                                    if storiesGroup.stories[index].type == .video {
                                        Color.clear
                                            .overlay(
                                                VideoTabView(videoName: storiesGroup.stories[index].sourceName, progress: $videoProgressGroup[index])
                                                    .scaledToFill()
                                                    .ignoresSafeArea()
                                                    .frame(
                                                        width: proxy.size.width,
                                                        height: proxy.size.height
                                                    )
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                                    .scaledToFill()
                                                    .clipped()
                                            )
                                            .clipShape(clipShape)
                                            .ignoresSafeArea()
                                    } else {
                                        if let image = getImage(imageName: storiesGroup.stories[index].sourceName) {
                                            Color.clear
                                                .overlay(
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(maxHeight: .infinity)
                                                        .clipped()
                                                )
                                                .clipShape(clipShape)
                                                .ignoresSafeArea()
                                        }
                                    }
                                }
                                .overlay(controls)
                            }
                            .background(Color.background)
                        }
                    }
                })
                .statusBar(hidden: true)
                .toolbar(.hidden, for: .tabBar)
                .onAppear(perform: resetProgress)
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onReceive(timer) { _ in tick() }
                .ignoresSafeArea()
                .background(Color.background)
                .gesture(dragToDismiss)
                .navigationBarBackButtonHidden(true)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.top)
                }
            }
        }
    }
    
    func resetProgress() {
        videoProgressGroup = Array(repeating: 0.0, count: storiesGroup.stories.count)
    }
    
    var dragToDismiss: some Gesture {
        DragGesture(minimumDistance: 100, coordinateSpace: .local)
            .onEnded { value in
                if value.translation.height > 0 {
                    dismissStories()
                }
            }
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
                            .fill(.bannerBlurPink.opacity(0.5))
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
        }
        .padding(.horizontal)
    }
    
    var controls: some View {
        HStack(spacing: 0) {
            Color.black.opacity(0.01)
                .onTapGesture { handleTapPrevious() }
//                .allowsHitTesting(true)
            Color.black.opacity(0.01)
                .simultaneousGesture(handleTapAndHold)
            Color.black.opacity(0.01)
                .onTapGesture { handleTapNext() }
        }
        .padding(.top, 100)
    }
    
    var handleTapAndHold: some Gesture {
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
    }
    
    func tick() {
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
    
    func handleTapPrevious() {
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
    
    func handleTapNext() {
        if selectedStory < storiesGroup.stories.count - 1 {
            selectedStory += 1
            timerProgress = 0
        } else {
            dismissStories()
        }
    }
    
    var storiesText: some View {
        Text(storiesGroup.stories[selectedStory].text)
            .textStyle(.bodyPrimary)
    }
    
    var clipShape: some Shape {
        UnevenRoundedRectangle(topLeadingRadius: 30, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 30, style: .circular)
    }
}

#Preview {
    StoriesView(storiesGroup:
                    StoriesModel(title: "Plánovaný císařský řez", bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
                        Story(type: .video, sourceName: "test-1", text: "video kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
                        Story(type: .image, sourceName: "test-1", text: "fotka kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
                        Story(type: .video, sourceName: "test-1", text: "v"),
                    ])
    )
}
