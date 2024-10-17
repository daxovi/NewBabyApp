//
//  StoryView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//

import SwiftUI

struct StoriesView: View {

    var storiesGroup: StoriesModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State var selectedStory: Int = 0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common)
        .autoconnect()
    @State var timerProgress: CGFloat = 0

    var body: some View {
        ZStack {
            Color.black
            VStack {
                (getImage(imageName: storiesGroup.stories[selectedStory].sourceName) ?? Image("placeholder"))
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        LinearGradient(colors: [.black.opacity(0.8), .black.opacity(0.0)], startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        , alignment: .top
                    )
                    .overlay (
                        HStack {
                            Text(storiesGroup.stories[selectedStory].text)
                                .foregroundStyle(.white)
                            Spacer()
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.title2)
                                    .foregroundColor(.white)
                            }
                        }
                            .padding()
                        , alignment: .topLeading)
            }
            
            // tlačítko zavřít
            
        }
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
                
            }
                .padding()
             , alignment: .topTrailing
        )
        .background(.black)
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
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    .allowsHitTesting(true)
            }
            .padding(.top, 100)
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                            .onEnded({ value in
                                if value.translation.height > 0 {
                                    presentationMode.wrappedValue.dismiss()
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
