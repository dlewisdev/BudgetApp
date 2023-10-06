//
//  CategoryCardView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct CategoryCardView: View {
    
    var selectedCategory: Category
    
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .fill(selectedCategory.category.color)
                        .frame(width: 50)
                        .accessibilityHidden(true)  // Hide decorative element
                    Image("\(selectedCategory.category.rawValue)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding()
                        .accessibilityLabel("\(selectedCategory.category.label) icon")
                }
                .padding(.leading)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(selectedCategory.category.label)
                        .font(.headline)
                    Text("spent ") +
                    Text("$\(selectedCategory.categoryTotalSpent) ")
                        .bold()
                        .foregroundStyle(.green) +
                    Text("of ") +
                    Text("$\(selectedCategory.categoryBudget)")
                }
                
                
                Spacer()
                
                VStack {
                    Text("$\(selectedCategory.categoryAvailableBudget)")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.green)
                    Text("left")
                }
                .padding(.trailing)
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Category \(selectedCategory.category.label), spent $\(selectedCategory.categoryTotalSpent) of $\(selectedCategory.categoryBudget), $\(selectedCategory.categoryAvailableBudget) left.")
            
            ProgressView(value: Double(selectedCategory.categoryTotalSpent),
                         total: Double(selectedCategory.categoryBudget))
            .progressViewStyle(LinearProgressViewStyle(tint: selectedCategory.category.color))
            .accessibilityValue("\(Int((Double(selectedCategory.categoryTotalSpent) / Double(selectedCategory.categoryBudget)) * 100)) percent")
        }
    }
}


struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a Category instance
        let exampleCategory = Category(
            category: .education,
            categoryBudget: 100,
            categoryTotalSpent: 20
        )
        
        // Create a State instance from the example category
        let selectedCategory = exampleCategory
        
        // Provide the binding to the CategoryCardView
        CategoryCardView(selectedCategory: exampleCategory)
    }
}
