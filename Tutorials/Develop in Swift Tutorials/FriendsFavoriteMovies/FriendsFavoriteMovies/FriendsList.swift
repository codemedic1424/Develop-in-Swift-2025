//
//  FriendsList.swift
//  FriendsFavoriteMovies
//
//  Created by Christopher Wilshusen on 12/25/25.
//

import SwiftUI
import SwiftData

struct FriendsList: View {
    @Query(sort: \Friend.name) private var friends: [Friend]
    // MARK: EDUCATION NOTE: `A query fetches data from the model context and updates the view as it changes.  *private `var friends` of type array of Friend.
    @Environment(\.modelContext) private var context
    // MARK: EDUCATION NOTE: Recall that you use an @Environment property to access important global information, like the current color scheme of the device.
    
    var body: some View {
        List {
            ForEach(friends) { friend in
                Text(friend.name)
            }
        }
    }
}

#Preview {
    FriendsList()
        .modelContainer(SampleData.shared.modelContainer)
}
// MARK: EDUCATION NOTE: `A query relies on a SwiftData model container to get its data.
