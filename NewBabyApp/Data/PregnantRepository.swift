//
//  PregnantRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
    
    static let menuPregnant = MenuModel(
        title: "Čekám miminko",
        subtitle: "Základní informace o těhotenství a porodu, které vám pomohou s přípravou na velký den.",
        backgroundImageName: "title-pregnant",
        menuItems: [
            .detail(DetailModel(title: "Předporodní kurzy", bannerName: "predporodni-kurzy")),
            .detail(DetailModel(title: "screeningy", bannerName: "screeningy")),
            .detail(DetailModel(title: "Nadstandardní služby", bannerName: "sluzby")),
            .detail(DetailModel(title: "Porod", bannerName: "porod"))
        ]
    )
}
