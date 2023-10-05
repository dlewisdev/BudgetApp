//
//  MultiSegmentProgressBar.swift
//  Budget App
//
//  Created by Danielle Lewis on 10/4/23.
//


import SwiftUI

struct MultiSegmentProgressBar: View {
    @ObservedObject var viewModel: CategoriesViewModel
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                RoundedRectangle(cornerRadius: 10.0)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: geometry.size.width * 0.9, height: 30)
                
                
                HStack(spacing: 0) {
                    ForEach(viewModel.categories.indices, id: \.self) { index in
                        let progress = CGFloat(viewModel.categories[index].categoryTotalSpent) / CGFloat(viewModel.totalBudget)
                        let width = geometry.size.width * progress
                        
                        if index == 0 {
                            LeadingRoundedRectangle(radius: 10)
                                .fill(viewModel.categories[index].category.color)
                                .frame(width: width, height: 30)
                        } else if index == viewModel.categories.count - 1 {
                            TrailingRoundedRectangle(radius: 10)
                                .fill(viewModel.categories[index].category.color)
                                .frame(width: width, height: 30)
                        } else {
                            Rectangle()
                                .fill(viewModel.categories[index].category.color)
                                .frame(width: width, height: 30)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

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
