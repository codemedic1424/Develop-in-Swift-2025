import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var startingPoint = 0
    // MARK: - Education Note: Since we re-directed the 'Source of Truth' to the Scoreboard Model - Lines 6-10 are no longer needed. Kept to provide reference for notes below.
    //    @State private var players: [Player] = [
    //        Player(name: "Elisha", score: 0),
    //        Player(name: "Andre", score: 0),
    //        Player(name: "Jasmine", score: 0),
    //    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighScoreWin, startingPoints: $startingPoint)
                .disabled(scoreboard.state != .setup)
            
            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)
                
                // MARK: - Education Note: Line 28 draws the information from the above private var 'players'. The change in Line 37 redirects the ForEach to draw the information from private var 'scoreboard' which is equal to the Scoreboard view.
                
                //                ForEach($players) { $player in
                //                    GridRow {
                //                        TextField("Name", text: $player.name)
                //                        Text("\(player.score)")
                //                        Stepper("\(player.score)", value: $player.score)
                //                            .labelsHidden()
                //                    }
                //                }
                
                ForEach($scoreboard.players) { $player in
                    GridRow {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Name", text: $player.name)
                        }
                        Text("\(player.score)")
                        Stepper("\(player.score)", value: $player.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {
                scoreboard.players.append(Player(name: "", score: 0))
            }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack {
                Spacer()
                
                switch scoreboard.state {
                case .setup:
                    Button("Start Game", systemImage: "play.fill") {
                        scoreboard.state = .playing
                        scoreboard.resetScores(to: startingPoint)
                    }
                case .playing:
                    Button("End Game", systemImage: "stop.fill") {
                        scoreboard.state = .gameOver
                    }
                case .gameOver:
                    Button("Reset Game", systemImage: "arrow.counterclockwise") {
                        scoreboard.state = .setup
                    }
                    // MARK: - Education Note: Since all cases of GameState are used, default become redundant - Can be deleted. Kept to show as an axample for this note.
                    //            default:
                    //                EmptyView()
                }
                Spacer()
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
