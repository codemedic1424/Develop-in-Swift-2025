import Cocoa
import SwiftUI
import PlaygroundSupport

struct Quote: Identifiable {
    let id = UUID()
    var text: String
    var author: String
    var isFavorite: Bool = false
    
    mutating func toggleFavorite() {
        isFavorite.toggle()
    }
}

struct QuoteListView: View {
    @State private var quotes = [
        Quote(text: "Stay hungry, stay foolish", author: "Steve Jobs"),
        Quote(text: "The best way out is always thorugh.", author: "Robert Frost")
    ]
    
    var body: some View {
        List($quotes) { $quote in
            HStack {
                VStack(alignment: .leading) {
                    Text(quote.text)
                    Text(quote.author)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Button {
                    quote.isFavorite.toggle()
                } label: {
                    Image(systemName: quote.isFavorite ? "heart.fill" : "heart")
                }
            }
        }
    }
}

#Preview {
    QuoteListView()
}
