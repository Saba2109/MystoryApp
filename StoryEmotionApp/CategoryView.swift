//
//  CategoryView.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//
import SwiftUI

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
                
               
                HStack {
                    Text("Choose a story")
                        .font(.system(size: 34, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal, 23)
                .padding(.top, 3)

                LazyVGrid(columns: columns, spacing: 100) {
                    
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

                Image("waving boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 178, height: 448)
                    .padding(.bottom, -160)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color(red: 0.98, green: 0.97, blue: 0.95)
                    .ignoresSafeArea()
            )
            
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

#Preview {
    NavigationStack {
        CategoryView()
    }
}
