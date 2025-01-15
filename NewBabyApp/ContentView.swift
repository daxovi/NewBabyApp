//
//  ContentView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State var selected: Int = 0
    @State var isBoardingPresented: Bool = true
    @AppStorage("clientName") var clientName: String = ""
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white // Barva tab baru
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    
    var body: some View {
        TabView(selection: $selected) {
            MenuPregnantView(clientName: $clientName)
                .tabItem{
                    VStack {
                        Text("čekám miminko")
                        Image("pregnant").renderingMode(.template)
                    }
                }
                .tag(0)
            
            MenuHospitalView(clientName: $clientName)
                .tabItem{
                    VStack {
                        Spacer(minLength: 10)
                        Text("jsem v porodnici")
                        Image("babyboy")
                            .renderingMode(.template)
                    }
                }
                .tag(1)
            
            MenuHomeView(clientName: $clientName)
                .tabItem{
                    VStack {
                        Text("jsem doma")
                        Image("seatchair").renderingMode(.template)
                    }
                }
                .tag(2)
        }
        .accentColor(.accentColor)
        .sheet(isPresented: $isBoardingPresented) {
            OnboardingView(selected: $selected, clientName: $clientName)
        }
        .background(Color.black)
    }
}

#Preview {
    ContentView()
}
