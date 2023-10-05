//
//  AddCategoryView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    @State var categoryIndex: Int = 0
    @State private var transactionAmount: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Choose a category: ")
                    Spacer()
                    Picker("Category", selection: $categoryIndex) {
                        ForEach(viewModel.categories.indices, id: \.self) { index in
                            Text(viewModel.categories[index].category.label)
                                .fontWeight(.bold)
                                .foregroundColor(viewModel.categories[index].category.color)
                                .accessibilityLabel("Category \(viewModel.categories[index].category.label)")
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                    .accessibilityLabel("Category Picker")
                    .accessibilityHint("Select a category for the transaction.")
                    
                }
                
                HStack {
                    Text("Transaction Amount:")
                    Spacer()
                    TextField("$", text: $transactionAmount)
                        .keyboardType(.numberPad)
                        .frame(width: 100)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        .accessibilityLabel("Transaction Amount")
                        .accessibilityHint("Enter the amount of the transaction.")
                }
                
                Spacer()
                Button(action: {
                                    guard let transactionValue = Int(transactionAmount) else { return }
                                    viewModel.categories[categoryIndex].categoryTotalSpent += transactionValue
                                    viewModel.categories[categoryIndex].transactions.append(transactionValue)
                                    dismiss()
                                }) {
                                    HStack {
                                        Text("Save Transaction")
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                                    .accessibilityLabel("Save Transaction")
                                    .accessibilityHint("Save the transaction to the selected category.")
                                }
                                .padding()
            }
            .padding()
            .navigationBarTitle("Add Transaction")

        }
    }
}


struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        AddTransactionView(viewModel: CategoriesViewModel(), categoryIndex: 1)
    }
}

