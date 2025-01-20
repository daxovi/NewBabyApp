//
//  MenuModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 19.01.2025.
//
import SwiftUI

struct MenuModel: Identifiable, Hashable, MenuItemModel {
    var id = UUID()
    var title: String
    var bannerName: String?
    
    func getBanner() -> Image? {
        guard let bannerName = bannerName else { return nil }
        return Image(bannerName)
    }

    var subtitle: String?
    var backgroundImageName: String?
    
    var menuItems: [NavigationDestination]
}
