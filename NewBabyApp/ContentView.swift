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

    let predPorodem: [any MenuItemModel] = [
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        
        StoriesModel(title: "Manipulace s novorozencem", stories: [
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
        /*
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
        DetailModel(title: "Screeningy"),
        DetailModel(title: "Proč rodit ve FNOL"),
         */
    ]

    let vPorodnici: [DetailModel] = [
        DetailModel(title: "Porod", bannerName: "banner-porod")
    ]

    var body: some View {
        VStack {
            NavigationStack(path: $path) {
                List {
                    Section {
                        ForEach(predPorodem.indices, id: \.self) { index in
                            MenuItem(item: predPorodem[index])
                        }
                    } header: {
                        VStack (alignment: .leading, content: {
                            Text("před porodem")
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
                        ForEach(vPorodnici.indices, id: \.self) { index in
                            MenuItem(item: vPorodnici[index])
                        }
                    } header: {
                        Text("v porodnici")
                            .font(.title)
                            .textCase(.lowercase)
                            .foregroundColor(.black)
                    }
                }
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
                            Image("title-pregnant")
                                .resizable()
                                .scaledToFit()
                                .onTapGesture(perform: {
                                    path.append(
                                        DetailModel(title: "nic tady není"))
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
