//
//  MultiColorProgressBar.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//


import SwiftUI

//struct MultiColorProgressBar: View {
//    var categories: [Category]
//    var totalBudget: Double
//    
//    var body: some View {
//        GeometryReader { geometry in
//            HStack(spacing: 0) {
//                ForEach(categories, id: \.category) { category in
//                    Rectangle()
//                        .foregroundColor(category.category.color)
//                        .frame(width: geometry.size.width * CGFloat(category.categoryTotalSpent) / CGFloat(totalBudget))
//                }
//            }
//        }
//    }
//}

struct LeadingRoundedRectangle: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: -180), endAngle: Angle(degrees: -90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + rect.height - radius), radius: radius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
        
        return path
    }
}

struct TrailingRoundedRectangle: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius), radius: radius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        return path
    }
}
