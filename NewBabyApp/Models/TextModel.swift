//
//  TextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//

import SwiftUI

struct TextModel: Identifiable, Hashable, MenuItemModel, Codable {
    var id = UUID()
    // data pro zobrazení v menu aplikace
    var title: String
    var bannerName: String?
    var isHalf: Bool = false
    var needSpace: Bool {
        bannerName != nil
    }

    func getBanner() -> Image? {
        // Bezpečné rozbalení optional stringu
        guard let bannerName = bannerName else {
            return nil
        }
        return Image(bannerName)
    }

    var imageName: String?
    var text: String

    enum CodingKeys: String, CodingKey { case id, title, bannerName, isHalf, imageName, text }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        title = try container.decode(String.self, forKey: .title)
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
        text = try container.decode(String.self, forKey: .text)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(bannerName, forKey: .bannerName)
        try container.encode(isHalf, forKey: .isHalf)
        try container.encodeIfPresent(imageName, forKey: .imageName)
        try container.encode(text, forKey: .text)
    }

}
