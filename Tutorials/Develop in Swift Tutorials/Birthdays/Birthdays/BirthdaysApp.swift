//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Christopher Wilshusen on 12/23/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
