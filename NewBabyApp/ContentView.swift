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

    let predPorodem: [any MenuItemModel] = [
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Screeningy"),
        
        StoriesModel(title: "Manipulace s novorozencem", stories: [
            Story(type: .video, sourceName: "otaceni01", text: "text"),
            Story(type: .video, sourceName: "otaceni02", text: "text2"),
            Story(type: .video, sourceName: "otaceni03", text: "text3"),
            Story(type: .video, sourceName: "otaceni04", text: "text"),
            Story(type: .video, sourceName: "otaceni05", text: "text"),
            Story(type: .video, sourceName: "otaceni06", text: "text"),
            Story(type: .video, sourceName: "otaceni07", text: "text"),

        ]),
        
        StoriesModel(title: "Videotest", stories: [
            Story(type: .video, sourceName: "cliptest", text: ""),
            Story(type: .video, sourceName: "animace", text: ""),
            Story(type: .video, sourceName: "cliptest", text: ""),
            Story(type: .video, sourceName: "cliptest", text: "")
        ]),
        
        StoriesModel(title: "Otáčení", stories: [
            Story(type: .image, sourceName: "otaceni01", text: ""),
            Story(type: .image, sourceName: "otaceni02", text: ""),
            Story(type: .image, sourceName: "otaceni03", text: ""),
            Story(type: .image, sourceName: "otaceni04", text: "")
        ]),
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
                        ForEach(predPorodem.indices, id: \.self) { index in
                            MenuItem(item: predPorodem[index])
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
                        ForEach(vPorodnici.indices, id: \.self) { index in
                            MenuItem(item: vPorodnici[index])
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
                    StoriesView(storiesGroup: stories)
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
