//
//  DetailModel.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct DetailModel: Identifiable, Hashable, MenuItemModel {
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
