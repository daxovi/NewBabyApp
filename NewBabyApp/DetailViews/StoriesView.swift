//
//  StoryView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//

import SwiftUI

struct StoriesView: View {

    var storiesGroup: StoriesModel
    @Binding var path: NavigationPath

    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var timerProgress: CGFloat = 0

    var body: some View {
        TabView {
            Image(storiesGroup.stories[selectedStory].sourceName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .background(.black)
        // tlačítko zavřít
        .overlay(
            Button {
                path.removeLast()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            .padding(), alignment: .topTrailing
        )
        // progressbar
        .overlay(
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
                .padding(.horizontal)
            }, alignment: .top
        )
        // přeskakování stories
        .overlay{
            HStack {
                Color.black.opacity(0.01)
                    .onTapGesture {
                        if selectedStory > 0 {
                            selectedStory -= 1
                        }
                        timerProgress = 0
                    }
                    .allowsHitTesting(true)
                Color.black.opacity(0.01)
                    .onTapGesture {
                        if selectedStory < storiesGroup.stories.count - 1 {
                            selectedStory += 1
                            timerProgress = 0
                        } else {
                            path.removeLast()
                        }
                    }
                    .allowsHitTesting(true)
            }
            .padding(.top, 100)
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height > 0 {
                                    path.removeLast()
                                }
                            }))
        .onReceive(timer) { _ in
            if timerProgress < 1 {
                timerProgress += 0.01
            } else {
                if selectedStory < storiesGroup.stories.count - 1 {
                    selectedStory += 1
                    timerProgress = 0
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
