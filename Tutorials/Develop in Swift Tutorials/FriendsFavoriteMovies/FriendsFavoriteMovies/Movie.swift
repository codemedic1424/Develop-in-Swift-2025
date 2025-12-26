//
//  Movie.swift
//  FriendsFavoriteMovies
//
//  Created by Christopher Wilshusen on 12/25/25.
//

import Foundation
import SwiftData

@Model
class Movie {
    var title: String
    var releaseDate : Date
    
    init(title: String, releaseDate: Date) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
