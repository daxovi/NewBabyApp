//
//  LocalRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 09.01.2025.
//
import SwiftUI

class LocalRepository {
    
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
    
    private static let prvniden: [NavigationDestination] = [
        .text(TextModel(
            title: "Jak vypadá dítě po porodu?",
            text: "Když se vaše dítě narodí, jeho kůže může být modrá. Modré zbarvení kůže rychle ustupuje v prvních minutách po porodu. Kůže je často mokrá od plodové vody a je pokrytá mázkem. Plodová voda a mázek se vyskytovali již během těhotenství v děloze. Mimo jiné jsou důležité pro rozvoj čichu a chuti. Pomáhají vašemu dítěti cítit se bezpečně v novém světě mimo dělohu.")),
        .text(TextModel(
            title: "Bonding",
            text: "tento termín označuje proces utváření laskyplné vazby mezi matkou a dítětem. Bezprostředně po porodu začíná přiložením novorozence na tělo maminky (kontakt kůže novorozence na kůži maminky, tzv. skin-to-skin kontakt).  Pokud to dovolí Váš zdravotní stav a Vaše dítě bude po narození v pořádku, uděláme maximum proto, aby jsme Vaše miminko po narození položili na Vás. V případě potřeby se můžete vystřídat s tatínkem. ")),
        .text(TextModel(
            title: "Váha a délka",
            text: "miminko Vážíme ve velké většině případů vážíme po ukončení  bondingu (přibližně 2 hodiny po narození). Délku miminka v den porodu určujeme jen odhadem na základně tělesné hmotnosti (je to pro něho šetrnější).")),
        .text(TextModel(title: "Značení novorozence", text: "po porodu dostane Vaše dítě identifikační náramek, současně ho označíme omyvatelnou barvou na hrudník a nohu. ")),
        .text(TextModel(title: "Změření tělesné teploty", text: "Probíha měřením  teploty v zadečku. V případě že je teplota nízká, můžeme miminko uložit na vyhřívanou podložku, nebo někdy i do inkubátoru.")),
        .text(TextModel(title: "Vitamín K", imageName: "kanavit", text: "Po porodu dostává miminko do pusy kapky s  vitaminem K (Kanavit). Jedná se o vitamin, který zabraňuje rozvoji krvácivé nemoci novorozence. Tato nemoc vzniká právě z nedostatku vitaminu K.")),
        .text(TextModel(title: "Vyšetření krevní skupiny", text: "Krevní skupinu Vašeho dítěte vyšetřujeme jen za situace, kdy má maminka krevní skupinu 0, nebo Rh faktor -.  Vyšetření krevní skupiny novorozence se provádí z pupečníkové krve a nevyžaduje si odběr krve u dítěte.")),
        .text(TextModel(title: "První močení a smolka", text: "Ve velké většině případů se Vaše miminko minimálně jednou vymočí a odejde stolička, která je zcela černá, mazlavá - říká se jí smolka."))
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
    
    /*

    static let menuHospital = MenuModel(title: "", subtitle: "Praktické tipy a rady o péči o vaše novorozené miminko.", backgroundImage: Image("title-baby"), menuItems: [
        DetailModel(title: "Prvních 24 hodin", bannerName: "banner-manipulacesditetem"),
        DetailModel(title: "Polohování novorozence", bannerName: "banner-bonding"),
        DetailModel(title: "Kojení", bannerName: "banner-manipulacesditetem"),
        DetailModel(title: "VYšetření novorozence", bannerName: "banner-manipulacesditetem")
        ])
    
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
    
    static let kanavit: [any MenuItemModel] = [
        TextModel(title: "Vitamín K", imageName: "kanavit", text: "Po porodu dostává miminko do pusy kapky s  vitaminem K (Kanavit). Jedná se o vitamin, který zabraňuje rozvoji krvácivé nemoci novorozence. Tato nemoc vzniká právě z nedostatku vitaminu K.")
        ]
     */
}
