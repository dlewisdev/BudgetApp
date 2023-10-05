//
//  CategoriesViewModel.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

@MainActor
class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] {
        didSet {
            saveCategories()
        }
    }
    
    var totalBudget: Int {
        categories.reduce(0) { $0 + $1.categoryBudget }
    }
    
    var totalSpent: Int {
        categories.reduce(0) { $0 + $1.categoryTotalSpent }
    }
    
    var available: Int {
        totalBudget - totalSpent
    }
    
    init() {
        if let savedData = UserDefaults.standard.data(forKey: "categories"),
           let decodedData = try? JSONDecoder().decode([Category].self, from: savedData) {
            self.categories = decodedData
        } else {
            self.categories = []  // Or use your default categories here
        }
    }
    
    func saveCategories() {
           let encoder = JSONEncoder()
           if let encoded = try? encoder.encode(categories) {
               UserDefaults.standard.set(encoded, forKey: "categories")
           }
       }

       func loadCategories() {
           if let savedData = UserDefaults.standard.data(forKey: "categories"),
              let decoded = try? JSONDecoder().decode([Category].self, from: savedData) {
               categories = decoded
           }
       }
   }
