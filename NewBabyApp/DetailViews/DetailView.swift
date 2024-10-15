//
//  DetailView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct DetailView: View {
    var detail: DetailModel
    
    @Binding var path: NavigationPath
    
    var body: some View {

            Text("\(detail.title)")
        /*
            .onAppear {
                if let stories = detail.stories, !isStoriesCompleted {
                    path.append(stories)
                    isStoriesCompleted = true
                }
            }
         */
    }
}

/*
#Preview {
    DetailView()
}
*/
