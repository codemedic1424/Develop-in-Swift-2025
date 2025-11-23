//
//  SchemaVersionManager.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/23/25.
//

import Foundation
import SwiftData

/// A tiny dev-only helper that nukes the SwiftData store
/// whenever we intentionally bump our schemaVersion.
enum SchemaVersionManager {

    /// ⚠️ Bump this any time your SwiftData model changes.
    static let currentSchemaVersion = "2025-11-23-schema-v1"

    private static let key = "LearningDashboardSchemaVersion"

    static func checkAndResetIfNeeded(modelContainerURL: URL) {
        #if DEBUG
        let stored = UserDefaults.standard.string(forKey: key)

        // First run or version changed?
        if stored != currentSchemaVersion {
            print("🔥 [SwiftData] Schema changed: resetting store")

            // Delete the whole SQLite container directory
            try? FileManager.default.removeItem(at: modelContainerURL)

            // Save the new version
            UserDefaults.standard.set(currentSchemaVersion, forKey: key)
        } else {
            print("👍 [SwiftData] Schema version OK")
        }
        #endif
    }
}
