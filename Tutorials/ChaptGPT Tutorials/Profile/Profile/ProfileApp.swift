//
//  ProfileApp.swift
//  Profile
//
//  Created by Christopher Wilshusen on 12/24/25.
//

import SwiftUI

@main
struct ProfileApp: App {
    @StateObject private var profileStore = ProfileStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(profileStore)
        }
    }
}
