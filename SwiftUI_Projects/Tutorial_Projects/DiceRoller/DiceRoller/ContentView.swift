//
//  ContentView.swift
//  DiceRoller
//
//  Created by Christopher Wilshusen on 11/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfDice: Int = 1
    
    var body: some View {
        VStack {
            Text ("Dice Roller")
                .font(.largeTitle.lowercaseSmallCaps())
                .foregroundStyle(.white)
            
            HStack {
                ForEach(1...numberOfDice, id: \.description) { _ in
                                   DiceView()
                               }
            }
            
            HStack{
                Text("Number of Dice:")
                    .foregroundStyle(.white)
                    .font(.headline.lowercaseSmallCaps())
                    .padding(.trailing, 20)

                Button("Remove Dice", systemImage: "minus.circle.fill") {
                    withAnimation {
                        numberOfDice -= 1
                    }
                }
                .disabled(numberOfDice == 1)
                
                Button("Add Dice", systemImage: "plus.circle.fill") {
                    withAnimation {
                        numberOfDice += 1
                    }
                }
                .disabled(numberOfDice == 5)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
            
            //TODO: Add Reset Button Functionality
            Button("Reset") {
                //numberOfPips = 1
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}

