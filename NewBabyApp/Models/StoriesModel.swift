//
//  StoriesModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//
import SwiftUI

struct StoriesModel: Identifiable, Hashable, Equatable, MenuItemModel, Decodable {
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
}

struct Story: Identifiable, Equatable, Hashable, Decodable {
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
}

extension StoriesModel {
    enum CodingKeys: String, CodingKey {
        case titleKey
        case bannerName
        case isHalf
        case stories
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let titleKey = try container.decode(String.self, forKey: .titleKey)
        title = titleKey.localizedString
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        stories = try container.decode([Story].self, forKey: .stories)
    }
}

extension Story {
    enum CodingKeys: String, CodingKey {
        case type
        case sourceName
        case textKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(StoryType.self, forKey: .type)
        sourceName = try container.decode(String.self, forKey: .sourceName)
        let textKey = try container.decode(String.self, forKey: .textKey)
        text = textKey.localizedString
    }
}
