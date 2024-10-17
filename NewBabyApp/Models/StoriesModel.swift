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

    var stories: [Story]

    func getBanner() -> Image? {
        guard let bannerName = bannerName else {
            return nil
        }

        // Získání cesty k souboru uvnitř balíčku aplikace
        if let filePath = Bundle.main.path(
            forResource: bannerName, ofType: "jpg")
        {
            if let uiImage = UIImage(contentsOfFile: filePath) {
                return Image(uiImage: uiImage)
            } else {
                print("Obrázek \(bannerName) nebyl nalezen.")
            }
        } else {
            print("Cesta k souboru \(bannerName) nebyla nalezena.")
        }

        return nil
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
