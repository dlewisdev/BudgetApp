//
//  HomeView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) var dismiss
    var viewModel: CategoriesViewModel
    @State private var showAddTransactionView: Bool = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                PurpleHeaderBackground()
                
                DetailView(viewModel: viewModel)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 0.44)
                
                Text("6 Month Snapshot")
                    .font(.title2).bold()
                    .position(x: geo.size.width * 0.3, y: geo.size.height * 0.82)
                
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(.white)
                    .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.25)
                    .position(x: geo.size.width * 0.5, y: geo.size.height * 1)
                    .accessibilityLabel("Background card")
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    showAddTransactionView = true
                } label: {
                    Image(systemName: "plus")
                        .accessibilityLabel("Add a new transaction")
                        .accessibilityHint("Double tap to add a new transaction.")
                        .frame(width: 40, height: 40)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(13)
                        .background(Color(red: 0.3176, green: 0.3412, blue: 0.7490), in: Circle())
                }
                .padding(15)
                
            }
            .sheet(isPresented: $showAddTransactionView, content: {
                AddTransactionView(viewModel: viewModel)
                    .presentationDetents([.medium])

            })

        }
    }
}
#Preview {
    HomeView(viewModel: CategoriesViewModel())
}
