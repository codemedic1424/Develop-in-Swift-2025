//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 11/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0, color: .red),
        Player(name: "Andre", score: 0, color: .blue),
        Player(name: "Jasmine", score: 0, color: .green)
    ]
    
    
    //TODO: List reordering
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
                            .foregroundStyle(player.color)
                        
                        Text("\(player.score)")
                        
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add a Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
