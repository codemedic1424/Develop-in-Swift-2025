//
//  SwiftPathwayView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct SwiftPathwayView: View {
    @EnvironmentObject var dashboard: LearningDashboardModel
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            // Bind directly to each LearningItem so toggles update the model
            ForEach($dashboard.swiftPathwayItems) { $item in
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
        .navigationTitle("Swift Pathway")
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                ProgressBarView(title: "Swift Pathway Progress", percent: dashboard.swiftCompletionPercent, completed: dashboard.swiftCompletedCount, total: dashboard.swiftTotalCount)
            }
        }
    }
}

#Preview {
    NavigationStack {
        SwiftPathwayView()
            .environmentObject(LearningDashboardModel())
    }
}
