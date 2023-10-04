//
//  HomeScreen.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//

import SwiftUI

struct StatusHeadlineView: View {
    @State var budget: Int
    @State var totalSpent: Int
    
    var available: Int {
        budget - totalSpent
    }
    
    var body: some View {
        
        HStack(spacing: 30) {
            VStack {
                Text("Spent")
                    .font(.subheadline)
                Text("$\(totalSpent)")
                    .bold()
                    .font(.title3)
            }
            Divider()
                .frame(height: 30)
            VStack {
                Text("Available")
                Text("$\(available)")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(.green)
            }
            Divider()
                .frame(height: 30)
            VStack {
                Text("Budget")
                Text("$\(budget)")
                    .bold()
                    .font(.title3)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        StatusHeadlineView(budget: 2000, totalSpent: 800)
    }
}
