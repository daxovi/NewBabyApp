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
            .menu(MenuModel(title: "title_poporodukrokzakrokem".localizedString, bannerName: "prvni-den", menuItems: [
                .introText(IntroTextModel(title: "title_prvnidencovasceka".localizedString, content: "detail_prvnidencovasceka".localizedStringMarkdown)),
                
                // MARK: - Bonding
                .menu(MenuModel(title: "title_bonding".localizedString, bannerName: "bonding", menuItems: [
                    .introText(IntroTextModel(title: "title_cojebonding".localizedString, content: "detail_cojebonding".localizedStringMarkdown)),
                    .podcast(PodcastModel(title: "title_bonding".localizedString, fileName: "bonding")),
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
                
                // MARK: - Jak vypadá miminko po poro=du
                .stories(StoriesModel(title: "title_jakvypadamiminkopoporodu".localizedString, stories: [
                    Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-1", text: "jak_vypada_miminko_po_porodu_1".localizedString),
                    Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-2", text: "jak_vypada_miminko_po_porodu_2".localizedString),
                    Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-3", text: "jak_vypada_miminko_po_porodu_3".localizedString),
                ])),
                
                // MARK: - Měření tělesné teploty
                .stories(StoriesModel(title: "title_merenitelesneteploty".localizedString, stories: [
                    Story(type: .video, sourceName: "mereni-teploty-1", text: "mereni_teploty_1".localizedString),
                    Story(type: .video, sourceName: "mereni-teploty-2", text: "mereni_teploty_2".localizedString),
                    Story(type: .video, sourceName: "mereni-teploty-3", text: "mereni_teploty_3".localizedString),
                ])),
                
                // MARK: - Označení novorozence
                .stories(StoriesModel(title: "title_oznaceninovorozence".localizedString, stories: [
                    Story(type: .image, sourceName: "oznaceni-novorozence-1", text: "oznaceni_novorozence_1".localizedString),
                    Story(type: .image, sourceName: "oznaceni-novorozence-2", text: "oznaceni_novorozence_2".localizedString)
                ])),
                
                // MARK: - Močení
                .stories(StoriesModel(title: "title_moceniaodchodstolicky".localizedString, stories: [
                    Story(type: .image, sourceName: "moceni-a-odchod-stolicky-1", text: "moceni_a_odchod_stolicky_1".localizedString),
                    Story(type: .image, sourceName: "moceni-a-odchod-stolicky-2", text: "moceni_a_odchod_stolicky_2".localizedString),
                ])),
                
                // MARK: - Váha a délka miminka
                .stories(StoriesModel(title: "title_vahaadelkamiminka".localizedString, stories: [
                    Story(type: .image, sourceName: "vaha-a-delka-miminka-1", text: "vaha_a_delka_miminka_1".localizedString),
                    Story(type: .image, sourceName: "vaha-a-delka-miminka-2", text: "vaha_a_delka_miminka_2".localizedString),
                ])),
                
                // MARK: - Vitamín K
                .menu(MenuModel(title: "title_vitamink".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_ochranaprednecekanymkrvacenimvitamink".localizedString, content: "detail_ochranaprednecekanymkrvacenimvitamink".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_cojekrvacinanemocvitamink".localizedString, content: "detail_cojekrvacinanemocvitamink".localizedStringMarkdown, isCollapsable: true)),
                    .stories(StoriesModel(title: "title_jaksekrvacinemocipredchazivitamink".localizedString, bannerName: "placeholder", stories: [
                        Story(type: .image, sourceName: "vitamin-k-1", text: "vitamin_k_1".localizedString),
                        Story(type: .image, sourceName: "vitamin-k-2", text: "vitamin_k_2".localizedString),
                        Story(type: .image, sourceName: "vitamin-k-3", text: "vitamin_k_3".localizedString)
                    ])),
                    .introText(IntroTextModel(title: "title_procjevitaminkdoporuceny".localizedString, content: "detail_procjevitaminkdoporuceny".localizedStringMarkdown, isCollapsable: true))
                ])),
                
                // MARK: - Vyšetření krtevní skupiny
                .stories(StoriesModel(title: "title_vysetrenikrevniskupiny".localizedString, stories: [
                    Story(type: .image, sourceName: "vysetreni-krevni-skupiny-1", text: "vysetreni_krevni_skupiny_1".localizedString),
                    Story(type: .image, sourceName: "vysetreni-krevni-skupiny-2", text: "vysetreni_krevni_skupiny_2".localizedString)
                ]))
            ])),
            .menu(MenuModel(title: "title_zdravipodkontrolou".localizedString, bannerName: "zdravi-pod-kontrolou", menuItems: [
                
                // MARK: - Novorozenecký laboratorní screening
                .menu(MenuModel(title: "title_nls".localizedString, bannerName: "novorozenecky-laboratorni-screening-0", menuItems: [
                    .introText(IntroTextModel(title: "title_cojenls".localizedString, content: "detail_cojenls".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_kdysescreeningsedyzakalprovadi".localizedString, content: "detail_kdysenlsprovadi".localizedStringMarkdown)),
                    .stories(StoriesModel(title: "title_jaksenlsprovadi".localizedString, bannerName: "nls-jak-se-odber-provadi-0", stories: [
                        Story(type: .video, sourceName: "novorozenecky-screening-1", text: "novorozenecky_screening_1".localizedString),
                        Story(type: .video, sourceName: "novorozenecky-screening-2", text: "novorozenecky_screening_2".localizedString)])),
                    .introText(IntroTextModel(title: "title_jaksenlsvyhodnocuje".localizedString, content: "detail_jaksenlsvyhodnocuje".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_muzebytmojeditenemocnenls".localizedString, content: "detail_muzebytmojeditenemocnenls".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_jakenenemocilzenlsodhalit".localizedString, content: "detail_jakenenemocilzenlsodhalit".localizedStringMarkdown, isCollapsable: true))
                ])),
                
                // MARK: - Žloutenka
                .menu(MenuModel(title: "title_zloutenka".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_cojezloutenka".localizedString, content: "detail_cojezloutenka".localizedStringMarkdown)),
                    
                    .stories(StoriesModel(title: "title_jakejsoupriznakyzloutenky".localizedString, bannerName: "jake-jsou-priznaky-zloutenky-0", stories: [
                        Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-1", text: "jake_jsou_priznaky_zloutenky_1".localizedString),
                        Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-2", text: "jake_jsou_priznaky_zloutenky_2".localizedString),
                        Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-3", text: "jake_jsou_priznaky_zloutenky_3".localizedString),
                        ])),
                    
                    .introText(IntroTextModel(title: "title_kdysezloutenkaobjevuje".localizedString, content: "detail_kdysezloutenkaobjevuje".localizedStringMarkdown)),
                    
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
                    .introText(IntroTextModel(title: "title_procseprovadisvsv".localizedString, content: "detail_procseprovadisvsv".localizedStringMarkdown)),
                    .stories(StoriesModel(title: "title_jakprobihamerenisvsv".localizedString, bannerName: "srdecni-vady-jak-probiha-mereni-0", stories: [
                        Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-1", text: "srdecni_jak_probiha_mereni_1".localizedString),
                        Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-2", text: "srdecni_jak_probiha_mereni_2".localizedString),
                        Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-3", text: "srdecni_jak_probiha_mereni_3".localizedString)])),
                    .introText(IntroTextModel(title: "title_kdysedozvimvysledeksvsv".localizedString, content: "detail_kdysedozvimvysledeksvsv".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_jakemohoubytvysledkysvsv".localizedString, content: "detail_jakemohoubytvysledkysvsv".localizedStringMarkdown, isCollapsable: true))
                    ])),
                
                // MARK: - vyšetření sluchu
                .menu(MenuModel(title: "title_vysetrenisluchu".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_procseprovadivysetrenisluchu".localizedString, content: "detail_procseprovadivysetrenisluchu".localizedStringMarkdown)),
                    .stories(StoriesModel(title: "title_jakprobihavysetrenisluchu".localizedString, bannerName: "jakprobihavysetrenisluchu-0", stories: [
                        Story(type: .video, sourceName: "vysetreni-sluchu-1", text: "vysetreni_sluchu_1".localizedString),
                        Story(type: .video, sourceName: "vysetreni-sluchu-2", text: "vysetreni_sluchu_2".localizedString),
                        Story(type: .video, sourceName: "vysetreni-sluchu-3", text: "vysetreni_sluchu_3".localizedString)
                        ])),
                    .stories(StoriesModel(title: "title_kdysevysetrenisluchuprovadi".localizedString, bannerName: "kdysevysetrenisluchuprovadi-0", stories: [
                        Story(type: .image, sourceName: "vysetreni-sluchu-4", text: "vysetreni_sluchu_4".localizedString),
                        Story(type: .image, sourceName: "vysetreni-sluchu-5", text: "vysetreni_sluchu_5".localizedString),
                        Story(type: .image, sourceName: "vysetreni-sluchu-6", text: "vysetreni_sluchu_6".localizedString),
                        Story(type: .image, sourceName: "vysetreni-sluchu-7", text: "vysetreni_sluchu_7".localizedString),
                        ])),
                    .introText(IntroTextModel(title: "title_kdysedozvimvysledekvysetrenisluchu".localizedString, content: "detail_kdysedozvimvysledekvysetrenisluchu".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_jakemohoubytvysledkyvysetrenisluchu".localizedString, content: "detail_jakemohoubytvysledkyvysetrenisluchu".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_cokdyzsescreeningnepovedevysetrenisluchu".localizedString, content: "detail_cokdyzsescreeningnepovedevysetrenisluchu".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_procjevysetrenisluchudulezite".localizedString, content: "detail_procjevysetrenisluchudulezite".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_muzemitmojediteporuchusluchu".localizedString, content: "detail_muzemitmojediteporuchusluchu".localizedStringMarkdown, isCollapsable: true))
                ])),
                
                // MARK: - Šedý zákal
                .menu(MenuModel(title: "title_screeningnavrozenysedyzakal".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_cojesedyzakal".localizedString, content: "detail_cojesedyzakal".localizedStringMarkdown)),
                    .stories(StoriesModel(title: "title_jakprobihavysetrenisedyzakal".localizedString, bannerName: "jakprobihavysetrenisedyzakal-0", stories: [
                        Story(type: .image, sourceName: "vysetreni-sedy-zakal-1", text: "vysetreni_sedy_zakal_1".localizedString),
                        Story(type: .video, sourceName: "vysetreni-sedy-zakal-2", text: "vysetreni_sedy_zakal_2".localizedString),
                        Story(type: .image, sourceName: "vysetreni-sedy-zakal-3", text: "vysetreni_sedy_zakal_3".localizedString)])),
                    .introText(IntroTextModel(title: "title_procjescreeningsedyzakaldulezity".localizedString, content: "detail_procjescreeningsedyzakaldulezity".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_kdysescreeningsedyzakalprovadi".localizedString, content: "detail_kdysescreeningsedyzakalprovadi".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_kdysedozvimvysledeksedyzakal".localizedString, content: "detail_kdysedozvimvysledeksedyzakal".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_coznamenapozitivnivysledeksedyzakal".localizedString, content: "detail_coznamenapozitivnivysledeksedyzakal".localizedStringMarkdown, isCollapsable: true)),
                    .introText(IntroTextModel(title: "title_jakcastosesedyzakalvyskytuje".localizedString, content: "detail_jakcastosesedyzakalvyskytuje".localizedStringMarkdown, isCollapsable: true)),
                ])),
                
                // MARK: - Syfilis
                .menu(MenuModel(title: "title_screeningvrozenesyfilis".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_jakprobihavysetrenisyfilis".localizedString, content: "detail_jakprobihavysetrenisyfilis".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_jakemohoubytvysledkysyfilis".localizedString, content: "detail_jakemohoubytvysledkysyfilis".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_kdysedozvimvysledeksyfilis".localizedString, content: "detail_kdysedozvimvysledeksyfilis".localizedStringMarkdown))
                    ])),
                
                // MARK: - Vyšetření ledvin
                .menu(MenuModel(title: "title_vysetreniledvin".localizedString, menuItems: [
                    .stories(StoriesModel(title: "title_jakprobihavysetreniledvin".localizedString, bannerName: "jakprobihavysetreniledvin-0", stories: [
                        Story(type: .video, sourceName: "vysetreni-ledvin-1", text: "vysetreni_ledvin_1".localizedString),
                        Story(type: .video, sourceName: "vysetreni-ledvin-2", text: "vysetreni_ledvin_2".localizedString),
                        Story(type: .video, sourceName: "vysetreni-ledvin-3", text: "vysetreni_ledvin_3".localizedString),
                        Story(type: .video, sourceName: "vysetreni-ledvin-4", text: "vysetreni_ledvin_4".localizedString),
                        Story(type: .video, sourceName: "vysetreni-ledvin-5" , text: "vysetreni_ledvin_5".localizedString),
                        Story(type: .video, sourceName: "vysetreni-ledvin-6", text: "vysetreni_ledvin_6".localizedString),
                    ])),
                    .introText(IntroTextModel(title: "title_jevysetreniledvinpovinne".localizedString, content: "detail_jevysetreniledvinpovinne".localizedStringMarkdown))
                    ])),
                
                // MARK: - Vyšetření dětským ortopedem
                .menu(MenuModel(title: "title_vysetrenidetskymortopedem".localizedString, menuItems: [
                    .introText(IntroTextModel(title: "title_vysetrenikycliadolnichkoncetinortopedem".localizedString, content: "detail_vysetrenikycliadolnichkoncetinortopedem".localizedStringMarkdown)),
                    .stories(StoriesModel(title: "title_jakprobihavysetreniortopedem".localizedString, bannerName: "jakprobihavysetreniortopedem-0", stories: [
                        Story(type: .video, sourceName: "vysetreni-detsky-ortoped-1", text: "vysetreni_detsky_ortoped_1".localizedString),
                        Story(type: .video, sourceName: "vysetreni-detsky-ortoped-2", text: "vysetreni_detsky_ortoped_2".localizedString),
                        ])),
                    .introText(IntroTextModel(title: "title_procjevysetreniortopedemdulezite".localizedString, content: "detail_procjevysetreniortopedemdulezite".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_kdyvysetreniortopedemprobiha".localizedString, content: "detail_kdyvysetreniortopedemprobiha".localizedStringMarkdown)),
                    .introText(IntroTextModel(title: "title_kdyznenivsechnojakmabytvysetreniortopedem".localizedString, content: "detail_kdyznenivsechnojakmabytvysetreniortopedem".localizedStringMarkdown, isCollapsable: true)),
                    .stories(StoriesModel(title: "title_sirokebalenivysetreniortopedem".localizedString, bannerName: "placeholder", stories: []))
            ])),
            ])),
            .menu(MenuModel(title: "title_porod".localizedString, bannerName: "porod", menuItems: [
                .introText(IntroTextModel(title: "title_porod".localizedString, content: "detail_porod".localizedStringMarkdown)),
                
                .stories(StoriesModel(title: "title_jaktounasvypadaporod".localizedString, bannerName: "jak-to-u-nas-vypada-0", stories: [
                        Story(type: .video, sourceName: "jak-to-u-nas-vypada-1", text: "jak_to_u_nas_vypada_1".localizedString),
                        Story(type: .video, sourceName: "jak-to-u-nas-vypada-2", text: "jak_to_u_nas_vypada_2".localizedString),
                    ])),
                .stories(StoriesModel(title: "title_vasecestaporodem".localizedString, bannerName: "vase-cesta-porodem-0", stories: [
                    Story(type: .image, sourceName: "vase-cesta-porodem-2", text: "vase_cesta_porodem_2".localizedString),
                    Story(type: .image, sourceName: "vase-cesta-porodem-3", text: "vase_cesta_porodem_3".localizedString),
                    Story(type: .image, sourceName: "vase-cesta-porodem-4", text: "vase_cesta_porodem_4".localizedString),
                    Story(type: .image, sourceName: "vase-cesta-porodem-5", text: "vase_cesta_porodem_5".localizedString),
                    Story(type: .image, sourceName: "vase-cesta-porodem-6", text: "vase_cesta_porodem_6".localizedString),
                ])),
                .podcast(PodcastModel(title: "title_poroddovody".localizedString, fileName: "poroddovody")),
                .menu(MenuModel(title: "title_fazeporodu".localizedString, bannerName: "placeholder", menuItems: [
                    .introText(IntroTextModel(title: "title_jakejsoufazeporodu".localizedString, content: "detail_jakejsoufazeporodu".localizedStringMarkdown)),
                    .menu(MenuModel(title: "title_idobaporodniporod".localizedString, menuItems: [
                        .introText(IntroTextModel(title: "title_cosedejevprvnifaziporodu".localizedString, content: "detail_cosedejevprvnifaziporodu".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_monitorovanibehemporodu".localizedString, bannerName: "placeholder", stories: [
                            Story(type: .video, sourceName: "monitorovani-behem-porodu-1", text: "monitorovani_behem_porodu_1".localizedString),
                            Story(type: .video, sourceName: "monitorovani-behem-porodu-2", text: "monitorovani_behem_porodu_2".localizedString),
                            Story(type: .video, sourceName: "monitorovani-behem-porodu-3", text: "monitorovani_behem_porodu_3".localizedString),
                        ])),
                        .introText(IntroTextModel(title: "title_moznostitlumenibolestibehemporodu".localizedString, content: "detail_moznostitlumenibolestibehemporodu".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_tlumenibolestibezleku".localizedString, bannerName: "tlumenibolestibezleku-0", isHalf: true, stories: [
                            Story(type: .video, sourceName: "tlumeni-bolesti-bez-leku-1", text: "tlumeni_bolesti_bez_leku_1".localizedString),
                            Story(type: .video, sourceName: "tlumeni-bolesti-bez-leku-2", text: "tlumeni_bolesti_bez_leku_2".localizedString),
                            Story(type: .video, sourceName: "tlumeni-bolesti-bez-leku-3", text: "tlumeni_bolesti_bez_leku_3".localizedString),
                            Story(type: .video, sourceName: "tlumeni-bolesti-bez-leku-4", text: "tlumeni_bolesti_bez_leku_4".localizedString),
                            Story(type: .video, sourceName: "tlumeni-bolesti-bez-leku-5", text: "tlumeni_bolesti_bez_leku_5".localizedString),
                        ])),
                        .stories(StoriesModel(title: "title_tlumenibolestispouzitimleku".localizedString, bannerName: "tlumenibolestispouzitimleku-0", isHalf: true, stories: [
                            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-1", text: "tlumeni_bolesti_s_pouzitim_leku_1".localizedString),
                            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-2", text: "tlumeni_bolesti_s_pouzitim_leku_2".localizedString),
                            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-3", text: "tlumeni_bolesti_s_pouzitim_leku_3".localizedString),
                            
                        ])),
                        .introText(IntroTextModel(title: "title_kdyzporodpottrebujepomociifazeporodni".localizedString, content: "detail_kdyzporodpotrebujepomocifazeporodni".localizedStringMarkdown)),
                        .introText(IntroTextModel(title: "title_moznekomplikaceivfazeporodu".localizedString, content: "detail_moznekomplikaceidobaporodni".localizedStringMarkdown, isCollapsable: true))
                    ])),
                    .menu(MenuModel(title: "title_iidobaporodniporod".localizedString, menuItems: [
                        .introText(IntroTextModel(title: "title_cosedejevedruhefaziporodu".localizedString, content: "detail_cosedejevedruhefaziporodu".localizedStringMarkdown)),
                        .introText(IntroTextModel(title: "title_kdyzporodpottrebujepomociifazeporodni".localizedString, content: "detail_kdyzporodpotrebujepomociifazeporodni".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_polohapritlaceni".localizedString, bannerName: "placeholder", stories: [
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-1", text: "poloha_pri_tlaceni_1".localizedString),
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-2", text: "poloha_pri_tlaceni_2".localizedString),
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-3", text: "poloha_pri_tlaceni_3".localizedString),
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-4", text: "poloha_pri_tlaceni_4".localizedString),
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-5", text: "poloha_pri_tlaceni_5".localizedString),
                            Story(type: .video, sourceName: "poloha-pri-tlaceni-6", text: "poloha_pri_tlaceni_6".localizedString),
                        ])),
                        .introText(IntroTextModel(title: "title_chranenihrazebehemporodu".localizedString, content: "detail_chranenihrazebehemporodu".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_poporodu".localizedString, bannerName: "placeholder", stories: [
                            Story(type: .image, sourceName: "po-porodu-1", text: "po_porodu_1".localizedString),
                            Story(type: .image, sourceName: "po-porodu-2", text: "po_porodu_2".localizedString),
                            Story(type: .image, sourceName: "po-porodu-3", text: "po_porodu_3".localizedString),
                        ])),
                        .introText(IntroTextModel(title: "title_moznekomplikaceiidobaporodni".localizedString, content: "detail_moznekomplikaceiidobaporodni".localizedStringMarkdown)),
                        .introText(IntroTextModel(title: "title_vakuumextrakce".localizedString, content: "vakuumextrakce_1".localizedStringMarkdown, isCollapsable: true)),
                        .introText(IntroTextModel(title: "title_porodnickekleste".localizedString, content: "porodnicke_kleste_1".localizedStringMarkdown, isCollapsable: true)),
                    ])),
                    .menu(MenuModel(title: "title_iiidobaporodniporod".localizedString, menuItems: [
                        .introText(IntroTextModel(title: "title_cosedejevetretifaziporodu".localizedString, content: "detail_cosedejevetretifaziporodu".localizedStringMarkdown)),
                        .introText(IntroTextModel(title: "title_jakprobihaiiifazeporodu".localizedString, content: "detail_jakprobihaiiifazeporodu".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_placentajakoodkaz".localizedString, bannerName: "placeholder", stories: [
                            Story(type: .image, sourceName: "iii-doba-porodni-placenta-jako-odkaz-1", text: "iii_doba_porodni_placenta_jako_odkaz_1".localizedString),
                            ])),
                        .introText(IntroTextModel(title: "title_moznekomplikaceivfazeporodu".localizedString, content: "detail_moznekomplikaceiiifazeporodu".localizedStringMarkdown, isCollapsable: true)),
                        .introText(IntroTextModel(title: "title_moznostireseniiiifazeporodu".localizedString, content: "detail_moznostireseniiiifazeporodu".localizedStringMarkdown, isCollapsable: true))
                    ])),
                    .menu(MenuModel(title: "title_ivdobaporodniporod".localizedString, menuItems: [
                        .introText(IntroTextModel(title: "title_cosedejevectvrtefaziporodu".localizedString, content: "detail_cosedejevectvrtefaziporodu".localizedStringMarkdown)),
                        .stories(StoriesModel(title: "title_jakprobihaivfazeporodni".localizedString, bannerName: "placeholder", stories: [
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-1", text: "iv_doba_porodni_jak_probiha_1".localizedString),
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-2", text: "iv_doba_porodni_jak_probiha_2".localizedString),
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-3", text: "iv_doba_porodni_jak_probiha_3".localizedString),
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-4", text: "iv_doba_porodni_jak_probiha_4".localizedString),
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-5", text: "iv_doba_porodni_jak_probiha_5".localizedString),
                            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-6", text: "iv_doba_porodni_jak_probiha_6".localizedString)
                        ])),
                        .introText(IntroTextModel(title: "title_moznostireseniivfazeporodu".localizedString, content: "detail_moznostireseniivfazeporodu".localizedStringMarkdown))
                    ])),
                ])),
                
                
                // MARK: - Vyvolání porodu
                .stories(StoriesModel(title: "title_vyvolaniporodu".localizedString, bannerName: "vyvolani-porodu-0", stories: [
                    Story(type: .image, sourceName: "preindukce-porodu-1", text: "preindukce_porodu_1".localizedString),
                    Story(type: .image, sourceName: "preindukce-porodu-2", text: "preindukce_porodu_2".localizedString),
                    Story(type: .image, sourceName: "preindukce-porodu-3", text: "preindukce_porodu_3".localizedString)
                ])),
                
                // MARK: - Císařský řez
                .stories(StoriesModel(title: "title_akutnicisarskyrez".localizedString, bannerName: "akutni-cisarsky-rez-0", isHalf: true, stories: [
                    Story(type: .image, sourceName: "akutni-cisarsky-rez-1", text: "akutni_cisarsky_rez_1".localizedString),
                    Story(type: .image, sourceName: "akutni-cisarsky-rez-2", text: "akutni_cisarsky_rez_2".localizedString),
                    Story(type: .image, sourceName: "akutni-cisarsky-rez-3", text: "akutni_cisarsky_rez_3".localizedString),
                    Story(type: .image, sourceName: "akutni-cisarsky-rez-4", text: "akutni_cisarsky_rez_4".localizedString),
                ])),
                .stories(StoriesModel(title: "title_planovanycisarskyrez".localizedString, bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-1", text: "planovany_cisarsky_rez_1".localizedString),
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-2", text: "planovany_cisarsky_rez_2".localizedString),
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-3", text: "planovany_cisarsky_rez_3".localizedString),
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-4", text: "planovany_cisarsky_rez_4".localizedString),
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-5", text: "planovany_cisarsky_rez_5".localizedString),
                    Story(type: .image, sourceName: "planovany-cisarsky-rez-6", text: "planovany_cisarsky_rez_6".localizedString)
                ])),
                
                // MARK: - Porod do vody
                .stories(StoriesModel(title: "title_poroddovody".localizedString, bannerName: "porod-do-vody-0", stories: [
                    
                ])),
            ]))
        ]
    )
        
}
