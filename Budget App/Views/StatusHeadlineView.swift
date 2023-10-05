//
//  HomeScreen.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct StatusHeadlineView: View {
    @ObservedObject var viewModel: CategoriesViewModel
    
    
    var body: some View {
        
        HStack(spacing: 30) {
            VStack {
                Text("Spent")
                    .font(.subheadline)
                Text("$\(viewModel.totalSpent)")
                    .bold()
                    .font(.title3)
            }
            Divider()
                .frame(height: 30)
            VStack {
                Text("Available")
                Text("$\(viewModel.available)")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.green)
            }
            Divider()
                .frame(height: 30)
            VStack {
                Text("Budget")
                Text("$\(viewModel.totalBudget)")
                    .bold()
                    .font(.title3)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatusHeadlineView(viewModel: CategoriesViewModel())
    }
}
