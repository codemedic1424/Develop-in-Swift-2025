//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by Christopher Wilshusen on 12/25/25.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Elena"),
        Friend(name: "Mark"),
        Friend(name: "Ronnie"),
        Friend(name: "Cheyenne"),
        Friend(name: "Keith")
    ]
}
