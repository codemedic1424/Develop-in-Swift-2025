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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.ultraThinMaterial)
                .shadow(radius: 2)
            VStack(spacing: 10) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(completed) of \(total) complete")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                LinearProgressBar(progress: progress)
                    .frame(height: 20)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    PathwayCard(title: "Swift Pathway", subtitle: "Foundation of Xcode", completed: 2, total: 10, progress: 0.2)
}
