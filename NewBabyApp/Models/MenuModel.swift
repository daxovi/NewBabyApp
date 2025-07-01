//
//  MenuModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 19.01.2025.
//
import SwiftUI

struct MenuModel: Identifiable, Hashable, MenuItemModel, Decodable {

    var id = UUID()
    var title: String
    var bannerName: String?
    var isHalf: Bool = false
    var needSpace: Bool {
        bannerName != nil
    }

    func getBanner() -> Image? {
        guard let bannerName = bannerName else { return nil }
        return Image(bannerName)
    }

    var subtitle: String?
    var backgroundImageName: String?

    var menuItems: [NavigationDestination]

    enum CodingKeys: String, CodingKey {
        case titleKey
        case bannerName
        case isHalf
        case subtitleKey
        case backgroundImageName
        case menuItems
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let titleKey = try container.decode(String.self, forKey: .titleKey)
        title = titleKey.localizedString
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        if let subKey = try container.decodeIfPresent(String.self, forKey: .subtitleKey) {
            subtitle = subKey.localizedString
        }
        backgroundImageName = try container.decodeIfPresent(String.self, forKey: .backgroundImageName)
        menuItems = try container.decode([NavigationDestination].self, forKey: .menuItems)
    }
}
