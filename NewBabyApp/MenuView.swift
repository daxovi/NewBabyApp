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
            Color.background
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
                            
                            if getBottomRadius(index) > 0 && !item[0].needSpace() {
                                Color.clear.frame(height: 10)
                            }
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
                
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
        }
        .navigationTitle(title)
        .navigationBarHidden(backgroundImageName != nil)
        .navigationBarTitleDisplayMode(.inline)
    }
        
    func getTopRadius(_ index: Int) -> CGFloat {
        guard index > 0, index - 1 < groupedMenuItems().count else {
            return 0
        }
        
        let prev = groupedMenuItems()[index - 1][0]
        if prev.isBanner() {
            return 10
        }
        
        return 0
    }
    
    func getBottomRadius(_ index: Int) -> CGFloat {
        guard index > 0, index + 1 < groupedMenuItems().count else {
            return 0
        }
        
        let next = groupedMenuItems()[index + 1][0]
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
//
//#Preview {
//    MenuView(
//        model: MenuModel(
//            title: "První den",
//            subtitle: "",
//            backgroundImageName: "title-baby",
//            menuItems: LocalRepository.menuHospital.menuItems
//        ),
//        clientName: "Name",
//        path: .constant(NavigationPath()))
//}
