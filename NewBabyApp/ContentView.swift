//
//  ContentView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct ContentView: View {

    @State private var path = NavigationPath()
    @State private var scrollPosition: CGFloat = 300.0
    
    let bonding: [any MenuItemModel] = [
        DetailModel(title: "Bonding", bannerName: "banner-bonding")
        ]
    
    let testovaci: [any MenuItemModel] = [
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

    let prvniDen: [any MenuItemModel] = [
        DetailModel(title: "Ošetření po narození"),
        DetailModel(title: "Kanavit"),
        DetailModel(title: "Kojení")
    ]

    let manipulaceSDitetem: [any MenuItemModel] = [
        StoriesModel(title: "Manipulace s dítětem", bannerName: "banner-manipulacesditetem", stories: [
            Story(type: .video, sourceName: "tygrik01", text: "Miminko otočíme do polohy na boku, ručičky a nožičky míří před něj."),
            Story(type: .video, sourceName: "tygrik02", text: "Uchopením na přední a zadní straně hrudníku dotočíme na bříško."),
            Story(type: .video, sourceName: "tygrik03", text: "Jedna ruka-miska zepředu pod hrudníčkem, druhá ruka v oblasti pánve, palec mezi nožky a zvedneme miminko tak, že jej opřeme zadečkem o sebe."),
            Story(type: .video, sourceName: "tygrik04", text: "Ruka pod hrudníčkem podpírá miminko dál. Naše druhá ruka jako pás auta vede od ramene dítěte až k pánvi."),
            Story(type: .video, sourceName: "tygrik05", text: "Přechod z chování v poloze na druhou stranu."),
            Story(type: .video, sourceName: "tygrik06", text: "V poloze je hlavička podepřená, ručičky a nožičky míří před tělo."),
        ]),
    ]
    
    let druhyDen: [any MenuItemModel] = [
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
    
    let tretiDen: [any MenuItemModel] = [
        DetailModel(title: "Měření žloutenky"),
        DetailModel(title: "Fototerapie"),
        DetailModel(title: "Propuštění z porodnice")
    ]

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    Section {
                        ForEach(bonding.indices, id: \.self) { index in
                            MenuItem(item: bonding[index])
                        }
                    } header: {
                        VStack (alignment: .leading, content: {
                            Text("1. den v porodnici")
                                .font(.title)
                                .textCase(.lowercase)
                                .foregroundColor(.black)
                                .background(
                                    GeometryReader(content: { geometry in
                                            Color.clear
                                                .onChange(
                                                    of: geometry.frame(in: .global).minY
                                                ) { oldValue, newValue in
                                                    scrollPosition = newValue
                                                }
                                    })
                                )
                        })
                        .padding(.top, 300)
                    }
                    
                    Section {
                        ForEach(prvniDen.indices, id: \.self) { index in
                            MenuItem(item: prvniDen[index])
                        }
                    }
                    
                    Section {
                        ForEach(manipulaceSDitetem.indices, id: \.self) { index in
                            MenuItem(item: manipulaceSDitetem[index])
                        }
                    } header: {
                        Text("2. den v porodnici")
                            .font(.title)
                            .textCase(.lowercase)
                            .foregroundColor(.black)
                    }
                    
                    Section {
                        ForEach(druhyDen.indices, id: \.self) { index in
                            MenuItem(item: druhyDen[index])
                        }
                    }
                    
                    Section {
                        ForEach(tretiDen.indices, id: \.self) { index in
                            MenuItem(item: tretiDen[index])
                        }
                    } header: {
                        Text("3. den v porodnici")
                            .font(.title)
                            .textCase(.lowercase)
                            .foregroundColor(.black)
                    }
                }
                .listSectionSpacing(15)
                .navigationDestination(for: DetailModel.self) { detail in
                    DetailView(detail: detail, path: $path)
                }
                .navigationDestination(for: StoriesModel.self, destination: { stories in
                    StoriesView(storiesGroup: stories)
                        .transition(.move(edge: .bottom))
                })
                .allowsHitTesting(true)

                .scrollContentBackground(.hidden)
                .background(
                    ZStack {
                        Color("background")
                        VStack {
                            //  Text("\(scrollPosition)")
                            Image("title-baby")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture(perform: {
                                    path.append(
                                        DetailModel(title: "nic tady není"))
                                })
                                .overlay(content: {
                                    LinearGradient(colors: [Color("background").opacity(0.0), Color("background").opacity(0.0), Color("background")], startPoint: .center, endPoint: .bottom)
                                })
                                //        .opacity((scrollPosition-200.0) * 0.01)
                                .blur(radius: (300 - scrollPosition) * 0.1)

                            Spacer()
                            
                        }

                    }
                    .ignoresSafeArea()
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
