//
//  LearningDashboardApp.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

@main
struct LearningDashboardApp: App {
    @StateObject var dashboard = LearningDashboardModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dashboard)
        }
        .modelContainer(for: LearningItemModel.self)
    }
}
