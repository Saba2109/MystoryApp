//
//  StoryEmotionScreen.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//

import SwiftUI
import Combine

// MARK: - App Entry

@main
struct ChooseStoryScreen: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

// MARK: - Home Screen

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(spacing: 32) {
                    NavigationLink {
                        CategoryView()
                    } label: {
                        PrimaryMenuButton(title: viewModel.menuTitles[0])
                    }
                    
                    NavigationLink {
                        CreateStoryView()
                    } label: {
                        PrimaryMenuButton(title: viewModel.menuTitles[1])
                    }
                }
                
                Spacer()
                
                Image("waving boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 178, height: 448)
                    .padding(.bottom, -120)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.98, green: 0.97, blue: 0.95)
                    .ignoresSafeArea()
            )
        }
    }
}

// MARK: - Category Screen

struct CategoryView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CategoryViewModel()
    
    private let columns = [
        GridItem(.flexible(), spacing: 40),
        GridItem(.flexible(), spacing: 32)
    ]
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            VStack {
                
                // العنوان
                HStack {
                    Text("Choose a story")
                        .font(.system(size: 34, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 39)
                
                // مربعات القصص
                LazyVGrid(columns: columns, spacing: 60) {
                    ForEach(viewModel.categories) { category in
                        NavigationLink {
                            StoryView(title: category.title)
                        } label: {
                            Text(category.title)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundColor(.black)
                                .frame(width: 150, height: 100)
                                .background(Color.white)
                                .cornerRadius(22)
                                .shadow(color: Color.black.opacity(0.40),
                                        radius: 8, x: 0, y: 5)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 90)
                
                Spacer()
                
                // صورة الولد
                Image("waving boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 178, height: 448)
                    .padding(.bottom, -140)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.98, green: 0.97, blue: 0.95)
                    .ignoresSafeArea()
            )
            .navigationBarBackButtonHidden(true)
            
            
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.black)
            }
            .padding(.trailing, 24)
            .padding(.top, 12)
        }
    }
}

// MARK: - Story Screen

struct StoryView: View {
    let title: String
    
    var body: some View {
        VStack(spacing: 24) {
            Text(title)
                .font(.system(size: 28, weight: .bold))
            
            Text("Here will be the story content for this emotion.")
                .font(.system(size: 18))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.98, green: 0.97, blue: 0.95)
                .ignoresSafeArea()
        )
    }
}

// MARK: - Create Story Screen (Placeholder)

struct CreateStoryView: View {
    var body: some View {
        VStack {
            Text("Create a story")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(red: 0.98, green: 0.97, blue: 0.95)
                .ignoresSafeArea()
        )
    }
}

// MARK: - Shared Button

struct PrimaryMenuButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 20, weight: .medium))
            .foregroundColor(.black)
            .frame(width: 199, height: 146)
            .background(Color.white)
            .cornerRadius(26)
            .shadow(color: Color.black.opacity(0.18),
                    radius: 10, x: 0, y: 8)
    }
}

// MARK: - ViewModels + Model 

class HomeViewModel: ObservableObject {
    let menuTitles = [
        "Choose a story",
        "Create a story"
    ]
}

class CategoryViewModel: ObservableObject {
    @Published var categories: [EmotionCategory] = [
        EmotionCategory(title: "I want to play"),
        EmotionCategory(title: "I feel angry"),
        EmotionCategory(title: "My friend is sad"),
        EmotionCategory(title: "I feel shy")
    ]
}

struct EmotionCategory: Identifiable {
    let id = UUID()
    let title: String
}

// MARK: - Previews

#Preview("Home") {
    NavigationStack {
        HomeView()
    }
}

#Preview("Category") {
    NavigationStack {
        CategoryView()
    }
}

#Preview("Story") {
    StoryView(title: "I feel angry")
}

#Preview("Create Story") {
    CreateStoryView()
}
