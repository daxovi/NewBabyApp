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
            
            ScrollView {
                if backgroundImageName != nil {
                    MenuHeader(clientName: clientName, subtitle: subtitle, heartTapAction: heartTapAction, scrollPosition: $scrollPosition)
                }
                
                // MARK: Welcome text
                
                VStack(spacing: 0) {
                    ForEach(groupedMenuItems().indices, id: \.self) { index in
                        let item = groupedMenuItems()[index]
                        if item.count == 2 {
                            DoubleMenuItemView(item: item)
                        } else {
                            MenuItemView(menuItem: item[0])
                            .clipShape(UnevenRoundedRectangle(
                                topLeadingRadius: getTopRadius(index),
                                bottomLeadingRadius: getBottomRadius(index),
                                bottomTrailingRadius: getBottomRadius(index),
                                topTrailingRadius: getTopRadius(index)))
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
                case .introText(_):
                    EmptyView()
                }
            }
        }
        .navigationTitle(title)
        .navigationBarHidden(backgroundImageName != nil)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func getTopRadius(_ index: Int) -> CGFloat {
        guard index > 0, index - 1 < menuItems.count else {
            return 0
        }
        
        let prev = menuItems[index - 1]
        if prev.isBanner() {
            return 10
        }
        
        return 0
    }
    
    func getBottomRadius(_ index: Int) -> CGFloat {
        guard index > 0, index + 1 < menuItems.count else {
            return 0
        }
        
        let next = menuItems[index + 1]
        if next.isBanner() {
            return 10
        }
        
        return 0
    }
    
    private func groupedMenuItems() -> [[NavigationDestination]] {
        var result: [[NavigationDestination]] = []
        var index = 0
        while index < menuItems.count {
            let current = menuItems[index]
            
            if current.isHalf(),
               index + 1 < menuItems.count,
               menuItems[index + 1].isHalf() {
                result.append([current, menuItems[index + 1]])
                index += 2
            } else {
                result.append([current])
                index += 1
            }
        }
        return result
    }
}

#Preview {
    MenuView(model: MenuModel(title: "První den", subtitle: "", backgroundImageName: "title-baby", menuItems: LocalRepository.prvniden
                             ), clientName: "Name", path: .constant(NavigationPath()))
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

private struct MenuItemView: View {
    let menuItem: NavigationDestination
    
    var body: some View {
        VStack {
            switch menuItem {
            case .stories(let model):
                MenuItem(item: model)
            case .text(let model):
                MenuItem(item: model)
            case .menu(let model):
                MenuItem(item: model)
            case .detail(let model):
                MenuItem(item: model)
            case .introText(let model):
                IntroTextView(model: model)
            }
            
            if menuItem.needSpace() {
                Color.clear.frame(height: 10)
            }
        }
    }
}

private struct DoubleMenuItemView: View {
    let item: [NavigationDestination]
    
    var body: some View {
            HStack(spacing: 20) {
                ForEach(item.indices, id: \.self) { index in
                    MenuItemView(menuItem: item[index])
                }
        }
    }
}

private struct IntroTextView: View {
    let model: IntroTextModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(model.title)
                .bold()
            Divider()
            Text(model.content)
                .multilineTextAlignment(.leading)
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .padding(.vertical, 10)
    }
}


