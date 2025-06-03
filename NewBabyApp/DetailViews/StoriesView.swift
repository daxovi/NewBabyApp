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

    @State var player: AVPlayer?

    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var timerProgress: CGFloat = 0
    @State var videoProgressGroup: [Double] = [0.0]

    var body: some View {
        if storiesGroup.stories.isEmpty {
            Text("Tady není nic k vidění") // TODO: dodělat vtipný emptyview
        } else {
            TabView(selection: $selectedStory, content: {
                ForEach(storiesGroup.stories.indices, id: \.self) { index in
                    GeometryReader { proxy in
                        if storiesGroup.stories[index].type == .video {
                            
                            VStack(spacing: 8) {
                                progressBar
                                    .padding(.top, 6)
                                HStack(alignment: .top) {
                                        Text(storiesGroup.stories[selectedStory].text)
                                            .textStyle(.bodyPrimary)
                                        Spacer(minLength: 24)
                                        Button {
                                            presentationMode.wrappedValue.dismiss()
                                        } label: {
                                            Image(systemName: "xmark")
                                                .font(.title2)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    .padding()

                                Color.clear
                                    .overlay(
                                        VideoTabView(videoName: storiesGroup.stories[index].sourceName, progress: $videoProgressGroup[index])
                                            .scaledToFill()
                                            .ignoresSafeArea()
                                            .frame(
                                                width: proxy.size.width,
                                                height: proxy.size.height
                                            )
//                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            .scaledToFill()
                                            .clipped()
                                        )
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                    .ignoresSafeArea()
                            }
                        } else {
                            if let image = getImage(imageName: storiesGroup.stories[index].sourceName) {
                                VStack(spacing: 8) {
                                    progressBar
                                        .padding(.top, 6)
                                    HStack(alignment: .top) {
                                            Text(storiesGroup.stories[selectedStory].text)
                                                .textStyle(.bodyPrimary)
                                            Spacer(minLength: 24)
                                            Button {
                                                presentationMode.wrappedValue.dismiss()
                                            } label: {
                                                Image(systemName: "xmark")
                                                    .font(.title2)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                        .padding()

                                    Color.clear
                                        .overlay(
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(maxHeight: .infinity)
                                                .clipped()
                                            )
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                        .ignoresSafeArea()


                                    }
                                .background(Color.background)
//                                    .ignoresSafeArea()
                                
                            
                                }
                        }
                    }
                }
                
            })
            .statusBar(hidden: true)
            .toolbar(.hidden, for: .tabBar)
            .onAppear {
                videoProgressGroup = Array(repeating: 0.0, count: storiesGroup.stories.count)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
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
//            .overlay(progressBar, alignment: .topTrailing)
            .background(Color.background)
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
    StoriesView(storiesGroup:
                    StoriesModel(title: "Plánovaný císařský řez", bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
                        Story(type: .video, sourceName: "test-1", text: "kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
                        Story(type: .image, sourceName: "test-1", text: "kjsdhf dvdkvj vjev qef efkdcnrefv fvkkjdv jenfn kfvnj kjvn ffv fvdfv dfvefš fvef nv ac cercacd ffvdavkvš elve ava vevvnnieu vceavkv vvakaev"),
                        Story(type: .video, sourceName: "test-1", text: "v"),
//                        Story(type: .video, sourceName: "vysetreni-sluchu-2", text: "Před operací zavedeme do žíly kanylu k aplikaci léků a infuzí. Na operačním sále vám bude zaveden na nezbytně dlouhou dobu močová cévka."),
//                        Story(type: .image, sourceName: "planovany-cisarsky-rez-4", text: "Dle situace probíhá péče o maminku na porodním sále nebo intermediálním pokoji."),
//                        Story(type: .image, sourceName: "planovany-cisarsky-rez-5", text: "Při nekomplikovaném průběhu operace vedené ve svodné – spinální anestezii je možná přítomnost otce přímo na operačním sále."),
//                        Story(type: .image, sourceName: "planovany-cisarsky-rez-6", text: "Dovoluje-li to váš stav a stav vašeho dítěte následuje téměř okamžitý bonding ještě v průběhu operace.")
                    ])
    )
}
