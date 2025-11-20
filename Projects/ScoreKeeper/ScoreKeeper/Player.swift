//
//  Player.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 11/19/25.
//

import SwiftUI

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
    var color: Color = .black
}
