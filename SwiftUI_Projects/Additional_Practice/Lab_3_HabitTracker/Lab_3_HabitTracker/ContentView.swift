//
//  ContentView.swift
//  Lab_3_HabitTracker
//
//  Created by Christopher Wilshusen on 11/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var habits = [
        Habit(name: "Reading", category: "Leisure"),
        Habit(name: "Walking", category: "Fitness"),
        Habit(name: "Gym", category: "Fitness"),
        Habit(name: "Laundry", category: "Chore"),
        Habit(name: "TV", category: "Leisure")
    ]
    
    var body: some View {
       
        NavigationStack {
            List {
                ForEach(habits.indices, id: \.self) { index in
                    HStack {
                        Text(habits[index].categoryEmoji)
                        Text(habits[index].name)
                        Spacer()
                        
                        VStack {
                            Text("Streak Count:")
                            Text(String(habits[index].streak))
                        }
                        Spacer()
                        VStack {
                            Button {
                                habits[index].toggleComplete()
                            } label: {
                                Text(habits[index].isComplete ? "Completed" : "Mark Complete")
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
