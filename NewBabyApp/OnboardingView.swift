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
            Image(isSmallDevice ? .logoFnol : .logoFnolVertical)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                            .padding()
                            .padding(.leading, 11)
            Text("onboarding_welcome".localizedString)
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.fnolBlue)
                            .padding(.horizontal)
                            .padding()
            Spacer()

            switch progress {
            case .first:
                AboutView(completed: progressToNext)
                    .frame(width: UIScreen.main.bounds.width)

            case .second:
                DisclaimerView(completed: progressToNext)
                    .frame(width: UIScreen.main.bounds.width)

            case .third:
                SayYourNameView(completed: progressToNext, name: $clientName)
                    .frame(width: UIScreen.main.bounds.width)
            case .fourth:
                HubMenu(action: navigateTo)
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
        .padding()
        .background(
            VStack(alignment: .trailing) {
                HStack {
                    Spacer()
                    Image(.cloudBackground)
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
        case fourth
        
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
            Text("onboarding_about".localizedString)
                .padding(32)
            Spacer()
            ContinueButton(action: completed)
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

private struct DisclaimerView: View {
    var completed: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("onboarding_disclaimer".localizedString)
                .padding(32)
            Spacer()
            ContinueButton(action: completed)
                .padding(.horizontal)
                .padding(.bottom)
        }
    }
}

private struct SayYourNameView: View {
    @FocusState private var keyboardFocused: Bool

    var completed: () -> Void
    @Binding var name: String
    var body: some View {
        VStack(alignment: .leading){
            Text("onboarding_name_question".localizedString)
                .padding(.horizontal)
            TextField("onboarding_name_placeholder".localizedString, text: $name)
                .padding()
                .background(
                    Color.gray.opacity(0.2)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
                .focused($keyboardFocused)
                .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            keyboardFocused = true
                        }
                    }
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
            Button { action(0) } label: {
                Image(.pregnantHub)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image(.pregnant)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("title_cekamemiminko".localizedString)
                                .font(.title2)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
            }
            
            Button { action(1) } label: {
                Image(.babyHub)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image(.babyboy)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("title_jsmevporodnici".localizedString)
                                .font(.title2)
                        }
                        .foregroundStyle(.black)
                        .padding()
                    }
            }
            Button { action(2) } label: {
                Image(.homeHub)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 32, height: isSmallDevice ? 120 : 140)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        VStack{
                            Image(.seatchair)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Text("title_jsmedoma".localizedString)
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
            Text("onboarding_next_button".localizedString)
                .foregroundStyle(.black)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 32)
                .background(
                    Color.background
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                )
        }
    }
}

