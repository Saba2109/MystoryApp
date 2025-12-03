//
//  HomeView.swift.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                VStack(spacing: 28) {
                    NavigationLink {
                        CategoryView()
                    } label: {
                        PrimaryMenuButton(title: "Choose a story")                       }

                    NavigationLink {
                        CreateStoryView()
                    } label: {
                        PrimaryMenuButton(title: "Create a story")
                    }
                }
                .padding(.top, 210)

                Spacer()

                Image("waving boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 178, height: 448)           .padding(.bottom, 10)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.98, green: 0.97, blue: 0.95)
                    .ignoresSafeArea()
            )
        }
    }
}

#Preview {
    HomeView()
}
