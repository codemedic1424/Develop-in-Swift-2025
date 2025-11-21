//
//  SwiftPathwayView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct SwiftPathwayView: View {
    @State var items: [LearningItem]
    var completedCount: Int {
        items.filter { $0.isComplete }.count
    }

    var totalCount: Int {
        items.count
    }

    var progressPercent: Double {
        totalCount == 0 ? 0 : Double(completedCount) / Double(totalCount)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(completedCount) of \(totalCount) complete")
            LinearProgressBar(progress: progressPercent)
        }
        .frame(height: 30)
        .padding()
        
        List {
            ForEach(items.indices, id: \.self) { index in
                let item = items[index]
                
                HStack {
                    Text(item.chapterTitle)
                    
                    Spacer()
                    
                    Image(systemName: item.isComplete ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundStyle(item.isComplete ? .green : .red)
                }
                .onTapGesture {
                    items[index].isComplete.toggle()
                }
            }
        }
        .navigationTitle("Swift Pathway")
    }
}

#Preview {
    SwiftPathwayView(items: swiftItems)
}
