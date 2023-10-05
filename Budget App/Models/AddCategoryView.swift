//
//  AddCategoryView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/5/23.
//

import SwiftUI

struct AddCategoryView: View {
    @EnvironmentObject var viewModel: CategoriesViewModel
    @State private var category: Categories = .food
    @State private var categoryBudget: String = ""
    @State private var categoryTotalSpent: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Picker("Category", selection: $category) {
                                   ForEach(Categories.allCases, id: \.self) { category in
                                       Text(category.label)
                                           .tag(category)
                                   }
                               }
                TextField("Budget", text: $categoryBudget)
                    .keyboardType(.numberPad)
                TextField("Total Spent", text: $categoryTotalSpent)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add Category", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                guard let budget = Int(categoryBudget), let totalSpent = Int(categoryTotalSpent) else { return }
                let newCategory = Category(
                    category: category,
                    categoryBudget: budget,
                    categoryTotalSpent: totalSpent
                )
                viewModel.categories.append(newCategory)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            })
        }
    }
}


#Preview {
    AddCategoryView()
}
