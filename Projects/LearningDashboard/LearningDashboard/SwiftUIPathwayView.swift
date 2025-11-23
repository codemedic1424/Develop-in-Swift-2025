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
    
    //MARK: - Add Lesson Variables
    
    @State private var isPresentingAddLessonSheet: Bool = false
    @State private var newLessonTitle: String = ""
    
    // MARK: - Add new SwiftUI lesson
    private func addSwiftUILesson() {
        // Trim whitespace so we don't create blank titles
        let trimmedTitle = newLessonTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        // Find the next order value so the lesson appears at the bottom
        let nextOrder = (swiftUIItems.map(\.order).max() ?? -1) + 1
        
        let item = LearningItemModel(
            pathway: "swiftui",
            title: trimmedTitle,
            isComplete: false,
            order: nextOrder
        )
        
        context.insert(item)
        
        do {
            try context.save()
            newLessonTitle = ""
        } catch {
            print("Error adding Swift lesson:", error)
        }
    }
    
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
        .onAppear {
            seedSwiftUIPathwayIfNeeded()
        }
        //MARK: - Add Button
        .toolbar {
            // Top-right plus button
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    newLessonTitle = ""
                    isPresentingAddLessonSheet = true
                } label: {
                    Label("Add lesson", systemImage: "plus")
                }
            }
            //MARK: - Progress Bar (Bottom)
            ToolbarItem(placement: .bottomBar) {
                ProgressBarView(
                    title: "SwiftUI Pathway Progress",
                    percent: completionPercent,
                    completed: completedCount,
                    total: totalCount
                )
            }
        }
        //MARK: - Lesson Sheet
        .sheet(isPresented: $isPresentingAddLessonSheet) {
            NavigationStack {
                Form {
                    Section("New SwiftUI Lesson") {
                        TextField("Lesson title", text: $newLessonTitle)
                            .textInputAutocapitalization(.words)
                    }
                }
                .navigationTitle("Add lesson")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            newLessonTitle = ""
                            isPresentingAddLessonSheet = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            addSwiftUILesson()
                            isPresentingAddLessonSheet = false
                        }
                        .disabled(newLessonTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SwiftUIPathwayView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}
