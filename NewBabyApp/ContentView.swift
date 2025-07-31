//
//  ContentView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct TabItem {
    let title: String
    let image: ImageResource
    let model: MenuModel
    let tag: Int
}

struct ContentView: View {
    @State var selected: Int = 0
    @AppStorage("clientName") var clientName: String = ""
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @State private var pregnantPath = NavigationPath()
    @State private var hospitalPath = NavigationPath()
    @State private var homePath = NavigationPath()
    
    private let tabItems = [
        TabItem(title: "title_cekamemiminko", image: .pregnant, model: LocalRepository.menuPregnant, tag: 0),
        TabItem(title: "title_jsmevporodnici", image: .babyboy, model: LocalRepository.menuHospital, tag: 1),
        TabItem(title: "title_jsmedoma", image: .seatchair, model: LocalRepository.menuHome, tag: 2)
    ]
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView(selection: $selected) {
            ForEach(Array(tabItems.enumerated()), id: \.offset) { index, item in
                NavigationStack(path: pathBinding(for: index)) {
                    MenuView(
                        model: item.model,
                        clientName: clientName,
                        path: pathBinding(for: index),
                        heartTapAction: showOnboarding
                    )
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        navigationDestination(for: destination, at: index)
                    }
                }
                .tabItem {
                    VStack {
                        if index == 1 {
                            Spacer(minLength: 10)
                        }
                        Text(item.title.localizedString.lowercased())
                            .textStyle(.bodyPrimary)
                        Image(item.image)
                            .renderingMode(.template)
                    }
                }
                .tag(item.tag)
                .overlay(alignment: .bottom) {
                    AudioPlayerOverlay()
                        .padding(6)
                }
            }
        }
        .accentColor(.accentColor)
        .sheet(isPresented: $firstLaunch) {
            OnboardingView(selected: $selected, clientName: $clientName)
        }
        .background(Color.black)
    }
    
    private func pathBinding(for index: Int) -> Binding<NavigationPath> {
        switch index {
        case 0: return $pregnantPath
        case 1: return $hospitalPath
        case 2: return $homePath
        default: return $pregnantPath
        }
    }
    
    @ViewBuilder
    private func navigationDestination(for destination: NavigationDestination, at index: Int) -> some View {
        switch destination {
        case .stories(let model):
            StoriesView(storiesGroup: model)
        case .text(let model):
            TextView(model: model)
        case .menu(let model):
            MenuView(model: model, clientName: clientName, path: pathBinding(for: index))
        case .introText(_):
            EmptyView()
        case .podcast(_):
            EmptyView()
        }
    }
    
    func showOnboarding() {
        firstLaunch.toggle()
    }
}

#Preview {
    ContentView()
}
