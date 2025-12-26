//
//  SampleData.swift
//  FriendsFavoriteMovies
//
//  Created by Christopher Wilshusen on 12/25/25.
//

import Foundation
import SwiftData

@MainActor
// MARK: Education Note: With this annotation, you’re declaring that all code in this class must run on the main actor, including access to the mainContext property. Since all the SwiftUI code in an app runs on the main actor by default, you’ve satisfied the condition.

class SampleData {
    static let shared = SampleData()
    
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        do {
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            insertSampleData()
            
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
    }
}

