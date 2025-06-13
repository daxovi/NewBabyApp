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
            .menu(MenuModel(title: "Po porodu - krok za krokem", bannerName: "prvni-den", menuItems: prvniden)),
            .menu(MenuModel(title: "Zdraví pod kontrolou", bannerName: "zdravi-pod-kontrolou", menuItems: zdraviPodKontrolou)),
            .menu(MenuModel(title: "Porod", bannerName: "porod", menuItems: porod))
//            .menu(MenuModel(title: "Bezpečná maipulace", bannerName: "bezpecna-manipulace", menuItems: manipulace)),
//            .detail(DetailModel(title: "Kojení a výživa", bannerName: "kojeni-a-vyziva")),
//            .detail(DetailModel(title: "Chystáme se domů", bannerName: "chystame-se-domu"))
        ]
    )
    
    private static let zdraviPodKontrolou: [NavigationDestination] = [
        .menu(MenuModel(title: "Novorozenecký laboratorní screening", bannerName: "novorozenecky-laboratorni-screening-0", menuItems: [
            .introText(IntroTextModel(title: "Co je novorozenecký screening?", content: "Novorozenecký screening je laboratorní test, který se provádí u všech novorozenců narozených v ČR. Pomáhá včas odhalit vážná dědičná onemocnění, která by mohla ohrozit zdraví dítěte.")),
            .introText(IntroTextModel(title: "Kdy se screening provádí?", content: "Odběr probíhá mezi 48. a 72. hodinou po porodu. Tato doba je klíčová pro včasnou diagnostiku možných onemocnění.")),
            .stories(StoriesModel(title: "Jak se odběr provádí?", bannerName: "nls-jak-se-odber-provadi-0", stories: [
                Story(type: .video, sourceName: "novorozenecky-screening-1", text: "Screening se provádí odebráním několika kapek krve z patičky novorozence."),
                Story(type: .video, sourceName: "novorozenecky-screening-2", text: "Krev se nanese na speciální papírovou kartičku (tzv. novorozeneckou screeningovou kartičku) a odešle se do laboratoře k analýze.")])),
            .introText(IntroTextModel(title: "Jak se výsledky vyhodnocují?", content: """
                                      Negativní výsledek – Vše je v pořádku, laboratoř nekontaktuje rodiče ani lékaře
                                      Pozitivní výsledek – Laboratoř kontaktuje rodiče nebo lékaře dítěte a doporučí další vyšetření na specializovaném pracovišti. Včasná léčba může zabránit rozvoji komplikací a zajistit dítěti co nejlepší kvalitu života.
                                      Nejasný výsledek (Recall) – Screening se musí zopakovat, aby byl výsledek jednoznačný.
                                      """, isCollapsable: true)),
            .introText(IntroTextModel(title: "Může být moje dítě nemocné?", content: "Pravděpodobnost je velmi nízká – pouze 1 z 1150 dětí má některé z těchto onemocnění. Pokud ale screening odhalí problém, může to dítěti zachránit zdraví nebo dokonce život.")),
            .introText(IntroTextModel(title: "Jaké nemoci lze screeningem odhalit?", content: """
                Mezi onemocnění, která lze screeningem vyšetřit patří:
                vrozené poruchy štítné žlázy (hypotyreóza)
                poruchy hormonů nadledvin (adrenální hyperplazie)
                cystická fibróza
                dědičné metabolické poruchy
                spinální svalová atrofie (SMA)
                těžké poruchy imunity (SCID)
                """, isCollapsable: true))
        ])),
        .menu(MenuModel(title: "Novorozenecká žloutenka", menuItems: [
            .introText(IntroTextModel(title: "Co je novorozenecká žloutenka?", content: "Novorozenecká žloutenka je stav, kdy dochází ke žlutému zbarvení kůže, sliznic a očního bělma. Způsobuje ji zvýšená hladina bilirubinu, který vzniká při rozpadu červených krvinek. Červené krvinky se po narození začínají rozpadat, aby jejich místo nahradily nové. Tyto nové krvinky již obsahují červené barvivo přizpůsobené na pobyt mimo dělohu. Játra bilirubin zpracují a následně ho tělo vyloučí močí a stolicí.")),
            .stories(StoriesModel(title: "Jaké jsou příznaky žloutenky?", bannerName: "jake-jsou-priznaky-zloutenky-0", stories: [
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-1", text: "Žluté zbarvení kůže, sliznic a očního bělma."),
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-2", text: "Zvýšená spavost."),
                Story(type: .image, sourceName: "jake-jsou-priznaky-zloutenky-3", text: "Obtíže s krmením (např. líné sání, delší intervaly mezi krmením). Pokud jsou hodnoty žloutenky extrémně vysoké, může být přítomná podrážděnost a vyšší tón pláče."),
                ])),
            .introText(IntroTextModel(title: "Kdy se žloutenka objevuje?", content: """
                U donošených miminek vrcholí hladina bilirubinu mezi 3. a 5. dnem života a obvykle klesá do dvou týdnů.
                U nedonošených dětí bývá nejvyšší hladina bilirubinu mezi 5. a 7. dnem života.
                """)),

            .stories(StoriesModel(title: "Jak se žloutenka vyšetřuje?", stories: [
                Story(type: .image, sourceName: "jak-se-zloutenka-vysetruje-1", text: "Vyšetření se provádí pomocí přístroje, který měří hladinu bilirubinu přes kůži. Toto měření je bezbolestné a bezpečné."),
                Story(type: .image, sourceName: "jak-se-zloutenka-vysetruje-2", text: "Pokud jsou hodnoty vysoké, následuje odběr krve ze žíly pro přesnější hodnotu bilirubinu.")])),
            //Jak se žloutenka léčí?
            .stories(StoriesModel(title: "Jak se žloutenka léčí?", stories: [
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-1", text: "Fototerapie modrým světlem pomáhá přeměnit bilirubin na látky, které se snadno vyloučí žlučí a močí."),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-2", text: "Miminko stráví zhruba 3 hodiny pod modrým světlem (délka se přizpůsobuje kojení)."),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-3", text: "Následná 1 hodina je pro kojení a kontakt s rodiči."),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-4", text: "Během terapie je nutné chránit oči miminka, aby nedošlo k poškození sítnice."),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-5", text: "Ve většině případů léčba trvá do dalšího dne, kdy se opět kontroluje hladina bilirubinu z krve. Fototerapie je ukončena, jakmile bilirubin klesne na bezpečnou úroveň."),
                Story(type: .image, sourceName: "jak-se-zloutenka-leci-6", text: "Lékař může tento režim upravit na základě aktuálních hodnot žloutenky a případně i s ohledem na přítomnost dalších rizikových faktorů, které by její průběh mohly zhoršit.")])),
        ])),
        .menu(MenuModel(title: "Screening vrozených srdečních vad", menuItems: [
            .introText(IntroTextModel(title: "Proč se provádí screening?", content: "Kritické srdeční vady se vyskytují přibližně u 2 novorozenců z 1000 živě narozených dětí.  Pulzní oxymetrie pomáhá včas odhalit tyto vady tím, že měří okysličení krve v kombinaci s prokrvením končetiny.")),
            .stories(StoriesModel(title: "Jak probíhá měření?", bannerName: "srdecni-vady-jak-probiha-mereni-0", stories: [
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-1", text: "Saturace kyslíkem se měří pomocí speciálního čidla na pravé ručičce a na jakékoliv dolní končetině."),
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-2", text: "Vyšetření se doporučuje provést nejdříve po 6 hodinách života miminka."),
                Story(type: .image, sourceName: "srdecni-jak-probiha-mereni-3", text: "Následná 1 hodina je pro kojení a kontakt s rodiči.")])),
            .introText(IntroTextModel(title: "Kdy se dozvím výsledek?", content: "Výsledek screeningu vám oznámí zdravotnický personál ihned po jeho provedení.")),
            .introText(IntroTextModel(title: "Jaké mohou být výsledky?", content: """
                Negativní screening – Srdeční vada je málo pravděpodobná. 
                Pozitivní screening – Miminko podstoupí ultrazvukové vyšetření srdce (echokardiografii).
                Falešně pozitivní screening – Srdeční vada není přítomná, ale naměřené hodnoty nejsou  v normě. Miminko bude podrobeno dalšímu vyšetření, aby se zjistila příčina odchylky.
                """, isCollapsable: true))
            ])),
        .menu(MenuModel(title: "Vyšetření sluchu", menuItems: [
            .introText(IntroTextModel(title: "Proč se provádí vyšetření sluchu?", content: "Cílem vyšetření sluchu je včasné odhalení vrozené sluchové vady. Díky tomu je možné zahájit rehabilitaci sluchu a zajistit správný rozvoj komunikačních schopností a řeči dítěte.")),
            .stories(StoriesModel(title: "Jak probíhá vyšetření sluchu?", bannerName: "placeholder", stories: [
                Story(type: .video, sourceName: "vysetreni-sluchu-1", text: "Vyšetření je bezbolestné a neinvazivní. Dítě při něm může klidně spát."),
                Story(type: .video, sourceName: "vysetreni-sluchu-2", text: "Zdravotnický personál zavede do zevního zvukovodu jemnou sondu, která vyšle slabý zvukový podnět."),
                Story(type: .video, sourceName: "vysetreni-sluchu-3", text: "Přístroj zaznamená odpovědi sluchového aparátu a vyhodnotí, zda sluch funguje správně.")
                ])),
            .stories(StoriesModel(title: "Kdy se vyšetření provádí?", bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-sluchu-4", text: "TEOAE (tranzientně evokované otoakustické emise)"),
                Story(type: .image, sourceName: "vysetreni-sluchu-5", text: "TEOAE se používá u fyziologických novorozenců. Měří odpověď vláskových buněk v uchu na zvukové podněty."),
                Story(type: .image, sourceName: "vysetreni-sluchu-6", text: "AABR (automatic auditory brainstem responses)"),
                Story(type: .image, sourceName: "vysetreni-sluchu-7", text: "AABR se používá u novorozenců s rizikem poruchy sluchu.Funguje na principu měření mozkových odpovědí na zvukové podněty pomocí elektrod.instem responses)"),
                ])),
            .introText(IntroTextModel(title: "Kdy se dozvím výsledek?", content: "Výsledek se dozvíte ihned po vyšetření. Pokud bude nutné vyšetření opakovat, lékař (nebo zdravotní sestřička) vám sdělí další postup.")),
            .introText(IntroTextModel(title: "Jaké mohou být výsledky?", content: """
                • Negativní screening – Sluch dítěte je s největší pravděpodobností v pořádku.
                • Pozitivní screening – Vyšetření je nutné opakovat pro potvrzení výsledku.
                """, isCollapsable: true)),
            .introText(IntroTextModel(title: "Co když se screening nepovede?", content: "Pokud se nepodaří získat příznivý výsledek, vyšetření provádíme opakovaně. Teprve po několika testech lze vyslovit podezření na poruchu sluchu a dítě je odesláno na specializované vyšetření.", isCollapsable: true)),
            .introText(IntroTextModel(title: "Proč je screening sluchu důležitý?", content: "Včasná diagnostika zabrání opoždění vývoje řeči nebo dokonce hluchoněmosti. Pokud se sluchová vada neodhalí včas, může mít dítě trvalé potíže s komunikací.")),
            .introText(IntroTextModel(title: "Může mít moje dítě poruchu sluchu?", content: "Závažná oboustranná ztráta sluchu je spíše vzácnější. Objevuje se u 1–3 dětí z 1000 narozených.", isCollapsable: true))
        ])),
        .menu(MenuModel(title: "Screening na vrozený šedý zákal", menuItems: [
            .introText(IntroTextModel(title: " Co je vrozený šedý zákal?", content: "Vrozený šedý zákal (kongenitální katarakta) je onemocnění, které narušuje průhlednost oční čočky v kritickém období vývoje zraku. Pokud  se včas nezahájí léčba, může vést k trvalému zrakovému postižení.")),
            .stories(StoriesModel(title: "Jak probíhá vyšetření?", bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-1", text: "Vyšetření se provádí pomocí oftalmoskopu."),
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-2", text: "Lékař nebo zdravotní sestra prosvítí oko novorozence a sleduje tzv. červený reflex."),
                Story(type: .image, sourceName: "vysetreni-sedy-zakal-3", text: "Pokud se reflex objeví, znamená to, že je čočka čirá a vyšetření je negativní (v pořádku).")])),
            .introText(IntroTextModel(title: "Proč je screening důležitý?", content: "Včasné odhalení šedého zákalu je klíčové pro správný vývoj zraku. Pokud se problém neřeší včas, může dítě trpět trvalým poškozením zraku nebo dokonce slepotou.")),
            .introText(IntroTextModel(title: "Kdy se screening provádí?", content: "Vyšetření probíhá v prvních dnech po narození, nejpozději však do 4. týdne života.", isCollapsable: true)),
            .introText(IntroTextModel(title: "Kdy se dozvím výsledek vyšetření?", content: "Výsledek se dozvíte ihned po vyšetření. Pokud bude nutné další vyšetření, lékař vám sdělí přesný postup.", isCollapsable: true)),
            .introText(IntroTextModel(title: "Co znamená pozitivní výsledek testu?", content: "Pokud červený reflex není patrný nebo je oslabený, může to znamenat přítomnost šedého zákalu.V takovém případě dítě podstoupí další specializovaná vyšetření.", isCollapsable: true)),
            .introText(IntroTextModel(title: "Jak často se vrozený šedý zákal vyskytuje?", content: "Toto onemocnění je spíše vzácnější. Vyskytuje se u 2–4 novorozenců z 10 000 narozených dětí. Může postihnout jedno oko nebo obě oči.", isCollapsable: true)),
        ])),
        .menu(MenuModel(title: "Screening vrozené syfilis", menuItems: [
            .introText(IntroTextModel(title: "Jak probíhá vyšetření?", content: "Test na protilátky proti syfilis se provádí z pupečníkové krve, která je odebrána ihned po porodu z pupečníku.")),
            .introText(IntroTextModel(title: "Jaké mohou být výsledky?", content: """
                Negativní screening – Protilátky proti syfilis nebyly potvrzeny, laboratoř nikoho nekontaktuje.
                Reaktivní screening – Pokud jsou protilátky přítomny, vzorek se odesílá k dalšímu testování do Národní referenční laboratoře v Praze.
                """)),
            .introText(IntroTextModel(title: "Kdy se dozvím výsledek?", content: "Výsledek vyšetření vám oznámí zdravotnický personál pouze v případě pozitivního nálezu."))
            ])),
        .menu(MenuModel(title: "Vyšetření ledvin", menuItems: [
            .stories(StoriesModel(title: "Jak probíhá vyšetření?", bannerName: "placeholder", stories: [
                Story(type: .image, sourceName: "vysetreni-ledvin-1", text: "Závažné vrozené vady ledvin a močových cest se vyskytují u 2 novorozenců z 1000 živě narozených."),
                Story(type: .image, sourceName: "vysetreni-ledvin-2", text: "Ultrazvukové vyšetření pomáhá odhalit případné abnormality a umožňuje včasnou léčbu."),
                Story(type: .image, sourceName: "vysetreni-ledvin-3", text: "Pomocí ultrazvuku se hodnotí velikost, tvar a umístění ledvin, močovodů a močového měchýře."),
                Story(type: .image, sourceName: "vysetreni-ledvin-4", text: "Nejlepší čas pro vyšetření je těsně před propuštěním, obvykle v den závěrečné prohlídky novorozence."),
                Story(type: .image, sourceName: "vysetreni-ledvin-5" , text: "V případě, že je výsledek pozitivní, provádí se s odstupem času kontrolní ultrazvuk."),
                Story(type: .image, sourceName: "vysetreni-ledvin-6", text: "V případě vážnějšího nálezu je třeba provést další vyšetření během hospitalizace a nález konzultovat s urologem a nefrologem."),
            ])),
            .introText(IntroTextModel(title: "Je toto vyšetření povinné?", content: "Vyšetření ledvin a močových cest pomocí ultrazvuku není v ČR povinný a neprovádí se na všech odděleních. U nás ho provádíme standardně, protože přispívá k včasné diagnostice a péči o zdraví novorozenců."))
            ])),
        .menu(MenuModel(title: "Vyšetření dětským ortopedem", menuItems: [
            .introText(IntroTextModel(title: "Vyšetření kyčlí a dolních končetin", content: "Vyšetření kyčlí a dolních končetin se provádí klinicky a pomocí ultrazvuku. Cílem je včasné odhalení vývojové dysplazie kyčelního kloubu případně jiných odchylek v oblasti dolních končetin. Při vyšetření kyčlí se zjišťuje zda je hlavice stehenní kosti správně zakloubená v kyčelní jamce.")),
            .stories(StoriesModel(title: "Jak probíhá vyšetření?", bannerName: "placeholder", stories: [
                Story(type: .video, sourceName: "vysetreni-detsky-ortoped-1", text: "Vyšetření začíná pomocí ultrazvuku."),
                Story(type: .video, sourceName: "vysetreni-detsky-ortoped-2", text: "Následuje klinické vyšetření. Nedílnou součástí je vyšetření nožiček."),
                ])),
            .introText(IntroTextModel(title: "Proč je vyšetření důležité", content: "Včasná diagnostika umožňuje rychlou a efektivní léčbu, která zabrání budoucím problémům s chůzí nebo vývojem kyčlí. Screening probíhá v ortopedických ambulancích ve vaší spádové oblasti. Pediatr vám poradí, kam se objednat.")),
            .introText(IntroTextModel(title: "Kdy vyšetření probíhá?", content: "Každé miminko podstupuje tři ultrazvuková vyšetření. První vyšetření – do 3 týdnů od narození. Druhé vyšetření – mezi 6. až 8. týdnem a třetí vyšetření – kolem 3. měsíce věku.")),
            .introText(IntroTextModel(title: "Když není všechno jak má být", content: "Pokud je zjištěna dysplazie kyčlí nebo vykloubení, doporučuje se široké balení pomocí abdukčních kalhotek, které lze zakoupit v lékárně. Poté následuje pravidelná kontrola na ortopedické klinice a pokud problém přetrvává, nasazuje se speciální léčebná pomůcka.", isCollapsable: true)),
            .stories(StoriesModel(title: "Široké balení", bannerName: "placeholder", stories: []))
    ])),
    ] // Hotovo
    
    private static let prvniden: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co vás čeká?", content: "Všechny děti i maminky mají svůj vlastní rytmus. Pokud se vaše první dny budou odlišovat, je to naprosto v pořádku. Důležité je, že na to nejste sami.")),
        .menu(MenuModel(title: "Bonding", bannerName: "bonding", menuItems: bonding)),
        .stories(StoriesModel(title: "Jak vypadá miminko po porodu", stories: [
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-1", text: "Mázek chrání kůži miminka v děloze a má důležitou roli i po porodu."),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-2", text: "Když se vaše miminko narodí, jeho kůže může mít namodralý nádech. To je zcela normální a během prvních minut po porodu se barva kůže postupně změní na růžovou."),
            Story(type: .image, sourceName: "jak-vypada-miminko-po-porodu-3", text: "Plodová voda a mázek pomáhají novorozenci rozpoznat vůně a chutě, které zná z dělohy. Díky tomu se cítí bezpečně v novém prostředí."),
        ])),
        // TODO: dodělat obrázky - názvy souborů jsou prázdné
        .stories(StoriesModel(title: "Měření tělesné teploty", stories: [
            Story(type: .video, sourceName: "mereni-teploty-1", text: "Pro nejpřesnější výsledek se teplota miminka měří v konečníku."),
            Story(type: .video, sourceName: "mereni-teploty-2", text: "Pokud je teplota příliš nízká, můžeme miminko uložit na vyhřívanou podložku."),
            Story(type: .video, sourceName: "mereni-teploty-3", text: "Ve zcela výjímečných případech je nutné dát miminko do inkubátoru nebo na vyhřívané lůžko."),
        ])),
        .stories(StoriesModel(title: "Označení novorozence", stories: [
            Story(type: .image, sourceName: "oznaceni-novorozence-1", text: "Po porodu dostane miminko na zápěstí papírový náramek s identifikačními údaji."),
            Story(type: .image, sourceName: "oznaceni-novorozence-2", text: "Při prvním ošetření po dvou hodinách je navíc označeno barvou na hrudníček a nožičku pro ještě větší bezpečnost.")
        ])),
        .stories(StoriesModel(title: "Močení a odchod stoličky", stories: [
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-1", text: "Většina miminek se během prvního dne po narození alespoň jednou vymočí."),
            Story(type: .image, sourceName: "moceni-a-odchod-stolicky-2", text: "První stolička - smolka -  by měla odejít do 48 hodin po porodu. Má černou, mazlavou konzistenci."),
        ])),
        .stories(StoriesModel(title: "Váha a délka miminka", stories: [
            Story(type: .image, sourceName: "vaha-a-delka-miminka-1", text: "Miminko vážíme až po ukončení bondingu, tedy přibližně 2 hodiny po narození."),
            Story(type: .image, sourceName: "vaha-a-delka-miminka-2", text: "V den porodu se délka určuje pouze odhadem na základě tělesné hmotnosti. Tento přístup minimalizuje zbytečnou manipulaci a zajišťuje miminku pohodlí."),
        ])),
        .stories(StoriesModel(title: "Vitamin K", stories: [
            Story(type: .image, sourceName: "vitamin-k-1", text: "Při prvním ošetření po bondingu dostává miminko 2 kapky vitamínu K (Kanavit) přímo do pusinky. Tímto se předchází krvácivé nemoci novorozence."),
        ])),
        .stories(StoriesModel(title: "Vyšetření krevní skupiny novorozence", stories: [
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-1", text: "Krevní skupinu novorozence vyšetřujeme pouze v případě, že maminka má krevní skupinu 0 nebo Rh faktor negativní (-)."),
            Story(type: .image, sourceName: "vysetreni-krevni-skupiny-2", text: "Vzorek se odebírá z pupečníkové krve, takže není potřeba odběr krve miminka.")
        ]))
    ] // Hotovo
    
    private static let bonding: [NavigationDestination] = [
        .introText(IntroTextModel(title: "Co je bonding?", content: "Bonding, neboli kontakt kůže na kůži (skin-to-skin), je proces vytváření láskyplné vazby mezi rodičem a dítětem. Bezprostředně po porodu se miminko položí přímo na nahou hruď maminky, kde cítí její teplo, tlukot srdce a vůni.")),
        .stories(StoriesModel(title: "Jak bonding probíhá?", bannerName: "jak_bonding_probiha", stories: [
            Story(type: .image, sourceName: "jak-bonding-probiha-1", text: "Po porodu je novorozenec položen na nahou hruď maminky."),
            Story(type: .image, sourceName: "jak-bonding-probiha-2", text: "Přikryje se vyhřátým ručníkem pro udržení tepla."),
            Story(type: .image, sourceName: "jak-bonding-probiha-3", text: "Kontakt kůže na kůži by měl trvat minimálně 2 hodiny."),
            Story(type: .image, sourceName: "jak-bonding-probiha-4", text: "Během bondingu se většinou miminko poprvé přisává k prsu."),
            Story(type: .image, sourceName: "jak-bonding-probiha-5", text: "Pomáhá miminku zklidnit se a adaptovat na novou situaci."),
            Story(type: .image, sourceName: "jak-bonding-probiha-6", text: "Miminko je během bondingu monitorováno pomocí čidla, které snímá okysličení krve a srdeční tep."),
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
    ] // Hotovo
}
