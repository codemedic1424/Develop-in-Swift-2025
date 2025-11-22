//
//  DISTutorial.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct DISTutorialView: View {
    @Environment(\.modelContext) private var context
    @Query(
        filter: #Predicate<LearningItemModel> { item in
            item.pathway == "dis"
        },
        sort: \.order
    )
    private var disItems: [LearningItemModel]
    
    // MARK: - Derived progress values
    private var completedCount: Int {
        disItems.filter { $0.isComplete }.count
    }

    private var totalCount: Int {
        disItems.count
    }

    private var completionPercent: Double {
        guard totalCount > 0 else { return 0 }
        return Double(completedCount) / Double(totalCount)
    }
    
    //MARK: - Seeding
    
    private func seedDevelopInSwiftIfNeeded() {
        // Only seed if nothing exists yet for this pathway
        guard disItems.isEmpty else { return }

        let disTitles = [
            "Welcome to Develop in Swift",
            "App Design: Discovery",
            "App Design: Prototypes",
            "App Design: Testing and Validation",
            "App Design: Iteration",
            "SwiftUI: Explore Xcode",
            "SwiftUI: Views, structures, and properties",
            "SwiftUI: Layout and style",
            "SwiftUI: Buttons and state",
            "SwiftUI: Lists and text fields",
            "Data modeling: Custom types and Swift Testing",
            "Data modeling: Models and persistence",
            "Data modeling: Navigation, editing, and relationships",
            "Data modeling: Observation and shareable data models",
            "AppDev: Views and data storage",
            "AppDev: User experience features",
            "AppDev: App refinement",
            "Machine Learning: Natural language",
            "Machine Learning: Recognize text in images",
            "Machine Learning: Model training with CreateML",
            "Machine Learning: Custom models with CoreML",
            "Spatial computing: Windows in visionOS",
            "Spatial computing: Ornaments and multiple windows",
            "Spatial computing: Volumes in visionOS",
            "App distro: Preparation for distribution",
            "App distro: Testing and feedback",
            "App distro: Review and distribution"
        ]

        for (index, title) in disTitles.enumerated() {
            let item = LearningItemModel(
                pathway: "dis",
                title: title,
                isComplete: false,
                order: index
            )
            context.insert(item)
        }

        do {
            try context.save()
        } catch {
            print("Failed to seed Develop in Swift items:", error)
        }
    }
    
    var body: some View {
        List {
            ForEach(disItems) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        
                        Text("DIS Tutorials")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Button {
                        item.isComplete.toggle()
                        
                        do {
                            try context.save()
                        } catch {
                            print("Failed to save update:", error)
                        }
                    } label: {
                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                            .imageScale(.large)
                    }
                }
                .padding(.vertical, 4)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        item.isComplete = true
                        do { try context.save() } catch { print("Save error:", error) }
                    } label: {
                        Label("Complete", systemImage: "checkmark.circle")
                    }
                    .tint(.green)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        item.isComplete = false
                        do { try context.save() } catch { print("Save error:", error) }
                    } label: {
                        Label("Reset", systemImage: "arrow.uturn.backward")
                    }
                    .tint(.orange)
                }
            }
        }
        .navigationTitle("DIS Tutorials")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProgressBarView(
                    title: "DIS Tutorials Progress",
                    percent: completionPercent,
                    completed: completedCount,
                    total: totalCount)
            }
        }
        .onAppear {
            seedDevelopInSwiftIfNeeded()
        }
    }
}

#Preview {
    NavigationStack {
        DISTutorialView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}
