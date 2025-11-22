//
//  ProgressBarView.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/21/25.
//

import SwiftUI

struct ProgressBarView: View {
    var title: String
    var percent: Double
    var completed: Int
    var total: Int
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 8) {
                ProgressView(value: percent)
                    .frame(maxWidth: .infinity)
                
                Text("\(completed) / \(total)")
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(6)
    }
}

