//
//  LearningItemModel.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/20/25.
//

//MARK: Notes:     •    item.pathway stores a short key: "swift", "swiftui", "dis", "labs"

import Foundation
import SwiftData

//MARK: - Pathway Enum

enum Pathway: String, Codable, CaseIterable, Identifiable {
    case swift
    case swiftUI
    case developInSwift
    case practiceLabs

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .swift:
            return "Swift Pathway"
        case .swiftUI:
            return "SwiftUI Pathway"
        case .developInSwift:
            return "Develop in Swift"
        case .practiceLabs:
            return "Practice Labs"
        }
    }
}

@Model
class LearningItemModel {
    var pathway: Pathway      // Use the enum instead of String
    var title: String         // e.g. "The Basics"
    var isComplete: Bool      // whether you've finished it
    var order: Int
    
    init(pathway: Pathway,
         title: String,
         isComplete: Bool = false,
         order: Int) {

        self.pathway = pathway
        self.title = title
        self.isComplete = isComplete
        self.order = order
    }
}
