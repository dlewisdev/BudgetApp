//
//  HomeScreen.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/3/23.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                RoundedRectangle(cornerRadius: 30.0, style: .continuous)
                    .foregroundColor(.white)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
