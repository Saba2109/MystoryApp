//
//  StoryView.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//

import SwiftUI

struct StoryView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Story content will appear here.")
                .foregroundColor(.gray)
        }
        .padding()
        .navigationTitle(title)
    }
}

#Preview {
    StoryView(title: "Example Story")
}
