//
//  LearningDashboardModel.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/21/25.
//

import SwiftUI
import Foundation

class LearningDashboardModel: ObservableObject {
    
    @Published var swiftPathwayItems: [LearningItem]
    @Published var swiftUIPathwayItems: [LearningItem]
    @Published var disPathwayItems: [LearningItem]
    @Published var practiceLabItems: [LearningItem]
    
    init() {
        self.swiftPathwayItems = swiftItems
        self.swiftUIPathwayItems = swiftUIItems
        self.disPathwayItems = disItems
        self.practiceLabItems = practiceLabs
    }
}
