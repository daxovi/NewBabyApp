//
//  StoriesModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 15.10.2024.
//
import SwiftUI

struct StoriesModel: Identifiable, Hashable, Equatable, MenuItemModel {
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

struct Story: Identifiable, Equatable, Hashable {
    var id = UUID()
    var type: StoryType
    var sourceName: String
    var text: String

    static func == (lhs: Story, rhs: Story) -> Bool {
        return lhs.sourceName == rhs.sourceName
    }

    enum StoryType {
        case image, video
    }
}
