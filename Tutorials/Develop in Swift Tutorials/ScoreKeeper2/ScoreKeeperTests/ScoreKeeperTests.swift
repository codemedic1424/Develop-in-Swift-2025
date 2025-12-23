//
//  ScoreKeeperTests.swift
//  ScoreKeeperTests
//
//  Created by Christopher Wilshusen on 12/23/25.
//

import Testing
@testable import ScoreKeeper

struct ScoreKeeperTests {
    
    @Test("Reset player scores", arguments: [0, 10, 20])
    func resetScores(to newValue: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        var scoreboard = Scoreboard(players: [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 5)
        ])
        scoreboard.resetScores(to: newValue)
        
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest score wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5)
            ],
            state: .gameOver,
            doesHighScoreWin: true
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 5)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5)
            ],
            state: .gameOver,
            doesHighScoreWin: false
        )
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
}

