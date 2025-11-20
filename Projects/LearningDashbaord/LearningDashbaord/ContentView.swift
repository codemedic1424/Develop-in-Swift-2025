//
//  ContentView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Swift Pathway") {
                    SwiftPathwayView(items: swiftItems)
                }
                NavigationLink("SwiftUI Pathway") {
                    SwiftUIPathwayView(items: swiftUIItems)
                }
                NavigationLink("Develop in Swift Tutorial") {
                    DISTutorialView(items: disItems)
                }
                NavigationLink("Practice Labs") {
                    PracticeLabsView(items: practiceLabs)
                }
            }
            .navigationTitle("Learning Dashboard")
        }
    }
}

#Preview {
    ContentView()
}
