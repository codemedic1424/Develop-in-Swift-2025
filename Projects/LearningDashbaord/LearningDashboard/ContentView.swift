//
//  ContentView.swift
//  LearningDashbaord
//
//  Created by Christopher Wilshusen on 11/20/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var dashboard: LearningDashboardModel
    @Environment(\.modelContext) private var modelContext
    
    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    // MARK: - Swift Pathway Progress
    private var swiftCompleted: Int {
        dashboard.swiftPathwayItems.filter { $0.isComplete }.count
    }
    
    private var swiftTotal: Int {
        dashboard.swiftPathwayItems.count
    }
    
    private var swiftProgress: Double {
        guard swiftTotal > 0 else { return 0 }
        return Double(swiftCompleted) / Double(swiftTotal)
    }
    
    // MARK: - SwiftUI Pathway Progress
    private var swiftUICompleted: Int {
        dashboard.swiftUIPathwayItems.filter { $0.isComplete }.count
    }
    
    private var swiftUITotal: Int {
        dashboard.swiftUIPathwayItems.count
    }
    
    private var swiftUIProgress: Double {
        guard swiftUITotal > 0 else { return 0 }
        return Double(swiftUICompleted) / Double(swiftUITotal)
    }
    
    // MARK: - DIS Tutorial Progress
    private var disCompleted: Int {
        dashboard.disPathwayItems.filter { $0.isComplete }.count
    }
    
    private var disTotal: Int {
        dashboard.disPathwayItems.count
    }
    
    private var disProgress: Double {
        guard disTotal > 0 else { return 0 }
        return Double(disCompleted) / Double(disTotal)
    }
    
    // MARK: - Practice Labs Progress
    private var practiceCompleted: Int {
        dashboard.practiceLabItems.filter { $0.isComplete }.count
    }
    
    private var practiceTotal: Int {
        dashboard.practiceLabItems.count
    }
    
    private var practiceProgress: Double {
        guard practiceTotal > 0 else { return 0 }
        return Double(practiceCompleted) / Double(practiceTotal)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
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
        .environmentObject(LearningDashboardModel())
}
