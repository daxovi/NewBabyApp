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
    @State private var navigationPath = NavigationPath()
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white // Barva tab baru
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    var body: some View {
        TabView(selection: $selected) {
            NavigationStack(path: $navigationPath) {
                MenuView(model: LocalRepository.menuPregnant, clientName: clientName, path: $navigationPath, heartTapAction: showOnbording)
            }
                .tabItem{
                    VStack {
                        Text("čekám miminko")
                        Image("pregnant").renderingMode(.template)
                    }
                }
                .tag(0)
            
            NavigationStack(path: $navigationPath) {
                MenuView(model: LocalRepository.menuHospital, clientName: clientName, path: $navigationPath, heartTapAction: showOnbording)
            }
                .tabItem{
                    VStack {
                        Spacer(minLength: 10)
                        Text("jsem v porodnici")
                        Image("babyboy")
                            .renderingMode(.template)
                    }
                }
                .tag(1)
            
            NavigationStack(path: $navigationPath) {
                MenuView(model: LocalRepository.menuHome, clientName: clientName, path: $navigationPath, heartTapAction: showOnbording)
            }
                .tabItem{
                    VStack {
                        Text("jsem doma")
                        Image("seatchair").renderingMode(.template)
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
    
    func showOnbording() {
        self.firstLaunch.toggle()
    }
}

#Preview {
    ContentView()
}
