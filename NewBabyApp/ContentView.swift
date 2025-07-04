//
//  ContentView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var selected: Int = 0
    @AppStorage("clientName") var clientName: String = ""
    @AppStorage("firstLaunch") var firstLaunch: Bool = true
    @State private var pregnantPath = NavigationPath()
    @State private var hospitalPath = NavigationPath()
    @State private var homePath = NavigationPath()
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white // Barva tab baru
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    var body: some View {
        TabView(selection: $selected) {
            NavigationStack(path: $pregnantPath) {
                MenuView(model: LocalRepository.menuPregnant, clientName: clientName, path: $pregnantPath, heartTapAction: showOnboarding)
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .stories(let model):
                            StoriesView(storiesGroup: model)
                        case .text(let model):
                            TextView(model: model)
                        case .menu(let model):
                            MenuView(model: model, clientName: clientName, path: $pregnantPath)
                        case .introText(_):
                            EmptyView()
                        case .podcast(_):
                            EmptyView()
                        }
                    }
            }
                .tabItem{
                    VStack {
                        Text("title_cekamemiminko".localizedString.lowercased())
                            .textStyle(.bodyPrimary)
                        Image(.pregnant).renderingMode(.template)
                    }
                }
                .tag(0)
            
            NavigationStack(path: $hospitalPath) {
                MenuView(model: LocalRepository.menuHospital, clientName: clientName, path: $hospitalPath, heartTapAction: showOnboarding)
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .stories(let model):
                            StoriesView(storiesGroup: model)
                        case .text(let model):
                            TextView(model: model)
                        case .menu(let model):
                            MenuView(model: model, clientName: clientName, path: $hospitalPath)
                        case .introText(_):
                            EmptyView()
                        case .podcast(_):
                            EmptyView()
                        }
                    }
            }
                .tabItem{
                    VStack {
                        Spacer(minLength: 10)
                        Text("title_jsmevporodnici".localizedString.lowercased())
                            .textStyle(.bodyPrimary)
                        Image(.babyboy)
                            .renderingMode(.template)
                    }
                }
                .tag(1)
            
            NavigationStack(path: $homePath) {
                MenuView(model: LocalRepository.menuHome, clientName: clientName, path: $homePath, heartTapAction: showOnboarding)
                    .navigationDestination(for: NavigationDestination.self) { destination in
                        switch destination {
                        case .stories(let model):
                            StoriesView(storiesGroup: model)
                        case .text(let model):
                            TextView(model: model)
                        case .menu(let model):
                            MenuView(model: model, clientName: clientName, path: $homePath)
                        case .introText(_):
                            EmptyView()
                        case .podcast(_):
                            EmptyView()
                        }
                    }
            }
                .tabItem{
                    VStack {
                        Text("title_jsmedoma".localizedString.lowercased())
                            .textStyle(.bodyPrimary)
                        Image(.seatchair).renderingMode(.template)
                    }
                }
                .tag(2)
        }
        .accentColor(.accentColor)
        .sheet(isPresented: $firstLaunch) {
            OnboardingView(selected: $selected, clientName: $clientName)
        }
        .background(Color.black)
    }
    
    func showOnboarding() {
        self.firstLaunch.toggle()
    }
}

#Preview {
    ContentView()
}
