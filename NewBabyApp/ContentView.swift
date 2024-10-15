//
//  ContentView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var path = NavigationPath()
    @State private var scrollPosition: CGFloat = 300.0

    let predPorodem: [DetailModel] = [
        DetailModel(
            title: "Screeningy",
            stories: StoriesModel(stories: [
                Story(type: .video, sourceName: "testclip", text: "test text")
            ])),
        DetailModel(
            title: "Screeningy",
            stories: StoriesModel(
                stories: [
                    Story(
                        type: .video, sourceName: "testclip", text: "test text"),
                    Story(
                        type: .video, sourceName: "testclip1", text: "test"),
                    Story(
                        type: .video, sourceName: "testclip", text: "text"),
                ])),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
    ]

    let vPorodnici: [DetailModel] = [
        DetailModel(title: "Porod", bannerName: "banner-porod")
    ]

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    Section {
                        ForEach(predPorodem) { detail in
                            MenuItem(detail: detail, path: $path)
                        }
                    } header: {
                        Text("před porodem")
                            .font(.title)
                            .textCase(.lowercase)
                            .foregroundColor(.black)
                            .background(
                                GeometryReader(content: { geometry in
                                    Color.clear
                                        .onChange(
                                            of: geometry.frame(in: .global).minY
                                        ) { oldValue, newValue in
                                            scrollPosition = newValue
                                        }
                                })
                            )
                            .padding(.top, 300)
                    }

                    Section {
                        ForEach(vPorodnici) { detail in
                            MenuItem(detail: detail, path: $path)
                        }
                    } header: {
                        Text("v porodnici")
                            .font(.title)
                            .textCase(.lowercase)
                            .foregroundColor(.black)
                    }
                }
                .navigationDestination(for: DetailModel.self) { detail in
                    DetailView(detail: detail, path: $path)
                }
                .navigationDestination(for: StoriesModel.self, destination: { stories in
                    StoriesView(storiesGroup: stories, path: $path)
                        .transition(.move(edge: .bottom))
                })
                .allowsHitTesting(true)

                .scrollContentBackground(.hidden)
                .background(
                    ZStack {
                        Color("background")
                        VStack {
                            //  Text("\(scrollPosition)")
                            Image("title-pregnant")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture(perform: {
                                    path.append(
                                        DetailModel(title: "nic tady není"))
                                })
                                //        .opacity((scrollPosition-200.0) * 0.01)
                                .blur(radius: (300 - scrollPosition) * 0.1)
                            Spacer()
                        }

                    }
                    .ignoresSafeArea()
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
