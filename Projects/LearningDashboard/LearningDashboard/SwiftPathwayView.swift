//
//  SwiftPathwayView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

struct SwiftPathwayView: View {
    
    init() { }
    
    @Environment(\.modelContext) private var context
    
    // Grab all LearningItemModel rows from SwiftData
    @Query(
        filter: #Predicate<LearningItemModel> { _ in true },
        sort: \.order
    )
    private var allItems: [LearningItemModel]
    
    // Then filter in-memory to just the Swift pathway
    private var swiftItems: [LearningItemModel] {
        allItems.filter { $0.pathway == .swift }
    }
    
    //MARK: - Add Lesson Variables
    
    @State private var isPresentingAddLessonSheet: Bool = false
    @State private var newLessonTitle: String = ""
    
    // MARK: - Add new Swift lesson
    private func addSwiftLesson() {
        // Trim whitespace so we don't create blank titles
        let trimmedTitle = newLessonTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        // Find the next order value so the lesson appears at the bottom
        let nextOrder = (swiftItems.map(\.order).max() ?? -1) + 1
        
        let item = LearningItemModel(
            pathway: .swift,
            title: trimmedTitle,
            isComplete: false,
            order: nextOrder
        )
        
        context.insert(item)
        
        saveContext(context)
        newLessonTitle = ""
    }

    // MARK: - Save helper
    private func saveContext(_ context: ModelContext) {
        do {
            try context.save()
        } catch {
            print("SwiftPathwayView save error:", error)
        }
    }
    
    // MARK: - Derived progress values
    private var completedCount: Int {
        swiftItems.filter { $0.isComplete }.count
    }
    
    private var totalCount: Int {
        swiftItems.count
    }
    
    private var completionPercent: Double {
        guard totalCount > 0 else { return 0 }
        return Double(completedCount) / Double(totalCount)
    }
    
    // MARK: - One-time seeding for Swift Pathway
    private func seedSwiftPathwayIfNeeded() {
        guard swiftItems.isEmpty else { return }
        
        let initialSwiftTitles: [String] = [
            "Video: A Swift Tour",
            "The Basics",
            "Type Safety and Type Inference",
            "Collection Types",
            "Control flow",
            "Functions",
            "Value and reference types",
            "Structures and classes",
            "Choosing between structures and classes",
            "Enumerations",
            "Swift Testing",
            "SwiftData",
            "Protocols",
            "Generics",
            "Concurrency",
            "Macros",
            "Embedded Swift",
            "Run Swift on Server"
        ]
        
        for (index, title) in initialSwiftTitles.enumerated() {
            let item = LearningItemModel(
                pathway: .swift,
                title: title,
                isComplete: false,
                order: index
            )
            context.insert(item)
        }
        
        saveContext(context)
        print("Swift pathway seeded! 🎉")
    }
    
    // MARK: - Status text helper
    private func statusText(for item: LearningItemModel) -> String {
        item.isComplete ? "Complete" : "Not started"
    }

    var body: some View {
        List {
                ForEach(swiftItems) { item in
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.title)
                            Text(statusText(for: item))
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    
                    Button {
                        item.isComplete.toggle()
                        saveContext(context)
                    } label: {
                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                            .imageScale(.large)
                    }
                }
                .padding(.vertical, 4)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        item.isComplete = true
                        saveContext(context)
                    } label: {
                        Label("Complete", systemImage: "checkmark.circle")
                    }
                    .tint(.green)
                }
                
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        item.isComplete = false
                        saveContext(context)
                    } label: {
                        Label("Reset", systemImage: "arrow.uturn.backward")
                    }
                    .tint(.orange)
                }
            }
        }
        .navigationTitle("Swift Pathway")
        .onAppear {
            seedSwiftPathwayIfNeeded()
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
                    title: "Swift Pathway Progress",
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
                    Section("New Swift lesson") {
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
                            addSwiftLesson()
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
        SwiftPathwayView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}
