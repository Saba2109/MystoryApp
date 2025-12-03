//
//  PrimaryMenuButton.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//
import SwiftUI

struct PrimaryMenuButton: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.black)
            .frame(width: 199, height: 146)
            .background(Color.white)
            .glassEffect(.clear .interactive())
            .cornerRadius(26)
            .shadow(color: Color.black.opacity(0.40),
                    radius: 8, x: 0, y: 5)
    }
}
