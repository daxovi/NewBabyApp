//
//  MenuModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 19.01.2025.
//
import SwiftUI

struct MenuModel: Identifiable, Hashable, MenuItemModel, Codable {

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
    var headerImageString: String?

    var menuItems: [NavigationDestination]

    enum CodingKeys: String, CodingKey {
        case id, title, bannerName, isHalf, subtitle, backgroundImageName, menuItems
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        title = try container.decode(String.self, forKey: .title).localizedString
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)?.localizedString
        headerImageString = try container.decodeIfPresent(String.self, forKey: .backgroundImageName)
        menuItems = try container.decode([NavigationDestination].self, forKey: .menuItems)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(bannerName, forKey: .bannerName)
        try container.encode(isHalf, forKey: .isHalf)
        try container.encodeIfPresent(subtitle, forKey: .subtitle)
        try container.encodeIfPresent(headerImageString, forKey: .backgroundImageName)
        try container.encode(menuItems, forKey: .menuItems)
    }
}
