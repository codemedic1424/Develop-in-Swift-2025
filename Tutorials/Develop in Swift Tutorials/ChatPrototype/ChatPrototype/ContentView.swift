//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Christopher Wilshusen on 12/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 25) {
            Text("Knock, knock!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 12)).shadow(radius: 6)
            
            Text("Who's there?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 6)
            
            Text("Dozen.")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 6)
            
            Text("Dozen who?")
                .padding()
                .background(Color.teal, in: RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 6)
            
            Text("Dozen matter, let me in!")
                .padding()
                .background(Color.yellow, in: RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 6)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
