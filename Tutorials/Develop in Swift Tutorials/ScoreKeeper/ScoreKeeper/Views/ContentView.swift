//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 12/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [  // create an array of "players" of type Player
        Player(name: "Jasmine", score: 0),
        Player(name: "Mike", score: 0),
        Player(name: "Theo", score: 0),
        Player(name: "Linda", score: 0)
    ]
    
    func movePlayers(from source: IndexSet, to destination: Int) {
        players.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(players) { player in
                    Text("\(player.name)")
                }
                .onMove(perform: movePlayers)
                
                
                Button("Add Player", systemImage: "plus") {
                    players.append(Player(name: "", score: 0))
                }
                .autocorrectionDisabled()
            }
            
            HStack(alignment: .center) {
                Spacer()
                Button("Reset Scores") {
                    for i in players.indices {
                        players[i].score = 0
                    }
                }
                .tint(.red.opacity(0.8))
                .buttonStyle(.glassProminent)
                .padding(.top)
            }
            
            
            .navigationTitle("Score Keeper")
            .toolbar {
                EditButton()
            }
            .padding(.vertical)
            
            
            
            HStack(alignment: .center) {
                Spacer()
                Button("Reset Scores") {
                    for i in players.indices {
                        players[i].score = 0
                    }
                }
                .tint(.red.opacity(0.8))
                .buttonStyle(.glassProminent)
                .padding(.top)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
