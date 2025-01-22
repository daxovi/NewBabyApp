//
//  MenuView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 19.01.2025.
//

import SwiftUI

struct MenuView: View {
    let backgroundImageName: String?
    let clientName: String?
    let subtitle: String?
    let menuItems: [NavigationDestination]
    let title: String
    let heartTapAction: (() -> Void)?
    
    @Binding var path: NavigationPath
    @State private var scrollPosition: CGFloat = 300.0
    @State private var showVideo: Bool = false
    
    init(model: MenuModel, clientName: String?, path: Binding<NavigationPath>, heartTapAction: (() -> Void)? = nil) {
        self.backgroundImageName = model.backgroundImageName
        self.clientName = clientName?.trimmingCharacters(in: .whitespacesAndNewlines)
        self.subtitle = model.subtitle
        self.menuItems = model.menuItems
        self._path = path
        self.title = model.title
        self.heartTapAction = heartTapAction
    }
    
    var body: some View {
        ZStack {
            Color("background")
                .ignoresSafeArea()
            if let backgroundImageName {
                MenuBackground(imageName: backgroundImageName, scrollPosition: $scrollPosition)
            }
            
            if showVideo {
                VideoPlayerFullscreen(videoURL: Bundle.main.url(forResource: "tygrik00", withExtension: "mp4")!)
                    .onDisappear { showVideo = false }
            }
            
            ScrollView {
                if backgroundImageName != nil {
                    MenuHeader(clientName: clientName, subtitle: subtitle, heartTapAction: heartTapAction, scrollPosition: $scrollPosition)
                }
                
                // MARK: Welcome text
                
                
                VStack(spacing: 0) {
                    ForEach(menuItems.indices, id: \.self) { index in
                        switch menuItems[index] {
                        case .stories(let model):
                            MenuItem(item: model)
                        case .text(let model):
                            MenuItem(item: model)
                        case .menu(let model):
                            MenuItem(item: model)
                        case .detail(let model):
                            MenuItem(item: model)
                        }
                    }
                    if title == "Bezpečná maipulace" {
                        Button {
                            showVideo = true
                        } label: {
                            VStack(spacing: 0) {
                                HStack(alignment: .center) {
                                    Text("Poloha tygříka - v celku")
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(Color.black)
                                Divider()
                            }
                        }
                        
                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                
                
                
                
                ZStack {
                    Image(.footerCloud)
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, -180)
                    Image(.logoFnol)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 100)
                        .foregroundStyle(Color.fnolBlue)
                        .offset(y: 100)
                }
                .zIndex(-1)
                .offset(y: -130)
                
            }
            
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .stories(let model):
                    StoriesView(storiesGroup: model)
                case .text(let model):
                    TextView(model: model)
                case .menu(let model):
                    MenuView(model: model, clientName: clientName, path: $path)
                case .detail(let model):
                    DetailView(model: model)
                }
            }
        }
        .navigationTitle(title)
        .navigationBarHidden(backgroundImageName != nil)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func isNextItemBanner(_ index: Int, menuItems: [NavigationDestination]) -> Bool {
        return true
    }
}

#Preview {
    MenuView(model: MenuModel(title: "", subtitle: "", backgroundImageName: "title-baby", menuItems: [LocalRepository.manipulaceSDitetem[0]]), clientName: "Name", path: .constant(NavigationPath()))
}

private struct MenuBackground: View {
    var imageName: String
    @Binding var scrollPosition: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        LinearGradient(colors: [Color("background").opacity(0.0), Color("background").opacity(0.0), Color("background")], startPoint: .center, endPoint: .bottom)
                    )
                    .blur(radius: (300 - scrollPosition) * 0.1)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

private struct MenuHeader: View {
    var clientName: String?
    var subtitle: String?
    var heartTapAction: (() -> Void)? = nil
    @Binding var scrollPosition: CGFloat
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(.fnolHeart)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundStyle(Color.accent)
                    .onTapGesture(count: 5) {
                        heartTapAction?()
                    }
                Spacer()
            }
            .frame(height: 50)
            
            Spacer(minLength: 250)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    if let clientName = clientName, clientName.count > 0 {
                        Text("Vítejte, \(clientName)")
                            .font(.title)
                    } else {
                        Text("Vítejte")
                            .font(.title)
                    }
                    if let subtitle, subtitle.count > 0 {
                        Text(subtitle)
                    }
                }
                Spacer()
            }
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .global).minY) { oldValue, newValue in
                            scrollPosition = newValue
                        }
                }
            )
        }
        .padding(.horizontal)
    }
}
