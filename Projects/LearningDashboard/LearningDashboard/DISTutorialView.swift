//
//  DISTutorial.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import SwiftData

//MARK: - Seeding Titles
private let disTutorialTitles: [String] = [
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

struct DISTutorialView: View {
    
    init() { }
    
    @Environment(\.modelContext) private var context
    // Grab all LearningItemModel rows from SwiftData
    @Query(
        filter: #Predicate<LearningItemModel> { _ in true },
        sort: \.order
    )
    private var allItems: [LearningItemModel]
    
    // Then filter in-memory to just the Swift pathway
    private var disItems: [LearningItemModel] {
        allItems.filter { $0.pathway == .developInSwift }
    }
    
    //MARK: - Add Lesson Variables
    
    @State private var isPresentingAddLessonSheet: Bool = false
    @State private var newLessonTitle: String = ""
    
    // MARK: - Add new DIS lesson
    private func addDISLesson() {
        // Trim whitespace so we don't create blank titles
        let trimmedTitle = newLessonTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        // Find the next order value so the lesson appears at the bottom
        let nextOrder = (disItems.map(\.order).max() ?? -1) + 1
        
        let item = LearningItemModel(
            pathway: .developInSwift,
            title: trimmedTitle,
            isComplete: false,
            order: nextOrder
        )
        
        context.insert(item)
        saveContext("adding DIS lesson")
        newLessonTitle = ""
    }
    
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
    
    // MARK: - Save helper
    private func saveContext(_ actionDescription: String) {
        do {
            try context.save()
        } catch {
            print("DISTutorialView save error (\(actionDescription)):", error)
        }
    }
    
    //MARK: - Seeding
    
    private func seedDevelopInSwiftIfNeeded() {
        guard disItems.isEmpty else { return }
        
        for (index, title) in disTutorialTitles.enumerated() {
            let item = LearningItemModel(
                pathway: .developInSwift,
                title: title,
                isComplete: false,
                order: index
            )
            context.insert(item)
        }
        
        saveContext("seeding Develop in Swift items")
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
                        saveContext("toggling completion from main button")
                    } label: {
                        Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                            .imageScale(.large)
                    }
                }
                .padding(.vertical, 4)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        item.isComplete = true
                        saveContext("marking DIS lesson complete via swipe")
                    } label: {
                        Label("Complete", systemImage: "checkmark.circle")
                    }
                    .tint(.green)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        item.isComplete = false
                        saveContext("resetting DIS lesson via swipe")
                    } label: {
                        Label("Reset", systemImage: "arrow.uturn.backward")
                    }
                    .tint(.orange)
                }
            }
        }
        .navigationTitle("DIS Tutorials")
        .onAppear {
            seedDevelopInSwiftIfNeeded()
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
                    title: "DIS Pathway Progress",
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
                    Section("New DIS Lesson") {
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
                            addDISLesson()
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
        DISTutorialView()
    }
    .modelContainer(for: LearningItemModel.self, inMemory: true)
}
