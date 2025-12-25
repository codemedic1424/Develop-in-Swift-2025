//
//  ContentView.swift
//  Profile
//
//  Created by Christopher Wilshusen on 12/24/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var profileStore: ProfileStore
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("Name", text: $profileStore.myProfile.name)
                .textInputAutocapitalization(.words)

            DatePicker(
                "Birthday",
                selection: $profileStore.myProfile.birthday,
                displayedComponents: .date
            )
        }
        .padding()
        .onChange(of: profileStore.myProfile.name) { _, _ in
            profileStore.save()
        }
        .onChange(of: profileStore.myProfile.birthday) { _, _ in
            profileStore.save()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ProfileStore())
}
