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
   
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        
                        Text("\(player.score)")
                        
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            .autocorrectionDisabled()
            
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
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
