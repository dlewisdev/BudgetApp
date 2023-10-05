//
//  Categories.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import Foundation
import SwiftUI

struct Category: Identifiable, Codable  {
    var category: Categories
    var categoryBudget: Int
    var categoryTotalSpent: Int
    
    var transactions: [Int] = []
    
    var categoryAvailableBudget: Int {
        return categoryBudget - categoryTotalSpent
    }

    var id: String {
        "\(category.rawValue)"
    }
    
}


enum Categories: String, Codable, CaseIterable {
    case food, shopping, transportation, education
    
    var label: String {
        return self.rawValue.capitalized
    }
    
    var color: Color {
        switch self {
            case .food:
                return Color(red: 33/255, green: 59/255, blue: 128/255)
            case .shopping:
                return Color(red: 56/255, green: 107/255, blue: 188/255)
            case .transportation:
                return Color(red: 255/255, green: 185/255, blue: 0)
            case .education:
                return Color(red: 70/255, green: 189/255, blue: 198/255)
        }
    }
}



