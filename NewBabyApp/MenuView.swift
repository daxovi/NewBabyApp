//
//  MenuView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 19.01.2025.
//

import SwiftUI

struct MenuView: View {
    let headerImageString: String?
    let clientName: String?
    let subtitle: String?
    let menuItems: [NavigationDestination]
    let title: String
    let heartTapAction: (() -> Void)?
    
    @Binding var path: NavigationPath
    @State private var showVideo: Bool = false
    @State private var isSearchActive: Bool = false
    
    init(model: MenuModel, clientName: String?, path: Binding<NavigationPath>, heartTapAction: (() -> Void)? = nil) {
        self.headerImageString = model.headerImageString
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

            MenuBackground()
            
            ScrollView {
                if headerImageString != nil {
                    MenuHeader(clientName: clientName, subtitle: subtitle, heartTapAction: heartTapAction)
                }
                
                if let headerImageString {
                    Image(headerImageString)
                        .resizable()
                        .scaledToFit()
                }
                
                if groupedMenuItems().count == 0 {
                    Spacer(minLength: 200)
                }
                                
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
//                .shadow(color: .black.opacity(0.2), radius: 2, x: 0, y: 1)
                
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
        .sheet(isPresented: $isSearchActive, content: {
            SearchView()
        })
        .navigationTitle(title)
        .toolbar {
//            ToolbarItem(placement: .topBarLeading) {
//                Image("fnol-heart")
//                    .renderingMode(.template)
//                    .resizable()
//                    .scaledToFit()
//                    .padding(.vertical, 6)
//                    .foregroundStyle(.accent)
//            }
            if headerImageString != nil {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.accent)
                        .onTapGesture {
                            isSearchActive = true
                        }
                }
            }
        }
//        .navigationBarHidden(backgroundImageName != nil)
//        .navigationBarTitleDisplayMode(.inline)
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

#Preview {
    NavigationStack {
        MenuView(
            model: MenuModel(
                title: "První den",
                subtitle: "Váš průvodce prvními okamžiky",
                backgroundImageName: "title-pregnant",
                menuItems: [
//                    .introText(IntroTextModel(
//                        title: "Vítejte",
//                        content: try! AttributedString(markdown: "Vítejte v aplikaci pro nové rodiče!"),
//                        isCollapsable: false
//                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        bannerName: "banner-bonding",
                        isHalf: false,
                        stories: []
                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        bannerName: "porod-do-vody-0",
                        isHalf: false,
                        stories: []
                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        isHalf: false,
                        stories: []
                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        isHalf: false,
                        stories: []
                    )),
                    .stories(StoriesModel(
                        title: "První kroky",
                        bannerName: "predporodni-kurzy",
                        isHalf: false,
                        stories: []
                    )),
                    .podcast(PodcastModel(
                        title: "Podcast pro rodiče",
                        source: "Ukázkový podcast pro nové rodiče",
                        fileName: "sample-audio",
                        bannerName: nil,
                        isHalf: false
                    ))
                ]
            ),
            clientName: "Anna Nováková",
            path: .constant(NavigationPath())
        )
    }
}

// Extension pro vytvoření modelů pro preview
extension MenuModel {
    init(title: String, subtitle: String? = nil, backgroundImageName: String? = nil, menuItems: [NavigationDestination]) {
        self.id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.headerImageString = backgroundImageName
        self.menuItems = menuItems
        self.bannerName = nil
        self.isHalf = false
    }
}

extension IntroTextModel {
    init(title: String, content: AttributedString, isCollapsable: Bool = false) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.isCollapsable = isCollapsable
    }
}

extension PodcastModel {
    init(title: String, source: String, fileName: String, bannerName: String? = nil, isHalf: Bool = false) {
        self.id = UUID()
        self.title = title
        self.source = source
        self.fileName = fileName
        self.bannerName = bannerName
        self.isHalf = isHalf
    }
}
