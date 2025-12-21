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
        
        Text("Score Keeper")
            .font(.title)
            .bold()
            .padding(.bottom)
        
        EditButton()
        
        NavigationStack {
// TODO: Finish list reorder logic
                List {
                    ForEach($players) { $player in
                        Text("\(player.name)")
                        
                        //  Text("\(player.score)")
                        //  Stepper("\(player.score)", value: $player.score)
                        //    .labelsHidden()
                    }
                }
                .onMove(perform: <#T##Optional<(Foundation.IndexSet, Int) -> Void>#>)
                
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
