//
//  DISTutorial.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct DISTutorialView: View {
    @EnvironmentObject var dashboard: LearningDashboardModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            // Bind directly to the DIS array so toggles stay in sync
            ForEach($dashboard.disPathwayItems) { $item in
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.chapterTitle)
                            .font(.headline)
                        
                        Text(item.pathwayTitle)
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
                ProgressBarView(title: "DIS Tutorials Progess", percent: dashboard.disCompletionPercent, completed: dashboard.disCompletedCount, total: dashboard.disTotalCount)
            }
        }
    }
}

#Preview {
    NavigationStack {
        DISTutorialView()
            .environmentObject(LearningDashboardModel())
    }
}
