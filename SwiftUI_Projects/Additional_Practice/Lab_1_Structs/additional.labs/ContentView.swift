//
//  ContentView.swift
//  additional.labs
//
//  Created by Christopher Wilshusen on 11/10/25.
//

import SwiftUI

//MARK: Quote Creation
struct Quote: Identifiable {
    let id = UUID()
    var text: String
    var author: String
    var isFavorite: Bool = false
    var category: String
    var categoryEmoji: String {
        switch category {
        case "Motivation": return "💪"
        case "Focus": return "🎯"
        default: return "🪶"
        }
    }

    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
}

//MARK: Quote list creation
struct QuoteListView: View {
    @State private var quotes = [
        Quote(text: "Stay hungry, stay foolish", author: "Steve Jobs", category: "Motivation"),
        Quote(text: "The best way out is always through.", author: "Robert Frost", category: ""),
        Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs", category: "Focus"),
        Quote(text: "No one is you, and that is your superpower.", author: "Dave Grohl", category: "Motivation"),
        Quote(text: "The only journey is the journey within.", author: "Rainer Maria Rilke", category: "Focus")
    ]
    
    @State private var user = User(name: "Chris", favoriteQuoteIDs: [])

    var body: some View {
            NavigationStack {
                List($quotes) { $quote in
                    HStack {
                        Text(quote.categoryEmoji)
                        VStack(alignment: .leading) {
                            Text(quote.text)
                            Text("- \(quote.author)")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        Button {
                            if let index = user.favoriteQuoteIDs.firstIndex(of: quote.id) {
                                user.favoriteQuoteIDs.remove(at: index)
                            } else {
                                user.favoriteQuoteIDs.append(quote.id)
                            }
                            print(user.favoriteQuoteIDs)
                        } label: {
                            Image(systemName: user.favoriteQuoteIDs.contains(quote.id) ? "heart.fill" : "heart")
                                .foregroundStyle(user.favoriteQuoteIDs.contains(quote.id) ? .red : .primary)
                        }
                    }
                }
                .navigationTitle("Amazing Quotes")
                .navigationBarTitleDisplayMode(.large) // use .inline if you prefer compact
            }
        }
    }

//MARK: User Creation
struct User {
    var name: String
    var favoriteQuoteIDs: [UUID]
}



#Preview {
    QuoteListView()
}
