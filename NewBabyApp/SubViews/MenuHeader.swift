//
//  MenuHeader.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 02.07.2025.
//

import SwiftUI

struct MenuHeader: View {
    var clientName: String?
    var subtitle: String?
    var heartTapAction: (() -> Void)? = nil
    @Binding var scrollPosition: CGFloat
    
    @State var isSearchActive: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Image(.fnolHeart)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundStyle(Color.accent)
                    .onTapGesture(count: 5) {
                        heartTapAction?()
                    }
                Spacer()
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                    .background(Color.white.opacity(0.6))
                    .clipShape(Circle())
                    .padding(6)
                    .onTapGesture {
                        isSearchActive = true
                    }
            }
            .frame(height: 50)
            
            Spacer(minLength: 250)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    if let clientName = clientName, clientName.count > 0 {
                        Text("welcome_name".localizedString(clientName))
                            .font(.title)
                    } else {
                        Text("welcome_user".localizedString)
                            .font(.title)
                    }
                    if let subtitle, subtitle.count > 0 {
                        Text(subtitle.localizedString)
                    }
                }
                Spacer()
            }
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .global).minY) { newValue in
                            scrollPosition = newValue
                        }
                }
            )
        }
        .padding(.horizontal)
        .sheet(isPresented: $isSearchActive, content: {
            SearchView()

        })
    }
}

