//
//  LearningItemModel.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import Foundation
import SwiftData

@Model
class LearningItemModel {
    var pathway: String       // e.g. "Swift Pathway"
    var title: String         // e.g. "The Basics"
    var isComplete: Bool      // whether you've finished it
    var order: Int
    
    init(pathway: String,
         title: String,
         isComplete: Bool = false,
         order: Int) {
        self.pathway = pathway
        self.title = title
        self.isComplete = isComplete
        self.order = order
    }
}
