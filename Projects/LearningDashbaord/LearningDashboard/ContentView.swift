//
//  ContentView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dashboard: LearningDashboardModel
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    SwiftPathwayView(items: swiftItems)
                } label: {
                    PathwayCard(title: "Swift Pathway", subtitle: "Learn the foundations of Swift", completed: 0, total: swiftItems.count, progress: 0.0, iconName: "swift")
                        .contentShape(Rectangle())
                }
                
                NavigationLink {
                    SwiftUIPathwayView(items: swiftUIItems)
                } label: {
                    PathwayCard(title: "SwiftUI Pathway", subtitle: "See the power of SwiftUI", completed: 0, total: swiftUIItems.count, progress: 0.0, iconName: "square.grid.2x2")
                        .contentShape(Rectangle())
                }
                
                NavigationLink {
                    DISTutorialView(items: disItems)
                } label: {
                    PathwayCard(title: "Develop in Swift Tutorial", subtitle: "Take what you learned and put into real code", completed: 0, total: disItems.count, progress: 0.0, iconName: "book.fill")
                        .contentShape(Rectangle())
                }
                
                NavigationLink {
                    PracticeLabsView(items: practiceLabs)
                } label: {
                    PathwayCard(title: "Practice Labs", subtitle: "Swift Practice Projects", completed: 0, total: practiceLabs.count, progress: 0.0, iconName: "hammer.fill")
                        .contentShape(Rectangle())
                }
            }
            .navigationTitle("Learning Dashboard")
        }
    }
}

#Preview {
    ContentView()
}
