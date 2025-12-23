//
//  Scoreboard.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 12/21/25.
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
        ]
    
    var state = GameState.setup // Sets initial game state to setup
    var doesHighScoreWin: Bool = true
    
    var winners: [Player] {
        guard state == .gameOver else { return [] }
        
        var winningScore = 0
        if doesHighScoreWin {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
            }
        } else {
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
        }
        return players.filter { player in
            player.score == winningScore
        }
    }
    
// MARK: - Education Note: Functions on structs are read-only my default. 'mutating' tells Swift the function is permitted to change data within the struct.
    mutating func resetScores(to newValue: Int) {
        for index in 0..<players.count {
            players[index].score = newValue
        }
    }
}

