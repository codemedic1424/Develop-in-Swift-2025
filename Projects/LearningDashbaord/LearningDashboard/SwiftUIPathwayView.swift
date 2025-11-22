//
//  SwiftUIPathwayView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct SwiftUIPathwayView: View {
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate<LearningItemModel> { item in
        item.pathway == "swiftui"
    }, sort: \.order)
    private var swiftUIItems: [LearningItemModel]
    
    //MARK: - Progress Bar Variables
    private var completedCount: Int {
        swiftUIItems.filter { $0.isComplete }.count
    }
    
    private var totalCount: Int {
        swiftUIItems.count
    }
    
    private var completionPercent: Double {
        guard totalCount > 0 else { return 0 }
        return Double(completedCount) / Double(totalCount)
    }
    
    // MARK: - Seeding
    
    private func seedSwiftUIPathwayIfNeeded() {
        // Only seed if nothing exists yet
        guard swiftUIItems.isEmpty else { return }
        
        let swiftUItitles = [
            "Video: SwiftUI Essentials",
            "Customize views with properties",
            "Picking container views for your content",
            "Laying out views",
            "Video: SwiftUI cookbook for navigation",
            "Dive into data"
        ]

        for (index, title) in swiftUItitles.enumerated() {
            let item = LearningItemModel(
                pathway: "swiftui",
                title: title,
                isComplete: false,
                order: index      // <–– assign order here
            )
            context.insert(item)
        }
        
        do {
            try context.save()
        } catch {
            print("Failed to seed SwiftUI pathway:", error)
        }
    }
    
    var body: some View {
        List {
            ForEach(swiftUIItems) { item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.title)
                            .font(.headline)
                        
                        Text("SwiftUI Pathway")
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
        .navigationTitle("SwiftUI Pathway")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProgressBarView(
                    title: "SwiftUI Pathway Progress",
                    percent: completionPercent,
                    completed: completedCount,
                    total: totalCount)
            }
        }
        .onAppear {
            seedSwiftUIPathwayIfNeeded()
        }
    }
}

#Preview {
    NavigationStack {
        SwiftUIPathwayView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}
