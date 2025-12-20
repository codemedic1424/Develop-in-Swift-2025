//
//  ContentView.swift
//  DiceRoller
//
//  Created by Christopher Wilshusen on 12/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 2
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps().bold())
                .foregroundStyle(.white)
            Spacer()
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                    DiceView()
                }
                
            }
            
            HStack {
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .font(.title)
                .buttonStyle(.glass)
                .disabled(numberOfDice == 5)
                .labelStyle(.iconOnly)
                
                Button("Reset", systemImage: "gobackward") {
                    numberOfDice = 1
                }
                .buttonStyle(.glass)
                .font(.title2)
                .tint(.red)
                
                
                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .font(.title)
                .buttonStyle(.glass)
                .disabled(numberOfDice == 1)
                .labelStyle(.iconOnly)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.primary)
        
    }
}

#Preview {
    ContentView()
}
