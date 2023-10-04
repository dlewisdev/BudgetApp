//
//  ContentView.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/3/23.
//

import SwiftUI

struct PurpleHeaderBackground: View {
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topLeading) {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: geo.size.width, height: 150)
                    .background(Color(red: 0.41, green: 0.44, blue: 0.79))
                    .cornerRadius(25)
                    .ignoresSafeArea()
                
                    
                }
            }
            
        }
    }


#Preview {
    PurpleHeaderBackground()
}
