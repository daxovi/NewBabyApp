//
//  MainMenuRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
        
    static let menuHospital = MenuModel(
        title: "Jsem v porodnici",
        subtitle: "Praktické tipy a rady o péči o vaše novorozené miminko.",
        backgroundImageName: "title-baby",
        menuItems: [
            .menu(MenuModel(title: "První den", bannerName: "prvni-den", menuItems: prvniden)),
            .detail(DetailModel(title: "Zdraví pod kontrolou", bannerName: "zdravi-pod-kontrolou")),
            .menu(MenuModel(title: "Bezpečná maipulace", bannerName: "bezpecna-manipulace", menuItems: manipulace)),
            .detail(DetailModel(title: "Kojení a výživa", bannerName: "kojeni-a-vyziva")),
            .detail(DetailModel(title: "Chystáme se domů", bannerName: "chystame-se-domu"))
        ]
    )
        
    
    static let prvniden: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co vás čeká?", content: "Tady bysme mohli napsat informaci že to nemusí být první den")),
        .menu(MenuModel(title: "Bonding", bannerName: "zdravi-pod-kontrolou", menuItems: bonding)),
        .stories(StoriesModel(title: "Jak vypadá miminko po porodu", stories: [])),
        .stories(StoriesModel(title: "Měření tělesné teploty", stories: [])),
        .stories(StoriesModel(title: "Označení novorozence", stories: [])),
        .stories(StoriesModel(title: "Močení a odchod stoličky", stories: [])),
        .stories(StoriesModel(title: "Váha a délka miminka", stories: [])),
        .stories(StoriesModel(title: "Vitamin K", stories: [])),
        .stories(StoriesModel(title: "Vyšetření krevní skupiny novorozence", stories: []))
    ]
    
    static let bonding: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co je bonding?", content: "Bonding, neboli kontakt kůže na kůži (skin-to-skin), je proces vytváření láskyplné vazby mezi rodičem a dítětem. Bezprostředně po porodu se miminko položí přímo na nahou hruď maminky, kde cítí její teplo, tlukot srdce a vůni.")),
        .stories(StoriesModel(title: "Jak bonding probíhá?", bannerName: "zdravi-pod-kontrolou", stories: [])),
        .stories(StoriesModel(title: "Proč je bonding důležitý?", bannerName: "zdravi-pod-kontrolou", isHalf: true, stories: [])),
        .stories(StoriesModel(title: "Bonding s tatínkem", bannerName: "zdravi-pod-kontrolou", isHalf: true, stories: []))
    ]
    
    private static let manipulace: [NavigationDestination] = [
        .stories(StoriesModel(title: "Poloha tygříka - stories", stories: [
            Story(type: .video, sourceName: "tygrik01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .video, sourceName: "tygrik02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .video, sourceName: "tygrik03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .video, sourceName: "tygrik04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi."),
            Story(type: .video, sourceName: "tygrik05", text: "Přechod z chování v poloze na druhou stranu."),
            Story(type: .video, sourceName: "tygrik06", text: "V poloze je hlavička podepřená, ručičky a nožičky míří před tělo."),
        ])),
        .stories(StoriesModel(title: "Poloha tygříka - fotky", stories: [
            Story(type: .image, sourceName: "otaceni01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .image, sourceName: "otaceni02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .image, sourceName: "otaceni03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .image, sourceName: "otaceni04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi.")
        ]))
    ]
    
   

    //---
    static let manipulaceSDitetem: [NavigationDestination] = [
        .stories(StoriesModel(
            title: "Poloha tygříka - díly",
            bannerName: "banner-manipulacesditetem",
            stories: [
                Story(type: .video, sourceName: "tygrik01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
                Story(type: .video, sourceName: "tygrik02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
                Story(type: .video, sourceName: "tygrik03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
                Story(type: .video, sourceName: "tygrik04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi."),
                Story(type: .video, sourceName: "tygrik05", text: "Přechod z chování v poloze na druhou stranu."),
                Story(type: .video, sourceName: "tygrik06", text: "V poloze je hlavička podepřená, ručičky a nožičky míří před tělo.")
            ]
        )),
        .stories(StoriesModel(title: "Otáčení - fotky", stories: [
            Story(type: .image, sourceName: "otaceni01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .image, sourceName: "otaceni02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .image, sourceName: "otaceni03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .image, sourceName: "otaceni04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi.")
        ]))
    ]
}
