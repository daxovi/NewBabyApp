//
//  IntroTextModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 28.04.2025.
//

import SwiftUI

struct IntroTextModel: Identifiable, Hashable, MenuItemModel, Decodable {
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
        case titleKey
        case contentKey
        case isCollapsable
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let titleKey = try container.decode(String.self, forKey: .titleKey)
        title = titleKey.localizedString
        let contentKey = try container.decode(String.self, forKey: .contentKey)
        content = contentKey.localizedStringMarkdown
        isCollapsable = try container.decodeIfPresent(Bool.self, forKey: .isCollapsable) ?? false
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
