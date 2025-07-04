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
    
    @State var selectedStory: Int = 0 { didSet {
        print("Selected story updated: \(selectedStory)")
        resetProgress()
    } }
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var timerProgress: CGFloat = 0
    @State var videoProgressGroup: [Double] = [0.0] { didSet {
        print("Video progress group updated: \(videoProgressGroup)")
    } }
    
    var body: some View {
        Group {
            if storiesGroup.stories.isEmpty {
                Text("Tady není nic k vidění") // TODO: dodělat vtipný emptyview
            } else {
                ZStack (alignment: .topTrailing) {
                if let story = storiesGroup.stories[safe: selectedStory] {
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
                            
                            ZStack {
                                Color.background
                                StoriesMediaView(story: story, proxy: proxy, progress: $videoProgressGroup[selectedStory])
                            }
                                .overlay(controls)
                        }
                        .statusBar(hidden: true)
                        .onAppear(perform: resetProgress)
                        .onReceive(timer) { _ in tick() }
                        .toolbar(.hidden, for: .tabBar)
                        .background(Color.background)
                        .gesture(dragToDismiss)
                        .navigationBarBackButtonHidden(true)
                    }
                }
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.top)
                }
                
                #if DEBUG
                HStack {
                    VStack {
                        Spacer()
                        VStack {
                            Text("image: \(storiesGroup.stories[safe: selectedStory]?.sourceName ?? "")")
                                .font(.caption)
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.7))
                        .padding(5)
                    }
                    Spacer()
                }
                #endif
            }

        }
        .navigationBarHidden(true)
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
            Color.black.opacity(0.01)
                .simultaneousGesture(handleTapAndHold)
            Color.black.opacity(0.01)
                .onTapGesture { handleTapNext() }
        }
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
            switch storiesGroup.stories[selectedStory].type {
            case .video:
                print("Video progress reset for first story") // TODO: resetovat stav videa
            case .image:
                timerProgress = 0
            }
        } else {
            if selectedStory > 0 {
                selectedStory -= 1
            } else {
                switch storiesGroup.stories[selectedStory].type {
                case .video:
                    print("Video progress reset for first story") // TODO: resetovat stav videa
                case .image:
                    timerProgress = 0
                }
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

private struct StoriesMediaView: View {
    var story: Story
    var proxy: GeometryProxy
    @Binding var progress: Double
    
    var body: some View {
        if story.type == .video {
            Color.clear
                .overlay(
                    VideoPlayerView(videoName: story.sourceName, progress: $progress)
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
            if let image = getImage(imageName: story.sourceName) {
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
    
    var clipShape: some Shape {
        UnevenRoundedRectangle(topLeadingRadius: 30, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 30, style: .circular)
    }
}

//
//#Preview {
//    StoriesView(storiesGroup:
//                    StoriesModel(title: "title_planovanycisarskyrez".localizedString, bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
//                        Story(type: .video, sourceName: "test-1", text: "video kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
//                        Story(type: .image, sourceName: "test-1", text: "fotka kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
//                        Story(type: .video, sourceName: "test-1", text: "v"),
//                    ])
//    )
//}
