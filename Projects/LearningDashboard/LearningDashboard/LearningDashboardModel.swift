//
//  LearningDashboardModel.swift
//  LearningDashboard
//
//  Created by Christopher Wilshusen on 11/21/25.
//

import SwiftUI
import Foundation
import Combine

class LearningDashboardModel: ObservableObject {
    
    @Published var swiftPathwayItems: [LearningItem]
    @Published var swiftUIPathwayItems: [LearningItem]
    @Published var disPathwayItems: [LearningItem]
    @Published var practiceLabItems: [LearningItem]
    
    // MARK: - DIS Tutorial Progress
    var disCompletedCount: Int {
        disPathwayItems.filter { $0.isComplete }.count
    }

    var disTotalCount: Int {
        disPathwayItems.count
    }

    var disCompletionPercent: Double {
        guard disTotalCount > 0 else { return 0 }
        return Double(disCompletedCount) / Double(disTotalCount)
    }
    
    // MARK: - Swift Pathway Progress
    var swiftCompletedCount: Int {
        swiftPathwayItems.filter { $0.isComplete }.count
    }

    var swiftTotalCount: Int {
        swiftPathwayItems.count
    }

    var swiftCompletionPercent: Double {
        guard swiftTotalCount > 0 else { return 0 }
        return Double(swiftCompletedCount) / Double(swiftTotalCount)
    }

    // MARK: - SwiftUI Pathway Progress
    var swiftUICompletedCount: Int {
        swiftUIPathwayItems.filter { $0.isComplete }.count
    }

    var swiftUITotalCount: Int {
        swiftUIPathwayItems.count
    }

    var swiftUICompletionPercent: Double {
        guard swiftUITotalCount > 0 else { return 0 }
        return Double(swiftUICompletedCount) / Double(swiftUITotalCount)
    }

    // MARK: - Practice Labs Progress
    var practiceCompletedCount: Int {
        practiceLabItems.filter { $0.isComplete }.count
    }

    var practiceTotalCount: Int {
        practiceLabItems.count
    }

    var practiceCompletionPercent: Double {
        guard practiceTotalCount > 0 else { return 0 }
        return Double(practiceCompletedCount) / Double(practiceTotalCount)
    }
    
    init() {
        self.swiftPathwayItems = swiftItems
        self.swiftUIPathwayItems = swiftUIItems
        self.disPathwayItems = disItems
        self.practiceLabItems = practiceLabs
    }
}
