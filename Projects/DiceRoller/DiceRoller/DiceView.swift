//
//  DiceView.swift
//  DiceRoller
//
//  Created by Christopher Wilshusen on 11/18/25.
//

import SwiftUI

struct DiceView: View {
    @State var numberOfPips: Int = 1
   
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundStyle(.black, .white)
                .padding(.bottom, 20)
                .aspectRatio(1, contentMode: .fit)
            

                Button("Roll") {
                    withAnimation {
                        numberOfPips = Int.random(in: 1...6)
                    }
                }
                .buttonStyle(.bordered)
            }
        }
    }


#Preview {
    DiceView()
}

