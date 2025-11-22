//
//  PathwayCard.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct PathwayCard: View {
    
    var title: String
    var subtitle: String
    var completed: Int
    var total: Int
    var progress: Double
    var iconName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(.thinMaterial)
                .shadow(radius: 2)
            VStack(spacing: 10) {
                HStack {
                    Text(title)
                        .font(.title2)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: iconName)
                        .font(.title3)
                }
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer(minLength: 0)
                
                Text("\(completed) of \(total) complete")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LinearProgressBar(progress: progress)
                    .frame(height: 20)
            }
            .padding()
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    PathwayCard(title: "Swift Pathway", subtitle: "Foundation of Xcode", completed: 2, total: 10, progress: 0.2, iconName: "book.fill")
}
