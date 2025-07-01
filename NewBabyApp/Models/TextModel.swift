//
//  TextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//

import SwiftUI

struct TextModel: Identifiable, Hashable, MenuItemModel, Decodable {
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

    enum CodingKeys: String, CodingKey {
        case titleKey
        case bannerName
        case isHalf
        case imageName
        case textKey
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let titleKey = try container.decode(String.self, forKey: .titleKey)
        title = titleKey.localizedString
        bannerName = try container.decodeIfPresent(String.self, forKey: .bannerName)
        isHalf = try container.decodeIfPresent(Bool.self, forKey: .isHalf) ?? false
        imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
        let textKey = try container.decode(String.self, forKey: .textKey)
        text = textKey.localizedString
    }

}
