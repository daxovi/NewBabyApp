//
//  PorodRepository.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 12.05.2025.
//

extension LocalRepository {
    
    static let porod: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Porod", content: "Naším posláním je respektovat přirozený průběh porodu a zároveň být připraveni na nečekané situace. Naším cílem je vždy zajistit bezpečí maminky i miminka.")),
        
        .stories(StoriesModel(title: "Jak to u nás vypadá?", bannerName: "jak-to-u-nas-vypada-0", stories: [
                Story(type: .image, sourceName: "jak-to-u-nas-vypada-1", text: "Velmi nás těší, že jste si pro narození svého miminka vybrala právě naši porodnici."),
                Story(type: .image, sourceName: "jak-to-u-nas-vypada-2", text: "Přejeme si společně s vámi, aby porod vašeho miminka proběhl hladce a podle vašich představ."),
            ])),
        .stories(StoriesModel(title: "Vaše cesta porodem", bannerName: "vase-cesta-porodem-0", stories: [
            Story(type: .image, sourceName: "vase-cesta-porodem-2", text: "Porod je přirozený proces, který probíhá ve čtyřech fázích. "),
            Story(type: .image, sourceName: "vase-cesta-porodem-3", text: "Přibližně 85 % porodů proběhně bez komplikací, u zbývajících 15 % dochází k situacím, které vyžadují lékařský zásah."),
            Story(type: .image, sourceName: "vase-cesta-porodem-4", text: "Porodní asistentka vede samostatně porod u žen s nízkým rizikem komplikací, vždy s přihlédnutím ke stavu při příjmu. Lékař je přivolán, kdykoliv to vyžaduje situace."),
            Story(type: .image, sourceName: "vase-cesta-porodem-5", text: "U žen s vyšším rizikem komplikací vedou porod lékař společně s porodní asistentkou."),
            Story(type: .image, sourceName: "vase-cesta-porodem-6", text: "Během třetí fáze porodu je na sále přítomna i sestra z novorozeneckého oddělení, která zajišťuje navazující péči o miminko. V případě komplikací je přivolán neonatolog - specialista na péči o novorozence."),
        ])),
        
        .menu(MenuModel(title: "I. doba porodní – otevírání porodních cest", menuItems: iDobaPorodni)),
        .menu(MenuModel(title: "II. doba porodní", menuItems: iiDobaPorodni)),
        .menu(MenuModel(title: "III. doba porodní", menuItems: iiiDobaPorodni)),
        .menu(MenuModel(title: "IV. doba porodní", menuItems: ivDobaPorodni)),
        
        // MARK: - Porod do vody
        .stories(StoriesModel(title: "Porod do vody", bannerName: "porod-do-vody-0", stories: [
            
        ])),
        
        // MARK: - Vyvolání porodu
        .stories(StoriesModel(title: "Vyvolání porodu", bannerName: "vyvolani-porodu-0", stories: [
            Story(type: .image, sourceName: "preindukce-porodu-1", text: "Vyvolání porodu je vždy indikováno lékařem. Vlastní formu nebo jeho kombinaci určuje lékař."),
            Story(type: .image, sourceName: "preindukce-porodu-2", text: "Mechanická forma kdy je katetr s balonkem, naplněným tekutinou, zavedený do oblasti děložního čípku. Tlakem balonku na čípek dochází k jeho otevírání"),
            Story(type: .image, sourceName: "preindukce-porodu-3", text: "Chemická forma – většinou polknutím tablety dochází k vyvoláním děložních kontrakcí.")
        ])),
        
        // MARK: - Císařský řez
        .stories(StoriesModel(title: "Akutní císařský řez", bannerName: "akutni-cisarsky-rez-0", isHalf: true, stories: [
            Story(type: .image, sourceName: "akutni-cisarsky-rez-1", text: "Při akutním císařském řezu je operace většinou vedena v celkové anestezii."),
            Story(type: .image, sourceName: "akutni-cisarsky-rez-2", text: "Pokud to stav vás i vašeho miminka dovoluje, snažíme se o časný bonding co nejdříve po operaci"),
            Story(type: .image, sourceName: "akutni-cisarsky-rez-3", text: "Vašemu doprovodu /nejčastěji otci dítěte/ je umožněn bonding záhy po porodu"),
            Story(type: .image, sourceName: "akutni-cisarsky-rez-4", text: "Většinou další péče o vás probíhá opět na porodním boxu nebo na intermediálním pokoji."),
            Story(type: .image, sourceName: "akutni-cisarsky-rez-5", text: "Ošetřující lékař pro Vás vybere nejvhodnější a nejbezpečnější variantu.")
        ])),
        .stories(StoriesModel(title: "Plánovaný císařský řez", bannerName: "planovany-cisarsky-rez-0", isHalf: true, stories: [
            Story(type: .image, sourceName: "planovany-cisarsky-rez-1", text: "Většinou jsou pacientky přijímány v den operace. Komplikovanější pacientky přijímáme den předem."),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-2", text: "Příjem posledního jídla je povolený maximálně 6 hodin před operací, příjem neslazených tekutin max. 2 hodiny před operací."),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-3", text: "Před operací zavedeme do žíly kanylu k aplikaci léků a infuzí. Na operačním sále vám bude zaveden na nezbytně dlouhou dobu močová cévka."),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-4", text: "Dle situace probíhá péče o maminku na porodním sále nebo intermediálním pokoji."),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-5", text: "Při nekomplikovaném průběhu operace vedené ve svodné – spinální anestezii je možná přítomnost otce přímo na operačním sále."),
            Story(type: .image, sourceName: "planovany-cisarsky-rez-6", text: "Dovoluje-li to váš stav a stav vašeho dítěte následuje téměř okamžitý bonding ještě v průběhu operace.")
        ])),
    ]
    
    
    // MARK: - I. doba
    static let iDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co se děje v první fázi porodu?", content: """
                Začínají pravidelné děložní kontrakce.
                Ty mohou být zpočátku nepravidelné, postupně se zesilují a zkracuje se interval mezi nimi. 

                Může také spontánně odtéci plodová voda – ale nemusí.

                Porodní cesty se postupně otevírají.
                Děložní hrdlo se zkracuje a rozšiřuje – zhruba od 1 do 10 cm.

                Porodní tým průběžně sleduje polohu a sestup miminka porodními cestami.
                """)),
        .introText(IntroTextModel(title: "Když porod potřebuje pomoc", content: """
                Co když plodová voda sama neodteče?
                Lékař může provést tzv. dirupci – šetrné protržení plodových obalů, aby došlo k odtoku plodové vody.
                
                Co když kontrakce nejsou dostatečně silné?
                Může být podán Oxytocin – hormon, který podporuje účinné děložní stahy a pomáhá porodu postupovat.
                """)),
        .stories(StoriesModel(title: "Monitorování během porodu", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "monitorovani-behem-porodu-1", text: "Při porodu monitorujeme ženu i miminko pomocí kardiotokografie. Ta měří a graficky znázorňuje srdeční tep miminka a sílu a četnost děložních kontrakcí."),
            Story(type: .image, sourceName: "monitorovani-behem-porodu-2", text: "Průběh porodu je monitorován pravidelnými návštěvami porodní asistenky nebo lékaře."),
        ])),
        .introText(IntroTextModel(title: "Možnosti tlumení bolesti během porodu", content: "Pro tlumení bolesti u porodu nabízíme širokou škálu metod. Neváhejte se zeptat personálu, vybereme společně metodu tlumení dle vašich preferencí.")),
        .stories(StoriesModel(title: "Tlumení bolesti bez léků", bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-1", text: "Intenzitu porodních bolestí mohou pomoci tlumit změny poloh a pohyb."),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-2", text: "U nás k tomu můžete použít porodní lůžko, gymnastický míč, žíněnku, porodní závěs, polohovací pomůcky, porodní židličku apod."),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-3", text: "Vnímání bolesti může také pozitivně ovlivnit správná práce s dechem. S tím vám ráda pomůže porodní asistentka."),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-4", text: "K relaxaci a tlumení bolesti mohou přispět také masáže a zahřívání beder a podbřišku. V naší porodnici nabízíme masáž, sprchu, termofor s teplou vodou, baňkování a jiné."),
            Story(type: .image, sourceName: "tlumeni-bolesti-bez-leku-5", text: "Rebozo šátek pomáhá podpořit správnou polohu miminka před porodem, ulevuje od bolesti zad. Rádi vám s tím pomůžeme."),
        ])),
        .stories(StoriesModel(title: "Tlumení bolesti s použitím léků", bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-1", text: "Entonox (inhalační analgezie) – tzv. rajský plyn"),
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-2", text: "Analgetická injekce – aplikovaná do svalu"),
            Story(type: .image, sourceName: "tlumeni-bolesti-s-pouzitim-leku-3", text: "Epidurální analgezie (aplikace léků do epidurálního prostoru páteřního kanálu"),
            
        ])),
        .introText(IntroTextModel(title: "Možné komplikace", content: "Mezi závažné komplikace během porodu patří předčasné odlučování placenty, výhřez pupečníku a těžká preeklampsie. Tyto stavy mohou vážně ohrozit život matky i dítěte a často vyžadují okamžité ukončení porodu císařským řezem. Rychlý zásah lékařského týmu je v těchto situacích klíčový pro zajištění bezpečí obou", isCollapsable: true))
    ]
    
    // MARK: - II. doba
    static let iiDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co se děje ve druhé fázi porodu?", content: """
            Děložní čípek je zcela otevřený, miminko začíná sestupovat porodními cestami.
            Pocit silného tlaku na pánevní dno vyvolává nutkání tlačit.
            Mezi kontrakcemi odpočívejte a nabírejte sílu
            """)),
        .introText(IntroTextModel(title: "Když porod potřebuje pomoc", content: """
            Co když plodová voda sama neodteče?
            Lékař může provést tzv. dirupci – šetrné protržení plodových obalů, aby došlo k odtoku plodové vody.
            
            Co když kontrakce nejsou dostatečně silné?
            Může být podán Oxytocin – hormon, který podporuje účinné děložní stahy a pomáhá porodu postupovat.
            """)),
        .stories(StoriesModel(title: "Poloha při tlačení", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "poloha-pri-tlaceni-1", text: "Pokud vše probíhá fyziologicky, bude záležet na vás jakou polohu zvolíte."),
            Story(type: .image, sourceName: "poloha-pri-tlaceni-2", text: "Nejčastější polohy: polosed na porodním lůžku, poloha na boku, ve stoje, na čtyřech, v dřepu apod."),
        ])),
        .stories(StoriesModel(title: "Chránění hráze během porodu", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-1", text: "Ve většině porodních poloh je možno aktivně chránit hráz porodní asistentkou/porodníkem během tlačení."),
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-2", text: "Pokud hrozí ruptura hráze, může být provedeno nástřižení hráze (episiotomie)."),
            Story(type: .image, sourceName: "chraneni-hraze-behem-porodu-3", text: "Episiotomie se provádí pouze v případě nutnosti – například při nedostatku kyslíku u plodu")
        ])),
        .stories(StoriesModel(title: "Po porodu", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "po-porodu-1", text: "Pokud je vše v pořádku, může proběhnout okamžitý bonding, jen minimálně rušený ze strany zdravotníků"),
            Story(type: .image, sourceName: "po-porodu-2", text: "Novorozenecká sestřička miminko u maminky lehce osuší a nasadí mu čepičku"),
            Story(type: .image, sourceName: "po-porodu-3", text: "Na hlavičku dostane čepičku, na končetinu se připevní malé čidlo ke snímaní množství kyslíku v krvi a srdeční akce."),
            Story(type: .image, sourceName: "po-porodu-4", text: "Péči o miminko zajišťuje novorozenecká sestřička, event. společně s pediatrem")
        ])),
        .introText(IntroTextModel(title: "Možné komplikace", content: """
            Během této fáze může dojít k ohrožení plodu nedostatkem kyslíku (hypoxií) nebo nepostupujícím porodem, což vede k vyčerpání maminky.
            Cílem těchto metod je zabránit zhoršení nedostatku kyslíku u plodu a předejít možným komplikacím.
            V případě komplikací je nutné urychlené ukončení porodu pomocí vakuumextrakce nebo porodnických kleští. 
            """)),
        .stories(StoriesModel(title: "Vakuumextrakce", bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "vakuumextrakce-1", text: "Plastový zvon přisátý pod tlakem na hlavičku miminka pomůže s jeho vypuzením."),
        ])),
        .stories(StoriesModel(title: "Porodnické kleště", bannerName: "placeholder", isHalf: true, stories: [
            Story(type: .image, sourceName: "porodnicke-kleste-1", text: "Používají se zcela vyjímečně.")
        ]))
    ]
    
    // MARK: - III. doba
    static let iiiDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co se děje ve třetí fázi porodu?", content: "Tato fáze začíná porodem miminka a končí porodem placenty.")),
        .stories(StoriesModel(title: "Jak probíhá", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-1", text: "Pokud s tím maminka souhlasí, volíme metodu aktivního vedení porodu placenty pomocí léků."),
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-2", text: "Podáme léky (např. Methergin, Oxytocin) do žíly maminky. Tyto léky urychluje odloučení placenty a minimalizují riziko krvácení."),
            Story(type: .image, sourceName: "iii-doba-porodni-jak-probiha-3", text: "Po porodu placenty porodní asistentka/lékař zkontroluje porodní cesty a ošetří případná poranění.")
        ])),
        .introText(IntroTextModel(title: "Možné komplikace", content: "Silné poporodní krvácení, způsobené: porodním poraněním, zadržením části nebo celé placenty v děloze nebo nedostatečným stažením dělohy po porodu")),
        .introText(IntroTextModel(title: "Možnosti řešení", content: """
            Ošetření porodního poranění – V případě většího poranění je nutné ošetření v celkové anestezii.
            Odstranění zadržené placenty – Lékař provede vyčištění dutiny děložní v celkové anestezii.
            Život ohrožující krvácení – Ve velmi vzácných případech, kdy není možné krvácení zastavit, je nutné operační odstranění dělohy.
            """))
    ]
    
    // MARK: - IV. doba
    static let ivDobaPorodni: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co se děje ve čtvrté fázi porodu?", content: "Toto období trvá 2 hodiny po porodu placenty.")),
        .stories(StoriesModel(title: "Jak probíhá", bannerName: "placeholder", stories: [
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-1", text: "Odpočíváte a regenerujete v porodním pokoji."),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-2", text: "Porodní asistentka monitoruje váš stav – kontroluje krevní tlak, zavinování dělohy a intenzitu krvácení."),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-3", text: "Pokud je vše v pořádku, zůstáváte s miminkem a doprovodem (partnerem, blízkou osobou)."),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-4", text: "Během tohoto období byste neměla nic jíst, příjem tekutin je omezen na minimum"),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-5", text: "Po uplynutí této doby se můžete najíst a personál porodního sálu vás doprovodí do sprchy"),
            Story(type: .image, sourceName: "iv-doba-porodni-jak-probiha-6", text: "Po skončení této fáze jste převezena na oddělení šestinedělí, kde budete společně s miminkem.")
        ])),
        .introText(IntroTextModel(title: "Možné komplikace", content: "Silné poporodní krvácení, způsobené: porodním poraněním nebo nedostatečným stažením dělohy po porodu")),
        .introText(IntroTextModel(title: "Možnosti řešení", content: """
            Ošetření porodního poranění – V případě většího poranění je nutné ošetření v celkové anestezii.
            Život ohrožující krvácení – Ve velmi vzácných případech, kdy není možné krvácení zastavit, je nutné operační odstranění dělohy.
            """))
    ]
    
}
