//
//  DetailView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct DetailView: View {
    
    var viewModel: CategoriesViewModel
    
    @State private var showAddCategoryView: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                HStack {
                    Text("Monthly Budget")
                        .accessibilityLabel("Monthly Budget Header")
                    Image("arrow")
                        .accessibilityLabel("Expand arrow")
                    Spacer()
                    Image("share")
                        .accessibilityLabel("Share")
                    Button {
                        showAddCategoryView = true
                    } label: {
                        Image("ellipses")
                            .accessibilityLabel("More options")
                    }
                }
                .frame(width: geo.size.width * 0.7, height: geo.size.height * 0.4)
                .foregroundStyle(.white)
                .font(.system(size: 20)).bold()
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.1)
                
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(.white)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.7)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.48)
                    .accessibilityLabel("Background card")
                
                DatePickerView()
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.65)
                    .accessibilityLabel("Date Picker")
                
                StatusHeadlineView(viewModel: viewModel)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.25)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Budget Details")
                
                MultiSegmentProgressBar(viewModel: viewModel)
                    .frame(width: geo.size.width * 0.7)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.8)
                    .accessibilityLabel("Progress Bar")
                
                VStack {
                    ForEach(viewModel.categories) { category in
                        CategoryCardView(selectedCategory: category)
                    }
                }
                .frame(width: geo.size.width *  0.8)
                .position(x: geo.size.width * 0.5, y: geo.size.height * 0.58)
                .accessibilityElement(children: .combine)
                .accessibilityLabel("Categories List")
                
            }
            .sheet(isPresented: $showAddCategoryView, content: {
                AddCategoryView()
                    .presentationDetents([.medium])
            })
        }
    }

}

#Preview {
    DetailView(viewModel: CategoriesViewModel())
}
