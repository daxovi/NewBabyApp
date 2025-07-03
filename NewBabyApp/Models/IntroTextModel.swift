//
//  IntroTextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 28.04.2025.
//

import SwiftUI

struct IntroTextModel: Identifiable, Hashable, MenuItemModel, Codable {
    var id = UUID()
    // data pro zobrazení v menu aplikace
    var title: String
    var content: AttributedString
    var isCollapsable: Bool = false
    
    let bannerName: String? = nil
    let isHalf: Bool = false
    let needSpace: Bool = true

    func getBanner() -> Image? {
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case id, title, content, isCollapsable
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        title = try container.decode(String.self, forKey: .title).localizedString
        content = try container.decode(String.self, forKey: .content).localizedStringMarkdown
        isCollapsable = try container.decodeIfPresent(Bool.self, forKey: .isCollapsable) ?? false
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(String(content.characters), forKey: .content)
        try container.encode(isCollapsable, forKey: .isCollapsable)
    }
    

    /*
     Model musí obsahovat:
     Array video souborů nebo obrázků
     ke každému videu a obrázku text
     nakonec markdown dokument
     
     Informace pro menu:
     informace o tom jestli je to obrázkový banner nebo textový
     
     Musí být vyřešené zobrazení obrázků i videí v jednom array
     Nesmí se rozbít když nebude předaný titulek k videu/obrázku
     
     Markdown musíá kombinovat texty a obrázky
     */
}
