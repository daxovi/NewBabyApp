//
//  MenuView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 09.01.2025.
//
import SwiftUI

struct MenuHomeView: View {
    @Binding var clientName: String

    @State private var path = NavigationPath()
    @State private var scrollPosition: CGFloat = 300.0
    
    @State private var showVideo: Bool = false
    
    var body: some View {
        ZStack {
            if showVideo {
                VideoPlayerFullscreen(videoURL: Bundle.main.url(forResource: "tygrik00", withExtension: "mp4")!)
                    .onDisappear {showVideo = false}
            }
            VStack {
                NavigationStack(path: $path) {
                    List {
                        Section {
                            Button("Poloha tygříka - celá") {
                                showVideo = true
                            }
                            .foregroundStyle(.black)
                        } header: {
                            VStack (alignment: .leading, content: {
                                Text("Vítej, \(clientName)")
                                    .font(.title)
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
                            })
                            .padding(.top, 300)
                        }
                        
                        Section {
                            ForEach(LocalRepository.prvniDen.indices, id: \.self) { index in
                                MenuItem(item: LocalRepository.prvniDen[index])
                            }
                        }
                        
                        Section {
                            ForEach(LocalRepository.manipulaceSDitetem.indices, id: \.self) { index in
                                MenuItem(item: LocalRepository.manipulaceSDitetem[index])
                            }
                        }
                        
                        Section {
                            ForEach(LocalRepository.druhyDen.indices, id: \.self) { index in
                                MenuItem(item: LocalRepository.druhyDen[index])
                            }
                        }
                        
                        Section {
                            ForEach(LocalRepository.tretiDen.indices, id: \.self) { index in
                                MenuItem(item: LocalRepository.tretiDen[index])
                            }
                        }
                    }
                    .listSectionSpacing(15)
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
                                Image("title-home")
                                    .resizable()
                                    .scaledToFit()
                                    .onTapGesture(perform: {
                                        path.append(
                                            DetailModel(title: "nic tady není"))
                                    })
                                    .overlay(content: {
                                        LinearGradient(colors: [Color("background").opacity(0.0), Color("background").opacity(0.0), Color("background")], startPoint: .center, endPoint: .bottom)
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
}
