//
//  Budget_AppApp.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/3/23.
//

import SwiftUI

@main
struct Budget_AppApp: App {
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
            .environmentObject(viewModel)
            .preferredColorScheme(.light)
        }
    }
}
