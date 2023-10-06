//
//  HomeScreen.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/3/23.
//

import SwiftUI

struct DatePickerView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                
                ZStack {
                    RoundedRectangle(cornerRadius: 5.0)
                        .foregroundStyle(Color.green.opacity(0.2))
                        .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.03)
                        .hAlign(.center)
                    HStack{
                        Label {
                            Text("October 2023")
                                .bold()
                                .font(.system(size: 13))
                                
                        } icon: {
                            Image(systemName: "arrowtriangle.down.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 8)
                        }
                        .labelStyle(RightIconLabelStyle())
                        .foregroundStyle(.green)
                    }
                    
                }
            }
        }
    }
}

struct RightIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}


#Preview {
    DatePickerView()
}
