//
//  MainMenuRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 22.04.2025.
//
import SwiftUI

extension LocalRepository {
        
    static let menuHospital = MenuModel(
        title: "title_jsmevporodnici".localizedString,
        subtitle: "subtitle_jsmevporodnici".localizedString,
        backgroundImageName: "title-baby",
        menuItems: [
            .menu(MenuModel(title: "title_poporodukrokzakrokem".localizedString, bannerName: "prvni-den", menuItems: prvniden)),
            .menu(MenuModel(title: "title_zdravipodkontrolou".localizedString, bannerName: "zdravi-pod-kontrolou", menuItems: zdraviPodKontrolou)),
            .menu(MenuModel(title: "title_porod".localizedString, bannerName: "porod", menuItems: porod))
//            .menu(MenuModel(title: "Bezpečná maipulace", bannerName: "bezpecna-manipulace", menuItems: manipulace)),
//            .detail(DetailModel(title: "Kojení a výživa", bannerName: "kojeni-a-vyziva")),
//            .detail(DetailModel(title: "Chystáme se domů", bannerName: "chystame-se-domu"))
        ]
    )
    
    private static let zdraviPodKontrolou: [NavigationDestination] = [
        
        // MARK: - Novorozenecký laboratorní screening
        .menu(MenuModel(title: "title_nls".localizedString, bannerName: "novorozenecky-laboratorni-screening-0", menuItems: [
            .introText(IntroTextModel(title: "title_cojenls".localizedString, content: "detail_cojenls".localizedString)),
            .introText(IntroTextModel(title: "title_kdysescreeningsedyzakalprovadi".localizedString, content: "detail_kdysenlsprovadi".localizedString)),
            .stories(StoriesModel(title: "title_jaksenlsprovadi".localizedString, bannerName: "nls-jak-se-odber-provadi-0", stories: [
                Story(type: .video, sourceName: "novorozenecky-screening-1", text: "novorozenecky_screening_1".localizedString),
                Story(type: .video, sourceName: "novorozenecky-screening-2", text: "novorozenecky_screening_2".localizedString)])),
            .introText(IntroTextModel(title: "title_jaksenlsvyhodnocuje".localizedString, content: "detail_jaksenlsvyhodnocuje".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_muzebytmojeditenemocnenls".localizedString, content: "detail_muzebytmojeditenemocnenls".localizedString)),
            .introText(IntroTextModel(title: "title_jakenenemocilzenlsodhalit".localizedString, content: "detail_jakenenemocilzenlsodhalit".localizedString, isCollapsable: true))
        ])),
        
        // MARK: - Žloutenka
        .menu(MenuModel(title: "title_zloutenka".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_cojezloutenka".localizedString, content: "detail_cojezloutenka".localizedString)),
            .stories(StoriesModel(title: "title_jakejsoupriznakyzloutenky".localizedString, bannerName: "jake-jsou-priznaky-zloutenky-0", stories: [
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-1", text: "jake_jsou_priznaky_zloutenky_1".localizedString),
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-2", text: "jake_jsou_priznaky_zloutenky_2".localizedString),
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-3", text: "jake_jsou_priznaky_zloutenky_3".localizedString),
                ])),
            .introText(IntroTextModel(title: "title_kdysezloutenkaobjevuje".localizedString, content: "detail_kdysezloutenkaobjevuje".localizedString)),
            .stories(StoriesModel(title: "title_jaksezloutenkavysetruje".localizedString, stories: [
                Story(type: .image, sourceName: "jak-se-zloutenka-vysetruje-1", text: "jak_se_zloutenka_vysetruje_1".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-vysetruje-2", text: "jak_se_zloutenka_vysetruje_2".localizedString)])),
            .stories(StoriesModel(title: "title_jaksezloutenkaleci".localizedString, stories: [
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-1", text: "jak_se_zloutenka_leci_1".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-2", text: "jak_se_zloutenka_leci_2".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-3", text: "srdecni_jak_probiha_mereni_3".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-4", text: "jak_se_zloutenka_leci_4".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-5", text: "jak_se_zloutenka_leci_5".localizedString),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-6", text: "jak_se_zloutenka_leci_6".localizedString)])),
        ])),
        
        // MARK: - Screening srdečních vad
        .menu(MenuModel(title: "title_screeningsrdecnichvad".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_procseprovadisvsv".localizedString, content: "detail_procseprovadisvsv".localizedString)),
            .stories(StoriesModel(title: "title_jakprobihamerenisvsv".localizedString, bannerName: "srdecni-vady-jak-probiha-mereni-0", stories: [
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-1", text: "srdecni_jak_probiha_mereni_1".localizedString),
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-2", text: "srdecni_jak_probiha_mereni_2".localizedString),
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-3", text: "srdecni_jak_probiha_mereni_3".localizedString)])),
            .introText(IntroTextModel(title: "title_kdysedozvimvysledeksvsv".localizedString, content: "detail_kdysedozvimvysledeksvsv".localizedString)),
            .introText(IntroTextModel(title: "title_jakemohoubytvysledkysvsv".localizedString, content: "detail_jakemohoubytvysledkysvsv".localizedString, isCollapsable: true))
            ])),
        
        // MARK: - vyšetření sluchu
        .menu(MenuModel(title: "title_vysetrenisluchu".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_procseprovadivysetrenisluchu".localizedString, content: "detail_procseprovadivysetrenisluchu".localizedString)),
            .stories(StoriesModel(title: "title_jakprobihavysetrenisluchu".localizedString, bannerName: "placeholder", stories: [
                Story(type: .video, sourceName: "vysetreni-sluchu-1", text: "vysetreni_sluchu_1".localizedString),
                Story(type: .video, sourceName: "vysetreni-sluchu-2", text: "vysetreni_sluchu_2".localizedString),
                Story(type: .video, sourceName: "vysetreni-sluchu-3", text: "vysetreni_sluchu_3".localizedString)
                ])),
            .stories(StoriesModel(title: "title_kdysevysetrenisluchuprovadi".localizedString, bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-sluchu-4", text: "vysetreni_sluchu_4".localizedString),
                Story(type: .image, sourceName: "vysetreni-sluchu-5", text: "vysetreni_sluchu_5".localizedString),
                Story(type: .image, sourceName: "vysetreni-sluchu-6", text: "vysetreni_sluchu_6".localizedString),
                Story(type: .image, sourceName: "vysetreni-sluchu-7", text: "vysetreni_sluchu_7".localizedString),
                ])),
            .introText(IntroTextModel(title: "title_kdysedozvimvysledekvysetrenisluchu".localizedString, content: "detail_kdysedozvimvysledekvysetrenisluchu".localizedString)),
            .introText(IntroTextModel(title: "title_jakemohoubytvysledkyvysetrenisluchu".localizedString, content: "detail_jakemohoubytvysledkyvysetrenisluchu".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_cokdyzsescreeningnepovedevysetrenisluchu".localizedString, content: "detail_cokdyzsescreeningnepovedevysetrenisluchu".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_procjevysetrenisluchudulezite".localizedString, content: "detail_procjevysetrenisluchudulezite".localizedString)),
            .introText(IntroTextModel(title: "title_muzemitmojediteporuchusluchu".localizedString, content: "detail_muzemitmojediteporuchusluchu".localizedString, isCollapsable: true))
        ])),
        
        // MARK: - Šedý zákal
        .menu(MenuModel(title: "title_screeningnavrozenysedyzakal".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_cojesedyzakal".localizedString, content: "detail_cojesedyzakal".localizedString)),
            .stories(StoriesModel(title: "title_jakprobihavysetrenisedyzakal".localizedString, bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-1", text: "vysetreni_sedy_zakal_1".localizedString),
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-2", text: "vysetreni_sedy_zakal_2".localizedString),
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-3", text: "vysetreni_sedy_zakal_3".localizedString)])),
            .introText(IntroTextModel(title: "title_procjescreeningsedyzakaldulezity".localizedString, content: "detail_procjescreeningsedyzakaldulezity".localizedString)),
            .introText(IntroTextModel(title: "title_kdysescreeningsedyzakalprovadi".localizedString, content: "detail_kdysescreeningsedyzakalprovadi".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_kdysedozvimvysledeksedyzakal".localizedString, content: "detail_kdysedozvimvysledeksedyzakal".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_coznamenapozitivnivysledeksedyzakal".localizedString, content: "detail_coznamenapozitivnivysledeksedyzakal".localizedString, isCollapsable: true)),
            .introText(IntroTextModel(title: "title_jakcastosesedyzakalvyskytuje".localizedString, content: "detail_jakcastosesedyzakalvyskytuje".localizedString, isCollapsable: true)),
        ])),
        
        // MARK: - Syfilis
        .menu(MenuModel(title: "title_screeningvrozenesyfilis".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_jakprobihavysetrenisyfilis".localizedString, content: "detail_jakprobihavysetrenisyfilis".localizedString)),
            .introText(IntroTextModel(title: "title_jakemohoubytvysledkysyfilis".localizedString, content: "detail_jakemohoubytvysledkysyfilis".localizedString)),
            .introText(IntroTextModel(title: "title_kdysedozvimvysledeksyfilis".localizedString, content: "detail_kdysedozvimvysledeksyfilis".localizedString))
            ])),
        
        // MARK: - Vyšetření ledvin
        .menu(MenuModel(title: "title_vysetreniledvin".localizedString, menuItems: [
            .stories(StoriesModel(title: "title_jakprobihavysetreniortopedem".localizedString, bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-ledvin-1", text: "vysetreni_ledvin_1".localizedString),
                Story(type: .image, sourceName: "vysetreni-ledvin-2", text: "vysetreni_ledvin_2".localizedString),
                Story(type: .image, sourceName: "vysetreni-ledvin-3", text: "vysetreni_ledvin_3".localizedString),
                Story(type: .image, sourceName: "vysetreni-ledvin-4", text: "vysetreni_ledvin_4".localizedString),
                Story(type: .image, sourceName: "vysetreni-ledvin-5" , text: "vysetreni_ledvin_5".localizedString),
                Story(type: .image, sourceName: "vysetreni-ledvin-6", text: "vysetreni_ledvin_6".localizedString),
            ])),
            .introText(IntroTextModel(title: "title_jevysetreniledvinpovinne".localizedString, content: "detail_jevysetreniledvinpovinne".localizedString))
            ])),
        
        // MARK: - Vyšetření dětským ortopedem
        .menu(MenuModel(title: "title_vysetrenidetskymortopedem".localizedString, menuItems: [
            .introText(IntroTextModel(title: "title_vysetrenikycliadolnichkoncetinortopedem".localizedString, content: "detail_vysetrenikycliadolnichkoncetinortopedem".localizedString)),
            .stories(StoriesModel(title: "title_jakprobihavysetreniortopedem".localizedString, bannerName: "placeholder", stories: [
                Story(type: .video, sourceName: "vysetreni-detsky-ortoped-1", text: "vysetreni_detsky_ortoped_1".localizedString),
                Story(type: .video, sourceName: "vysetreni-detsky-ortoped-2", text: "vysetreni_detsky_ortoped_2".localizedString),
                ])),
            .introText(IntroTextModel(title: "title_procjevysetreniortopedemdulezite".localizedString, content: "detail_procjevysetreniortopedemdulezite".localizedString)),
            .introText(IntroTextModel(title: "title_kdyvysetreniortopedemprobiha".localizedString, content: "detail_kdyvysetreniortopedemprobiha".localizedString)),
            .introText(IntroTextModel(title: "title_kdyznenivsechnojakmabytvysetreniortopedem".localizedString, content: "detail_kdyznenivsechnojakmabytvysetreniortopedem".localizedString, isCollapsable: true)),
            .stories(StoriesModel(title: "title_sirokebalenivysetreniortopedem".localizedString, bannerName: "placeholder", stories: []))
    ])),
    ]
    
    private static let prvniden: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_prvnidencovasceka".localizedString, content: "detail_prvnidencovasceka".localizedString)),
        
        // MARK: - Bonding
        .menu(MenuModel(title: "title_bonding".localizedString, bannerName: "bonding", menuItems: [
            .introText(IntroTextModel(title: "title_cojebonding".localizedString, content: "detail_cojebonding".localizedString)),
            .stories(StoriesModel(title: "title_jakbondingprobiha".localizedString, bannerName: "jak_bonding_probiha", stories: [
                Story(type: .image, sourceName: "jak-bonding-probiha-1", text: "jak_bonding_probiha_1".localizedString),
                Story(type: .image, sourceName: "jak-bonding-probiha-2", text: "jak_bonding_probiha_2".localizedString),
                Story(type: .image, sourceName: "jak-bonding-probiha-3", text: "jak_bonding_probiha_3".localizedString),
                Story(type: .image, sourceName: "jak-bonding-probiha-4", text: "jak_bonding_probiha_4".localizedString),
                Story(type: .image, sourceName: "jak-bonding-probiha-5", text: "jak_bonding_probiha_5".localizedString),
                Story(type: .image, sourceName: "jak-bonding-probiha-6", text: "jak_bonding_probiha_6".localizedString),
            ])),
            .stories(StoriesModel(title: "title_procjebondingdulezity".localizedString, bannerName: "proc_je_bonding_dulezity", isHalf: true, stories: [
                Story(type: .image, sourceName: "proc-je-bonding-dulezity-1", text: "proc_je_bonding_dulezity_1".localizedString),
                Story(type: .image, sourceName: "proc-je-bonding-dulezity-2", text: "proc_je_bonding_dulezity_2".localizedString),
                Story(type: .image, sourceName: "proc-je-bonding-dulezity-3", text: "proc_je_bonding_dulezity_3".localizedString),
                
            ])),
            .stories(StoriesModel(title: "title_bondingstatinkem".localizedString, bannerName: "bonding_s_tatinkem", isHalf: true, stories: [
                Story(type: .image, sourceName: "bonding-s-tatinkem-1", text: "bonding_s_tatinkem_1".localizedString),
                Story(type: .image, sourceName: "bonding-s-tatinkem-2", text: "bonding_s_tatinkem_2".localizedString),
            ]))])),
        .stories(StoriesModel(title: "title_jakvypadamiminkopoporodu".localizedString, stories: [
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-1", text: "jak_vypada_miminko_po_porodu_1".localizedString),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-2", text: "jak_vypada_miminko_po_porodu_2".localizedString),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-3", text: "jak_vypada_miminko_po_porodu_3".localizedString),
        ])),
        .stories(StoriesModel(title: "title_merenitelesneteploty".localizedString, stories: [
            Story(type: .video, sourceName: "mereni-teploty-1", text: "mereni_teploty_1".localizedString),
            Story(type: .video, sourceName: "mereni-teploty-2", text: "mereni_teploty_2".localizedString),
            Story(type: .video, sourceName: "mereni-teploty-3", text: "mereni_teploty_3".localizedString),
        ])),
        .stories(StoriesModel(title: "title_oznaceninovorozence".localizedString, stories: [
            Story(type: .image, sourceName: "oznaceni-novorozence-1", text: "oznaceni_novorozence_1".localizedString),
            Story(type: .image, sourceName: "oznaceni-novorozence-2", text: "oznaceni_novorozence_2".localizedString)
        ])),
        .stories(StoriesModel(title: "title_moceniaodchodstolicky".localizedString, stories: [
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-1", text: "moceni_a_odchod_stolicky_1".localizedString),
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-2", text: "moceni_a_odchod_stolicky_2".localizedString),
        ])),
        .stories(StoriesModel(title: "title_vahaadelkamiminka".localizedString, stories: [
            Story(type: .image, sourceName: "vaha-a-delka-miminka-1", text: "vaha_a_delka_miminka_1".localizedString),
            Story(type: .image, sourceName: "vaha-a-delka-miminka-2", text: "vaha_a_delka_miminka_2".localizedString),
        ])),
        .stories(StoriesModel(title: "title_vitamink".localizedString, stories: [
            Story(type: .image, sourceName: "vitamin-k-1", text: "vitamin_k_1".localizedString),
        ])),
        .stories(StoriesModel(title: "title_vysetrenikrevniskupiny".localizedString, stories: [
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-1", text: "vysetreni_krevni_skupiny_1".localizedString),
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-2", text: "vysetreni_krevni_skupiny_2".localizedString)
        ]))
    ]
}
