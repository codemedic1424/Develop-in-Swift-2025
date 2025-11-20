//
//  LearningItem.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI

struct LearningItem: Identifiable {
    let id = UUID()
    
    var pathwayTitle: String
    var chapterTitle: String
    var isComplete: Bool = false
}

let swiftItems = [
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Collections"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "The Basics"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Type Safety and Type Inference")
]

let swiftUIItems = [
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Meet SwiftUI"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Customize views with properties"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "About me")
]

let disItems = [
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Welcome to Develop in Swift"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Welcome to App Design"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Explore the app design cycle")
]

let practiceLabs = [
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "DiceRoller"),
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "ScoreKeeper")
]
