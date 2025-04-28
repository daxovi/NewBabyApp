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
        .introText(IntroTextModel(title: "Co vás čeká?", content: "Všechny děti i maminky mají svůj vlastní rytmus. Pokud se vaše první dny budou odlišovat, je to naprosto v pořádku. Důležité je, že na to nejste sami.")),
        .menu(MenuModel(title: "Bonding", bannerName: "bonding", menuItems: bonding)),
        .stories(StoriesModel(title: "Jak vypadá miminko po porodu", stories: [
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-1", text: "Kůže novorozence je často vlhká od plodové vody a pokrytá bílým mázkem. Mazek chrání kůži miminka děloze a mají důležitou roli i po porodu."),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-2", text: "Když se vaše miminko narodí, jeho kůže může mít namodralý nádech. To je zcela normální a během prvních minut po porodu se barva kůže postupně změní na růžovou."),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-3", text: "Plodová voda a mázek pomáhají novorozenci rozpoznat vůně a chutě, které znal z dělohy. Díky tomu se cítí bezpečně v novém prostředí."),
        ])),
        // TODO: dodělat obrázky - názvy souborů jsou prázdné
        .stories(StoriesModel(title: "Měření tělesné teploty", stories: [
            Story(type: .image, sourceName: "mereni-teploty-1", text: "Pro nejpřesnější výsledek se teplota miminka měří v konečníku."),
            Story(type: .image, sourceName: "mereni-teploty-2", text: "Pokud je teplota příliš nízká, můžeme miminko uložit na vyhřívanou podložku."),
            Story(type: .image, sourceName: "mereni-teploty-3", text: "Ve zcela výjimečných případech je nutné je dát do inkubátoru nebo na vyhřívané lůžko."),
        ])),
        .stories(StoriesModel(title: "Označení novorozence", stories: [
            Story(type: .image, sourceName: "oznaceni-novorozence-1", text: "Po porodu dostane vaše miminko na zápěstí papírový náramek s identifikačními údaji."),
            Story(type: .image, sourceName: "oznaceni-novorozence-2", text: "Při prvním ošetření po dvou hodinách je navíc označeno barvou na hrudníček a nožičku pro ještě větší bezpečnost.")
        ])),
        .stories(StoriesModel(title: "Močení a odchod stoličky", stories: [
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-1", text: "Většina miminek se během prvního dne po narození alespoň jednou vymočí."),
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-2", text: "První stolička - smolka -  by měla odejít do 48 hodin po porodu."),
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-3", text: "Smolka je první stolice novorozence – má černou, mazlavou konzistenci.")
        ])),
        .stories(StoriesModel(title: "Váha a délka miminka", stories: [
            Story(type: .image, sourceName: "vaha-a-delka-miminka-1", text: "Miminko vážíme až po ukončení bondingu, tedy přibližně 2 hodiny po narození."),
            Story(type: .image, sourceName: "vaha-a-delka-miminka-2", text: "V den porodu se délka určuje pouze odhadem na základě tělesné hmotnosti."),
            Story(type: .image, sourceName: "vaha-a-delka-miminka-3", text: "Tento přístup minimalizuje zbytečnou manipulaci a zajišťuje miminku pohodlí.")
        ])),
        .stories(StoriesModel(title: "Vitamin K", stories: [
            Story(type: .image, sourceName: "vitamin-k-1", text: "Při prvním ošetření po bondingu dostává miminko 2 kapky vitamínu K (Kanavit) přímo do pusinky."),
            Story(type: .image, sourceName: "vitamin-k-2", text: "Vitamin K předchází rozvoji krvácivé nemoci novorozence.")
        ])),
        .stories(StoriesModel(title: "Vyšetření krevní skupiny novorozence", stories: [
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-1", text: "Krevní skupinu novorozence vyšetřujeme pouze v případě, že maminka má krevní skupinu 0 nebo Rh faktor negativní (-)."),
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-2", text: "Vzorek se odebírá z pupečníkové krve, takže není potřeba žádný odběr krve přímo u miminka.")
        ]))
    ]
    
    static let bonding: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co je bonding?", content: "Bonding, neboli kontakt kůže na kůži (skin-to-skin), je proces vytváření láskyplné vazby mezi rodičem a dítětem. Bezprostředně po porodu se miminko položí přímo na nahou hruď maminky, kde cítí její teplo, tlukot srdce a vůni.")),
        .stories(StoriesModel(title: "Jak bonding probíhá?", bannerName: "jak_bonding_probiha", stories: [
            Story(type: .image, sourceName: "jak-bonding-probiha-1", text: "Po porodu je novorozenec položen na nahou hruď maminky."),
            Story(type: .image, sourceName: "jak-bonding-probiha-2", text: "Přikryje se vyhřátým ručníkem pro udržení tepla."),
            Story(type: .image, sourceName: "jak-bonding-probiha-3", text: "Kontakt by měl trvat alespoň 2 hodiny."),
            Story(type: .image, sourceName: "jak-bonding-probiha-4", text: "Během bondingu se většinou miminko poprvé přisává k prsu."),
            Story(type: .image, sourceName: "jak-bonding-probiha-5", text: "Pomáhá miminku zklidnit se a adaptovat na novou situaci."),
            Story(type: .image, sourceName: "jak-bonding-probiha-6", text: "Miminko je během bondingu monitorováno pomocí saturačního čidla na ručičce."),
            Story(type: .image, sourceName: "jak-bonding-probiha-7", text: "Kontroluje se okysličení krve a tep srdce novorozence."),
        ])),
        .stories(StoriesModel(title: "Proč je bonding důležitý?", bannerName: "proc_je_bonding_dulezity", isHalf: true, stories: [
            Story(type: .image, sourceName: "proc-je-bonding-dulezity-1", text: "Posiluje citové pouto mezi rodičem a dítětem."),
            Story(type: .image, sourceName: "proc-je-bonding-dulezity-2", text: "Podporuje úspěšný začátek kojení."),
            Story(type: .image, sourceName: "proc-je-bonding-dulezity-3", text: "Reguluje tělesnou teplotu, dech a srdeční rytmus miminka."),
            
        ])),
        .stories(StoriesModel(title: "Bonding s tatínkem", bannerName: "bonding_s_tatinkem", isHalf: true, stories: [
            Story(type: .image, sourceName: "bonding-s-tatinkem-1", text: "Pokud maminka nemůže bonding absolvovat, může tuto důležitou roli převzít tatínek."),
            Story(type: .image, sourceName: "bonding-s-tatinkem-2", text: "Jeho náruč poskytne miminku pocit bezpečí a jistoty."),
            
        ]))
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
