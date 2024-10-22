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
            Story(type: .video, sourceName: "otaceni01", text: "Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu."),
            Story(type: .video, sourceName: "otaceni02", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .video, sourceName: "otaceni03", text: "Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky."),
            Story(type: .video, sourceName: "otaceni04", text: "Jenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají."),
            Story(type: .video, sourceName: "otaceni05", text: "Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě."),
            Story(type: .video, sourceName: "otaceni06", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .video, sourceName: "otaceni07", text: "Zkrátka široko daleko nikde nic, jen zelenkavá tráva.")
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
            Story(type: .video, sourceName: "otaceni01", text: "Vítr skoro nefouká a tak by se na první pohled mohlo zdát, že se balónky snad vůbec nepohybují. Jenom tak klidně levitují ve vzduchu."),
            Story(type: .video, sourceName: "otaceni02", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .video, sourceName: "otaceni03", text: "Zkrátka široko daleko nikde nic, jen zelenkavá tráva, jasně modrá obloha a tři křiklavě barevné pouťové balónky."),
            Story(type: .video, sourceName: "otaceni04", text: "Jenže kvůli všudy přítomné trávě jsou stíny balónků sotva vidět, natož aby šlo rozeznat, jakou barvu tyto stíny mají."),
            Story(type: .video, sourceName: "otaceni05", text: "Nejeden filozof by mohl tvrdit, že balónky se sluncem závodí, ale fyzikové by to jistě vyvrátili. Z fyzikálního pohledu totiž balónky působí zcela nezajímavě."),
            Story(type: .video, sourceName: "otaceni06", text: "Jelikož slunce jasně září a na obloze byste od východu k západu hledali mráček marně."),
            Story(type: .video, sourceName: "otaceni07", text: "Zkrátka široko daleko nikde nic, jen zelenkavá tráva.")
        ]),
    ]
    
    let druhyDen: [any MenuItemModel] = [
        DetailModel(title: "Přebalování"),
        DetailModel(title: "Měření teploty"),
        DetailModel(title: "Kontrola smolky a močení"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Koupání")
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
