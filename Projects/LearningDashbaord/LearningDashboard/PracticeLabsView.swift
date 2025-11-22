//
//  PracticeLabsView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct PracticeLabsView: View {
    @Environment(\.modelContext) private var context
    @Query(
        filter: #Predicate<LearningItemModel> { item in
            item.pathway == "practice"
        },
        sort: \.order
    )
    private var practiceLabs: [LearningItemModel]
    
    // MARK: - Derived progress values
    private var completedCount: Int {
        practiceLabs.filter { $0.isComplete }.count
    }
    
    private var totalCount: Int {
        practiceLabs.count
    }
    
    private var completionPercent: Double {
        guard totalCount > 0 else { return 0 }
        return Double(completedCount) / Double(totalCount)
    }
    
    // MARK: - Seeding
    
    private func seedPracticeLabsIfNeeded() {
        // Only seed if nothing exists yet for this pathway
        guard practiceLabs.isEmpty else { return }
        
        let practiceTitles = [
            "Lab 1: Swift Structures",
            "Lab 2: Bindings in SwiftUI",
            "Lab 3: Habit Tracker (Structs + Bindings)",
            "Lab 4: Combined Concepts – Meal Planner",
            "Lab 5: Computed Properties in Swift Structures",
            "Lab 6: Computed Properties in SwiftUI",
            "Lab 7: Practical Models with Computed Properties"
        ]
        
        for (index, title) in practiceTitles.enumerated() {
            let item = LearningItemModel(
                pathway: "practice",
                title: title,
                isComplete: false,
                order: index
            )
            context.insert(item)
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to seed Practice Labs items:", error)
        }
    }
    
    var body: some View {
        List {
            // Bind directly to the Practice Labs array so toggles stay in sync
            ForEach(practiceLabs) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        
                        Text("Practice Labs")
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
        .navigationTitle("Practice Labs")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProgressBarView(
                    title: "Practice Labs Progress",
                    percent: completionPercent,
                    completed: completedCount,
                    total: totalCount)
            }
        }
        .onAppear {
            seedPracticeLabsIfNeeded()
        }
    }
}


#Preview {
    NavigationStack {
        PracticeLabsView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}

