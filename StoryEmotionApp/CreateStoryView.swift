//
//  CreateStoryView.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//

import SwiftUI

struct CreateStoryView: View {
    var body: some View {
        VStack {
            Text("Create a Story")
                .font(.title)
                .fontWeight(.semibold)
                .padding()

            Text("This screen is a placeholder. You can add your own fields and UI later.")
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.98, green: 0.97, blue: 0.95)
                .ignoresSafeArea()
        )
        .navigationTitle("Create a Story")
    }
}
