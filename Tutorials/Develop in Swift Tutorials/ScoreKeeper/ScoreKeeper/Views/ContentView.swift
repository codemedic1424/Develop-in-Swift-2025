//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Christopher Wilshusen on 12/20/25.
//

// TODO: Refactor row layout to separtate model 

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [  // create an array of "players" of type Player
        Player(name: "Jasmine", score: 0),
        Player(name: "Mike", score: 0),
        Player(name: "Theo", score: 0),
        Player(name: "Linda", score: 0)
    ]
    @State private var editMode: EditMode = .inactive
    
    private var isEditing: Bool {
        editMode.isEditing
    }
    
    func movePlayers(from source: IndexSet, to destination: Int) {
        players.move(fromOffsets: source, toOffset: destination)
    }
    
    func deletePlayer(id: UUID) {
        if let index = players.firstIndex(where: { $0.id == id }) {
            players.remove(at: index)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach($players) { $player in
                        HStack {
                            if isEditing {
                                TextField("Name", text: $player.name)
                                    .autocorrectionDisabled()
                            } else {
                                Text(player.name)
                            }
                            
                            Spacer()
                            
                            if !isEditing {
                                Text("\(player.score)")
                                    .monospacedDigit()
                            }
                            
                            if isEditing {
                                Button(role: .destructive) {
                                    deletePlayer(id: player.id)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .buttonStyle(.borderless)
                            } else {
                                Stepper("", value: $player.score)
                                    .labelsHidden()
                            }
                        }
                    }
                    .onMove(perform: movePlayers)
                }
                
                Section {
                    if isEditing {
                        Button("Add Player", systemImage: "plus") {
                            players.append(Player(name: "", score: 0))
                        }
                    }
                }
                
                Section {
                    HStack() {
                        Spacer()
                        Button("Reset Scores") {
                            for i in players.indices {
                                players[i].score = 0
                            }
                        }
                        .tint(.red.opacity(0.8))
                        .buttonStyle(.glassProminent)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Score Keeper")
            .toolbar {
                EditButton()
            }
            .environment(\.editMode, $editMode)
        }
    }
}

#Preview {
    ContentView()
}
