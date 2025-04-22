//
//  HomeRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
    
    static let menuHome = MenuModel(
        title: "Jsem doma",
        subtitle: "Inspirace a podpora pro psychické i fyzické pohodlí maminky i tatínka, protože harmonická rodina je klíčem ke spokojenému miminku.",
        backgroundImageName: "title-home",
        menuItems: [
            .detail(DetailModel(title: "Podpora pro rodiče", bannerName: "podpora-pro-rodice")),
            .detail(DetailModel(title: "Bezpečí", bannerName: "bezpeci")),
            .detail(DetailModel(title: "Energie pro dva", bannerName: "energie-pro-dva")),
            .detail(DetailModel(title: "Kojení doma", bannerName: "kojeni-doma"))
        ]
    )
}
