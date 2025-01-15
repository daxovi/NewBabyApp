//
//  LocalRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 09.01.2025.
//

class LocalRepository {
    static let bonding: [any MenuItemModel] = [
        DetailModel(title: "Bonding", bannerName: "banner-bonding")
        ]
    
    static let testovaci: [any MenuItemModel] = [
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        
        StoriesModel(title: "Manipulace s dítětem", stories: [
            Story(type: .video, sourceName: "tygrik01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .video, sourceName: "tygrik02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .video, sourceName: "tygrik03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .video, sourceName: "tygrik04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi."),
            Story(type: .video, sourceName: "tygrik05", text: "Přechod z chování v poloze na druhou stranu."),
            Story(type: .video, sourceName: "tygrik06", text: "V poloze je hlavička podepřená, ručičky a nožičky míří před tělo."),
        ]),
        
        StoriesModel(title: "Animace", stories: [
            Story(type: .video, sourceName: "cliptest", text: ""),
            Story(type: .video, sourceName: "animace", text: ""),
            Story(type: .video, sourceName: "cliptest", text: ""),
            Story(type: .video, sourceName: "cliptest", text: "")
        ]),
        
        StoriesModel(title: "Otáčení", stories: [
            Story(type: .image, sourceName: "otaceni01", text: "Jenom tak klidně levitují ve vzduchu."),
            Story(type: .image, sourceName: "otaceni02", text: "Jenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají."),
            Story(type: .image, sourceName: "otaceni03", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .image, sourceName: "otaceni04", text: "Jenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají.")
        ]),
    ]

    static let prvniDen: [any MenuItemModel] = [
        DetailModel(title: "Ošetření po narození"),
        DetailModel(title: "Kojení")
    ]

    static let manipulaceSDitetem: [any MenuItemModel] = [
        StoriesModel(title: "Poloha tygříka - díly", bannerName: "banner-manipulacesditetem", stories: [
            Story(type: .video, sourceName: "tygrik01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .video, sourceName: "tygrik02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .video, sourceName: "tygrik03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .video, sourceName: "tygrik04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi."),
            Story(type: .video, sourceName: "tygrik05", text: "Přechod z chování v poloze na druhou stranu."),
            Story(type: .video, sourceName: "tygrik06", text: "V poloze je hlavička podepřená, ručičky a nožičky míří před tělo."),
        ]),
    ]
    
    static let druhyDen: [any MenuItemModel] = [
        StoriesModel(title: "Manipulace fotky", stories: [
            Story(type: .image, sourceName: "otaceni01", text: "Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu."),
            Story(type: .image, sourceName: "otaceni02", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .image, sourceName: "otaceni03", text: "Zkrátka široko daleko nikde nic."),
            Story(type: .image, sourceName: "otaceni04", text: "Jenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají."),
            Story(type: .image, sourceName: "otaceni05", text: "Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě."),
            Story(type: .image, sourceName: "otaceni06", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .image, sourceName: "otaceni07", text: "Zkrátka široko daleko nikde nikdo.")
        ]),
        StoriesModel(title: "Zvedání novorozemce", stories: [
            Story(type: .video, sourceName: "zvedani01", text: "Zkrátka široko daleko nikde nikdo."),
            Story(type: .video, sourceName: "zvedani02", text: ""),
            Story(type: .video, sourceName: "zvedani03", text: "Jenom tak klidně levitují ve vzduchu.")
        ]),
        StoriesModel(title: "Balení novorozence", stories: [
            Story(type: .video, sourceName: "zabaleni01", text: "K západu hledali mráček marně."),
            Story(type: .video, sourceName: "zabaleni02", text: "Jenže kvůli všudy přítomné trávě jsou stíny."),
            Story(type: .video, sourceName: "zabaleni03", text: ""),
            Story(type: .video, sourceName: "zabaleni04", text: "")
        ])
    ]
    
    static let tretiDen: [any MenuItemModel] = [
        DetailModel(title: "Měření žloutenky"),
        DetailModel(title: "Fototerapie"),
        DetailModel(title: "Propuštění z porodnice")
    ]
    
    static let predporodniKurzy: [any MenuItemModel] = [
        DetailModel(title: "Nordic Walking pro těhotné"),
            DetailModel(title: "Exkurze v porodnici"),
            DetailModel(title: "Kompletní předporodní kurz"),
        DetailModel(title: "Plavání"),
    ]
    
    static let screeningyProTehotne: [any MenuItemModel] = [
        DetailModel(title: "screening v I. trimestru těhotenství"),
            DetailModel(title: "Ultrazvukové vyšetření"),
            DetailModel(title: "Superkonziliární ultrazvukové vyšetření"),
        DetailModel(title: "Echokardiografické vyšetření"),
    ]
    
    static let porod: [any MenuItemModel] = [
        DetailModel(title: "Aromaterapie"),
            DetailModel(title: "Porod")
    ]
}
