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
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Video: A Swift Tour"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "The Basics"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Type Safety and Type Inference"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Collection Types"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Control flow"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Functions"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Value and reference types"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Structures and classes"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Choosing between structures and classes"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Enumerations"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Swift Testing"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "SwiftData"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Protocols"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Generics"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Concurrency"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Macros"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Embedded Swift"),
    LearningItem(pathwayTitle: "Swift Pathway", chapterTitle: "Run Swift on Server"),
]

let swiftUIItems = [
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Video: SwiftUI Essentials"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Customize views with properties"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Picking container views for your content"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Laying out views"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Video: SwiftUI cookbook for navigation"),
    LearningItem(pathwayTitle: "SwiftUI Pathway", chapterTitle: "Dive into data")
]

let disItems = [
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Welcome to Develop in Swift"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App Design: Discovery"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App Design: Prototypes"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App Design:Testing and Validation"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App Design: Iteration"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "SwiftUI: Explore Xcode"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "SwiftUI: Views, structures, and properties"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "SwiftUI: Layout and style"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "SwiftUI: Buttons and state"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "SwiftUI: Lists and text fields"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Data modeling: Custom types and Swift Testing"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Data modeling: Models and persistence"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Data modeling: Navigation, editing, and relationships"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Data modeling: Observation and shareable data models"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "AppDev: Views and data storage"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "AppDev: User experience features"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "AppDev: App refinement"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Machine Learning: Natural language"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Machine Learning: Recognize text in images"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Machine Learning: Model training with CreateML"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Machine Learning: Custom models with CoreML"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Spatial computing: Windows in visionOS"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Spatial computing: Ornaments and multiple windows"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "Spatial computing: Volumes in visionOS"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App distro: Preparation for distribution"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App distro: Testing and feedback"),
    LearningItem(pathwayTitle: "Develop in Swift Tutorial", chapterTitle: "App distro: Review and distribution")
]

let practiceLabs = [
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "Dice Roller"),
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "Score Keeper"),
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "About Me"),
    LearningItem(pathwayTitle: "Practice Labs", chapterTitle: "Onboarding Flow"),
]
