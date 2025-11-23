//
//  ContentView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import UIKit
import SwiftData

struct ContentView: View {
    // Fetch all items once, sorted by order
    @Query(sort: \LearningItemModel.order)
    private var allItems: [LearningItemModel]

    // Per-pathway slices computed in memory
    private var swiftItems: [LearningItemModel] {
        allItems.filter { $0.pathway == .swift }
    }

    private var swiftUIItems: [LearningItemModel] {
        allItems.filter { $0.pathway == .swiftUI }
    }

    private var disItems: [LearningItemModel] {
        allItems.filter { $0.pathway == .developInSwift }
    }

    private var practiceLabs: [LearningItemModel] {
        allItems.filter { $0.pathway == .practiceLabs }
    }
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    // MARK: - Swift Pathway Progress
    private var swiftCompleted: Int {
        swiftItems.filter { $0.isComplete }.count
    }
    
    private var swiftTotal: Int {
        swiftItems.count
    }
    
    private var swiftProgress: Double {
        guard swiftTotal > 0 else { return 0 }
        return Double(swiftCompleted) / Double(swiftTotal)
    }
    
    // MARK: - SwiftUI Pathway Progress
    private var swiftUICompleted: Int {
        swiftUIItems.filter { $0.isComplete }.count
    }
    
    private var swiftUITotal: Int {
        swiftUIItems.count
    }
    
    private var swiftUIProgress: Double {
        guard swiftUITotal > 0 else { return 0 }
        return Double(swiftUICompleted) / Double(swiftUITotal)
    }
    
    // MARK: - DIS Tutorial Progress
    private var disCompleted: Int {
        disItems.filter { $0.isComplete }.count
    }
    
    private var disTotal: Int {
        disItems.count
    }
    
    private var disProgress: Double {
        guard disTotal > 0 else { return 0 }
        return Double(disCompleted) / Double(disTotal)
    }
    
    // MARK: - Practice Labs Progress
    private var practiceCompleted: Int {
        practiceLabs.filter { $0.isComplete }.count
    }
    
    private var practiceTotal: Int {
        practiceLabs.count
    }
    
    private var practiceProgress: Double {
        guard practiceTotal > 0 else { return 0 }
        return Double(practiceCompleted) / Double(practiceTotal)
    }
    
    // MARK: - Global Progress
    private var globalCompleted: Int {
        swiftCompleted + swiftUICompleted + disCompleted + practiceCompleted
    }
    
    private var globalTotal: Int {
        swiftTotal + swiftUITotal + disTotal + practiceTotal
    }
    
    private var globalProgress: Double {
        guard globalTotal > 0 else { return 0 }
        return Double(globalCompleted) / Double(globalTotal)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Overall Progress")
                        .font(.title2)
                        .bold()
                    Text("\(globalCompleted) of \(globalTotal) items completed")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    ProgressView(value: globalProgress)
                }
                .padding([.horizontal, .top])
                
                LazyVGrid(columns: columns) {
                    
                    
                    NavigationLink {
                        SwiftPathwayView()
                    } label: {
                        PathwayCard(title: "Swift Pathway", subtitle: "Learn the foundations of Swift", completed: swiftCompleted, total: swiftTotal, progress: swiftProgress, iconName: "swift")
                            .frame(height: 210)
                    }
                    
                    NavigationLink {
                        SwiftUIPathwayView()
                    } label: {
                        PathwayCard(title: "SwiftUI Pathway", subtitle: "See the power of SwiftUI", completed: swiftUICompleted, total: swiftUITotal, progress: swiftUIProgress, iconName: "square.grid.2x2")
                            .frame(height: 210)
                    }
                    
                    NavigationLink {
                        DISTutorialView()
                    } label: {
                        PathwayCard(title: "DIS Tutorial", subtitle: "Now, put into real code", completed: disCompleted, total: disTotal, progress: disProgress, iconName: "book.fill")
                            .frame(height: 210)
                    }
                    
                    NavigationLink {
                        PracticeLabsView()
                    } label: {
                        PathwayCard(title: "Practice Labs", subtitle: "Swift Practice Projects", completed: practiceCompleted, total: practiceTotal, progress: practiceProgress, iconName: "hammer.fill")
                            .frame(height: 210)
                    }
                }
                .padding()
                .foregroundStyle(.primary)
                .buttonStyle(ScaledCardButtonStyle())
            }
            .navigationTitle("Learning Dashboard")
        }
    }
    struct ScaledCardButtonStyle: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
                .animation(.spring(response: 0.25, dampingFraction: 0.7), value: configuration.isPressed)
                .onChange(of: configuration.isPressed) { oldValue, newValue in
                    if oldValue == true && newValue == false {
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: LearningItemModel.self, inMemory: true)
}
