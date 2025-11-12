//
//  Habit.swift
//  Lab_3_HabitTracker
//
//  Created by Christopher Wilshusen on 11/11/25.
//
import SwiftUI

//MARK: Habit Struct Creation
struct Habit: Identifiable {
    //MARK: stucture variables
    let id = UUID()
    var name: String
    var category: String
    var streak : Int = 0
    var isComplete: Bool = false
    
    var categoryEmoji: String {
        switch category {
        case "Leisure":
            return "🧠"
        case "Fitness":
            return "💪"
        case "Chore":
            return "🧹"
        default: 
            return "❓"
        }
    }
    
    mutating func toggleComplete() {
        isComplete.toggle()
        if isComplete {
            streak += 1
        } else {
            streak = 0
        }
    }
}
