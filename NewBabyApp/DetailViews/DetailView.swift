//
//  DetailView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 14.10.2024.
//

import SwiftUI

struct DetailView: View {
    var model: DetailModel
        
    var body: some View {

            Text("\(model.title)")
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
