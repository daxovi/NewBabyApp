//
//  StoriesModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//
import SwiftUI

struct StoriesModel: Identifiable, Hashable, Equatable, MenuItemModel, Codable {
    var id = UUID()

    var title: String
    var bannerName: String?
    var isHalf: Bool = false
    var needSpace: Bool {
        bannerName != nil
    }

    var stories: [Story]

    func getBanner() -> Image? {
        // Bezpečné rozbalení optional stringu
        guard let bannerName = bannerName else {
            return nil
        }
        return Image(bannerName)
    }

    static func == (lhs: StoriesModel, rhs: StoriesModel) -> Bool {
        return lhs.stories == rhs.stories
    }

    enum CodingKeys: String, CodingKey { case id, title, bannerName, isHalf, stories }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        title = try container.decode(String.self, forKey: .title).localizedString
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        stories = try container.decode([Story].self, forKey: .stories)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encodeIfPresent(bannerName, forKey: .bannerName)
        try container.encode(isHalf, forKey: .isHalf)
        try container.encode(stories, forKey: .stories)
    }
}

struct Story: Identifiable, Equatable, Hashable, Codable {
    var id = UUID()
    var type: StoryType
    var sourceName: String
    var text: String

    static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.sourceName == rhs.sourceName
    }

    enum StoryType: String, Codable {
        case image, video
    }

    enum CodingKeys: String, CodingKey { case id, type, sourceName, text }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        type = try container.decode(StoryType.self, forKey: .type)
        sourceName = try container.decode(String.self, forKey: .sourceName)
        text = try container.decode(String.self, forKey: .text).localizedString
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(sourceName, forKey: .sourceName)
        try container.encode(text, forKey: .text)
    }
}

// MARK: - Direct Initializers for Preview

extension StoriesModel {
    init(title: String, bannerName: String? = nil, isHalf: Bool = false, stories: [Story]) {
        self.id = UUID()
        self.title = title
        self.bannerName = bannerName
        self.isHalf = isHalf
        self.stories = stories
    }
}

extension Story {
    init(type: StoryType, sourceName: String, text: String) {
        self.id = UUID()
        self.type = type
        self.sourceName = sourceName
        self.text = text
    }
}
