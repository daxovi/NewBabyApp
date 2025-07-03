//
//  PodcastModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct PodcastModel: Identifiable, Hashable, MenuItemModel, Codable {
    var id = UUID()
    /// Title visible in menu and now playing info
    var title: String
    /// Name of the audio file in app bundle without extension
    var fileName: String
    /// Optional banner image displayed in menu
    var bannerName: String? = nil
    var isHalf: Bool = false
    var needSpace: Bool { bannerName != nil }

    func getBanner() -> Image? {
        return nil
    }

    enum CodingKeys: String, CodingKey { case id, title, fileName, bannerName, isHalf }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        title = try container.decode(String.self, forKey: .title)
        fileName = try container.decode(String.self, forKey: .fileName)
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(fileName, forKey: .fileName)
        try container.encodeIfPresent(bannerName, forKey: .bannerName)
        try container.encode(isHalf, forKey: .isHalf)
    }
}
