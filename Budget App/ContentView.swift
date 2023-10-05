//
//  ContentView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/3/23.
//

import UIKit
import SwiftUI

struct ContentView: View {
    
    var viewModel: CategoriesViewModel
    

    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    Image("home")
                    Text("Home")
                }
            TrendsView()
                .tabItem {
                    Image("trends")
                    Text("Trends")
                }
            Transactions()
                .tabItem {
                    Image("transactions")
                    Text("Transactions")
                }
            Community()
                .tabItem {
                    Image("community")
                    Text("Community")
                }
            Profile()
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }
        }
    }
}




#Preview {
    ContentView(viewModel: CategoriesViewModel())
}
