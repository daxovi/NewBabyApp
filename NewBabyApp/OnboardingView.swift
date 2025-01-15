//
//  OnboardingView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 13.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var selected: Int
    @Environment(\.dismiss) var dismiss
    @State var progress: OnBoardingProgress = .first
    @Binding var clientName: String
        
    var isSmallDevice: Bool { UIScreen.main.bounds.width <= 375 }
    
    var body: some View {
        VStack(alignment: .leading){
                        Image(isSmallDevice ? "logo-fnol" : "logo-fnol-vertical")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                            .padding()
                            .padding(.leading, 11)
                        Text("vítejte v porodnici \nFN Olomouc")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(Color("FNOLBlue"))
                            .padding(.horizontal)
                            .padding()
            Spacer()

            switch progress {
            case .first:
                AboutView(completed: progressToNext)
                    .frame(width: UIScreen.main.bounds.width)

            case .second:
                SayYourNameView(completed: progressToNext, name: $clientName)
                    .frame(width: UIScreen.main.bounds.width)

            case .third:
                HubMenu(action: navigateTo)
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
        .padding()
        .background(
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Image("cloud-background")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250)
                        .padding(.top, 40)
                }
                .frame(width: UIScreen.main.bounds.width)
                Spacer()
            }
        )
    }
    
    func progressToNext() {
        withAnimation {
            progress.next()
        }
    }
    
    func navigateTo(_ index: Int) {
        selected = index
        dismiss()
    }
    
    enum OnBoardingProgress: CaseIterable {
        case first
        case second
        case third
        
        mutating func next() {
               let allCases = Self.allCases
               if let currentIndex = allCases.firstIndex(of: self), currentIndex + 1 < allCases.count {
                   self = allCases[currentIndex + 1]
               }
           }
    }
}

private struct AboutView: View {
    var completed: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                Text("""
    Vítejte v aplikaci, která je tu pro vás! 🌸 

    Milí rodiče, 
    gratulujeme vám k této jedinečné životní cestě! Ať už čekáte miminko, nebo jste ho již přivítali na svět, jsme tu proto, abychom vás podpořili na každém kroku. 
    Naše aplikace vám přináší: 
    👶 Základní informace o těhotenství a porodu, které vám pomohou s přípravou na velký den. 
    🍼 Praktické tipy a rady o péči o vaše novorozené miminko. 
    🌼 Inspirace a podporu pro psychické i fyzické pohodlí maminky i tatínka, protože harmonická rodina je klíčem ke spokojenému miminku. 
    Projděte si klidně všechny funkce aplikace a najděte to, co vás zaujme. Společně zvládneme každý krok! 

    S láskou, 
    personál Porodnice \na Novorozeneckého oddělení  
    """)
                .padding(32)
                

            }
            .overlay{
                LinearGradient(colors: [.white, .white.opacity(0.0), .white.opacity(0.0), .white.opacity(0.0), .white.opacity(0.0), .white.opacity(0.0), .white], startPoint: .top, endPoint: .bottom)
                    .allowsHitTesting(false)
            }
            ContinueButton(action: completed)

            .padding(.horizontal)
            .padding(.bottom)

        }
    }
}

private struct SayYourNameView: View {
    var completed: () -> Void
    @Binding var name: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Jak vám máme říkat?")
                .padding(.horizontal)
            TextField("jméno", text: $name)
                .padding()
                .background(
                    Color.gray.opacity(0.2)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
            Spacer()
            ContinueButton(action: completed)

        }
        .padding()
    }
}

private struct HubMenu: View {
    var action: (Int) -> Void
    
    var isSmallDevice: Bool { UIScreen.main.bounds.width <= 375 }
    
    var body: some View {
        VStack {
            Button { action(1) } label: {
                Image("baby-hub")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image("babyboy")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("jsem v porodnici")
                                .font(.title2)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
            }
            Button { action(2) } label: {
                Image("home-hub")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image("seatchair")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("jsem doma")
                                .font(.title2)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
            }

            Button { action(2) } label: {
                Image("home-hub")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image("seatchair")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("jsem doma")
                                .font(.title2)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
            }
        }
    }
}

private struct ContinueButton: View {
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            Text("potvrdit")
                .foregroundStyle(.black)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 32)
                .background(
                    Color("background")
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
        }
    }
}

