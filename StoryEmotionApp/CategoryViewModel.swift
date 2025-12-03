//
//  CategoryViewModel.swift
//  StoryEmotionApp
//
//  Created by saba alrasheed on 12/06/1447 AH.
//

import Foundation
import Combine

class CategoryViewModel: ObservableObject {
    @Published var categories: [EmotionCategory] = [
        EmotionCategory(title: "I want to play"),
        EmotionCategory(title: "I feel angry"),
        EmotionCategory(title: "My friend is sad"),
        EmotionCategory(title: "I feel shy")
    ]
}
