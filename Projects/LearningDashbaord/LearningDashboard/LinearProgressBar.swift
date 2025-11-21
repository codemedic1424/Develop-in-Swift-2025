//
//  LinearProgressBar.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct LinearProgressBar: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                //background bar
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 12)
                
                //foreground bar
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.green)
                    .frame(width: geo.size.width * progress, height: 12)
            }
            .frame(height: 12)
        }
    }
}

#Preview {
    LinearProgressBar(progress: 0.4)
}
