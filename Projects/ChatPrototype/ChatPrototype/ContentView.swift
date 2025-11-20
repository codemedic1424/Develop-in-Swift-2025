//
//  ContentView.swift
//  ChatPrototype
//
//  Created by Christopher Wilshusen on 11/7/25.
//

//TODO: Refactor with a Loop

import SwiftUI

// MARK: View Body

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            ChatSend(message: "Knock, knock!")
            ChatRecieve(message: "Who's there?")
            ChatSend(message: "Olive.")
            ChatRecieve(message: "Olive who?")
            ChatSend(message: "Olive you, and I miss you!")
            ChatRecieve(message: "😂 That was a good one!")
            ChatSend(message: "Thanks! Gotta keep it light!")
        }
        .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 12))
        //.padding()
    }
}

//MARK: View Components

struct ChatSend: View {
    //MARK: View Properties (Computed)
    let message: String
    
    var body: some View {
        VStack {
            Text(message)
                .font(.body)
                .fontWeight(.semibold)
                .padding()
                .background(Color.yellow.opacity(0.8), in: RoundedRectangle(cornerRadius: 8))
                .shadow(color: .yellow, radius: 4)
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct ChatRecieve: View {
    //MARK: View Properties (Computed)
    let message: String
    
    var body : some View {
        Text(message)
            .font(.body)
            .fontWeight(.medium)
            .padding()
            .background(Color.teal.opacity(0.8), in: RoundedRectangle(cornerRadius: 8))
            .shadow(color: .teal, radius: 4)
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
        
}

// MARK: Preview

#Preview {
    ContentView()
}

