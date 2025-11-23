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

    // Create container in a known location so we can delete it
    private var container: ModelContainer = {
        let schema = Schema([LearningItemModel.self])

        let url = URL.documentsDirectory
            .appending(path: "LearningDashboard.sqlite")

        // 🔥 Run dev-only version check & auto-reset
        SchemaVersionManager.checkAndResetIfNeeded(modelContainerURL: url)

        let config = ModelConfiguration(url: url)
        return try! ModelContainer(for: schema, configurations: [config])
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(container)
        }
    }
}
