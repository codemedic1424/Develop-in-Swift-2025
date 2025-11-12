//
//  ContentView.swift
//  Lab_3_HabitTracker
//
//  Created by Christopher Wilshusen on 11/11/25.
//

import SwiftUI

struct ContentView: View {
    @State var habits = [
        Habit(name: "Reading", category: "Liesure"),
        Habit(name: "Walking", category: "Fitness"),
        Habit(name: "Gym", category: "Fitness"),
        Habit(name: "Laundry", category: "Chore"),
        Habit(name: "TV", category: "Liesure")
    ]
    
    var body: some View {
       
        NavigationStack {
            List($habits) { $habit in
                //ForEach(habit)
                HStack {
                    Text(habit.categoryEmoji)
                    Text(habit.name)
                    Spacer()
                    VStack{
                        Text("Streak Count")
                        Text(String(habit.streak))
                    }
                    
                    VStack {
                        Toggle(isOn: $habit.isComplete) {
                            Text("Complete")
                        }
                        .onChange(of: habit.isComplete) { _ in
                            habit.ToggleComplete()
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
