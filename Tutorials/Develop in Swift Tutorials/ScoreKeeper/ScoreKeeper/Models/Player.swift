//
//  Player.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 12/20/25.
//

import Foundation

struct Player: Identifiable {
    // MARK: Struct Variables
    var id = UUID()
    
    // MARK: Model Variables
    var name: String
    var score: Int
}
