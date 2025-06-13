//
//  PorodRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 12.05.2025.
//

extension LocalRepository {
    
    static let porod: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_porod".localizedString, content: "detail_porod".localizedString)),
        
        .stories(StoriesModel(title: "title_jaktounasvypadaporod".localizedString, bannerName: "jak-to-u-nas-vypada-0", stories: [
                Story(type: .image, sourceName: "jak-to-u-nas-vypada-1", text: "jak_to_u_nas_vypada_1".localizedString),
                Story(type: .image, sourceName: "jak-to-u-nas-vypada-2", text: "jak_to_u_nas_vypada_2".localizedString),
            ])),
        .stories(StoriesModel(title: "title_vasecestaporodem".localizedString, bannerName: "vase-cesta-porodem-0", stories: [
            Story(type: .image, sourceName: "vase-cesta-porodem-2", text: "Pvase_cesta_porodem_2".localizedString),
            Story(type: .image, sourceName: "vase-cesta-porodem-3", text: "vase_cesta_porodem_3".localizedString),
            Story(type: .image, sourceName: "vase-cesta-porodem-4", text: "vase_cesta_porodem_4".localizedString),
            Story(type: .image, sourceName: "vase-cesta-porodem-5", text: "vase_cesta_porodem_5".localizedString),
            Story(type: .image, sourceName: "vase-cesta-porodem-6", text: "vase_cesta_porodem_6".localizedString),
        ])),
        
        .menu(MenuModel(title: "title_idobaporodniporod".localizedString, menuItems: iDobaPorodni)),
        .menu(MenuModel(title: "title_iidobaporodniporod".localizedString, menuItems: iiDobaPorodni)),
        .menu(MenuModel(title: "title_iiidobaporodniporod".localizedString, menuItems: iiiDobaPorodni)),
        .menu(MenuModel(title: "title_ivdobaporodniporod".localizedString, menuItems: ivDobaPorodni)),
        
        // MARK: - Porod do vody
        .stories(StoriesModel(title: "title_poroddovody".localizedString, bannerName: "porod-do-vody-0", stories: [
            
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
            Story(type: .image, sourceName: "akutni-cisarsky-rez-5", text: "akutni_cisarsky_rez_5".localizedString)
        ])),
        .stories(StoriesModel(title: "title_planovanycisarskyrez".localizedString, bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
            Story(type: .image, sourceName: "planovany-cisarsky-rez-1", text: "planovany_cisarsky_rez_1".localizedString),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-2", text: "planovany_cisarsky_rez_2".localizedString),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-3", text: "planovany_cisarsky_rez_3".localizedString),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-4", text: "planovany_cisarsky_rez_4".localizedString),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-5", text: "planovany_cisarsky_rez_5".localizedString),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-6", text: "planovany_cisarsky_rez_6".localizedString)
        ])),
    ]
    
    
    // MARK: - I. doba
    static let iDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_cosedejevprvnifaziporodu".localizedString, content: "detail_cosedejevprvnifaziporodu".localizedString)),
        .introText(IntroTextModel(title: "title_kdyzporodpottrebujepomociifazeporodni".localizedString, content: "detail_kdyzporodpotrebujepomoc".localizedString)),
        .stories(StoriesModel(title: "title_monitorovanibehemporodu".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "monitorovani-behem-porodu-1", text: "monitorovani_behem_porodu_1".localizedString),
            Story(type: .image, sourceName: "monitorovani-behem-porodu-2", text: "monitorovani_behem_porodu_2".localizedString),
        ])),
        .introText(IntroTextModel(title: "title_moznostitlumenibolestibehemporodu".localizedString, content: "detail_moznostitlumenibolestibehemporodu".localizedString)),
        .stories(StoriesModel(title: "title_tlumenibolestibezleku".localizedString, bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-1", text: "tlumeni_bolesti_bez_leku_1".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-2", text: "tlumeni_bolesti_bez_leku_2".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-3", text: "tlumeni_bolesti_bez_leku_3".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-4", text: "tlumeni_bolesti_bez_leku_4".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-5", text: "tlumeni_bolesti_bez_leku_5".localizedString),
        ])),
        .stories(StoriesModel(title: "title_tlumenibolestispouzitimleku".localizedString, bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-1", text: "tlumeni_bolesti_s_pouzitim_leku_1".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-2", text: "tlumeni_bolesti_s_pouzitim_leku_2".localizedString),
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-3", text: "tlumeni_bolesti_s_pouzitim_leku_3".localizedString),
            
        ])),
        .introText(IntroTextModel(title: "title_moznekomplikaceivfazeporodu".localizedString, content: "detail_moznekomplikaceidobaporodni".localizedString, isCollapsable: true))
    ]
    
    // MARK: - II. doba
    static let iiDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_cosedejevedruhefaziporodu".localizedString, content: "detail_cosedejevedruhefaziporodu".localizedString)),
        .introText(IntroTextModel(title: "title_kdyzporodpottrebujepomociifazeporodni".localizedString, content: "detail_kdyzporodpottrebujepomociifazeporodni".localizedString)),
        .stories(StoriesModel(title: "title_polohapritlaceni".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "poloha-pri-tlaceni-1", text: "poloha_pri_tlaceni_1".localizedString),
            Story(type: .image, sourceName: "poloha-pri-tlaceni-2", text: "poloha_pri_tlaceni_2".localizedString),
        ])),
        .stories(StoriesModel(title: "title_chranenihrazebehemporodu".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-1", text: "chraneni_hraze_behem_porodu_1".localizedString),
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-2", text: "chraneni_hraze_behem_porodu_2".localizedString),
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-3", text: "chraneni_hraze_behem_porodu_3".localizedString)
        ])),
        .stories(StoriesModel(title: "title_poporodu".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "po-porodu-1", text: "po_porodu_1".localizedString),
            Story(type: .image, sourceName: "po-porodu-2", text: "po_porodu_2".localizedString),
            Story(type: .image, sourceName: "po-porodu-3", text: "po_porodu_3".localizedString),
            Story(type: .image, sourceName: "po-porodu-4", text: "po_porodu_4".localizedString)
        ])),
        .introText(IntroTextModel(title: "title_moznekomplikaceiidobaporodni".localizedString, content: "detail_moznekomplikaceiidobaporodni".localizedString)),
        .stories(StoriesModel(title: "title_vakuumextrakce".localizedString, bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "vakuumextrakce-1", text: "vakuumextrakce_1".localizedString),
        ])),
        .stories(StoriesModel(title: "title_porodnickekleste".localizedString, bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "porodnicke-kleste-1", text: "porodnicke_kleste_1".localizedString)
        ]))
    ]
    
    // MARK: - III. doba
    static let iiiDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_cosedejevetretifaziporodu".localizedString, content: "detail_cosedejevetretifaziporodu".localizedString)),
        .stories(StoriesModel(title: "title_jakprobihaivfazeporodni".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-1", text: "iii_doba_porodni_jak_probiha_1".localizedString),
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-2", text: "iii_doba_porodni_jak_probiha_2".localizedString),
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-3", text: "iii_doba_porodni_jak_probiha_3".localizedString)
        ])),
        .introText(IntroTextModel(title: "title_moznekomplikaceivfazeporodu".localizedString, content: "detail_moznekomplikaceiiifazeporodu".localizedString)),
        .introText(IntroTextModel(title: "title_moznostireseniiiifazeporodu".localizedString, content: "detail_moznostireseniiiifazeporodu".localizedString))
    ]
    
    // MARK: - IV. doba
    static let ivDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "title_cosedejevectvrtefaziporodu".localizedString, content: "detail_cosedejevectvrtefaziporodu".localizedString)),
        .stories(StoriesModel(title: "title_jakprobihaivfazeporodni".localizedString, bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-1", text: "iv_doba_porodni_jak_probiha_1".localizedString),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-2", text: "iv_doba_porodni_jak_probiha_2".localizedString),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-3", text: "iv_doba_porodni_jak_probiha_3".localizedString),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-4", text: "iv_doba_porodni_jak_probiha_4".localizedString),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-5", text: "iv_doba_porodni_jak_probiha_5".localizedString),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-6", text: "iv_doba_porodni_jak_probiha_6".localizedString)
        ])),
        .introText(IntroTextModel(title: "title_moznekomplikaceivfazeporodu".localizedString, content: "detail_moznekomplikaceivfazeporodu".localizedString)),
        .introText(IntroTextModel(title: "title_moznostireseniivfazeporodu".localizedString, content: "detail_moznostireseniivfazeporodu".localizedString))
    ]
    
}
