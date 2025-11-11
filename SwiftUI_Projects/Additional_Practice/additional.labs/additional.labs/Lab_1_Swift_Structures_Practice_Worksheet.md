# 🧱 Swift Practice Worksheet  
### *Structures · Computed Properties · Data Models*  

#### 📘 Overview  
This worksheet builds the foundation for data models before moving into MVVM.  
You’ll practice defining `struct`s, adding computed properties, methods, and connecting data to SwiftUI views.  

---

## 🥇 Part 1 — Defining a Structure  
**Goal:** Build a simple model for quotes.

✅ **Tasks:**  
- [ ] Create a new file `Quote.swift`  
- [ ] Define your first structure:
  ```swift
  struct Quote {
      var text: String
      var author: String
  }
  ```
- [ ] Create 3–4 example quotes and print them in a Playground or `ContentView`:
  ```swift
  let quotes = [
      Quote(text: "Stay hungry, stay foolish.", author: "Steve Jobs"),
      Quote(text: "Act as if what you do makes a difference. It does.", author: "William James")
  ]
  ```

---

## 🧮 Part 2 — Add a Computed Property  
**Goal:** Learn how computed properties simplify display logic.

✅ **Tasks:**  
- [ ] Inside `Quote`, add:
  ```swift
  var displayText: String {
      "\"\(text)\" — \(author)"
  }
  ```
- [ ] In your preview or console:
  ```swift
  print(quotes[0].displayText)
  ```
🧠 *Computed properties calculate values dynamically rather than storing them.*

---

## 🧩 Part 3 — Add an Identifier and Behavior  
**Goal:** Make your structure ready for SwiftUI Lists and add toggle logic.

✅ **Tasks:**  
- [ ] Update your structure:
  ```swift
  struct Quote: Identifiable {
      let id = UUID()
      var text: String
      var author: String
      var isFavorite: Bool = false

      mutating func toggleFavorite() {
          isFavorite.toggle()
      }
  }
  ```
- [ ] Try calling:
  ```swift
  var sample = Quote(text: "Courage is grace under pressure.", author: "Ernest Hemingway")
  sample.toggleFavorite()
  print(sample.isFavorite)
  ```

---

## 🧱 Part 4 — Use Structure Data in SwiftUI  
**Goal:** Display your quotes in a simple list view.

✅ **Tasks:**  
- [ ] Create a new SwiftUI view `QuoteListView.swift`:
  ```swift
  struct QuoteListView: View {
      @State private var quotes = [
          Quote(text: "Stay hungry, stay foolish.", author: "Steve Jobs"),
          Quote(text: "The best way out is always through.", author: "Robert Frost")
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
  ```
- [ ] Run the preview and tap the hearts — they should toggle live.  

🧠 *This links your structure (`Quote`) directly to the UI using bindings.*

---

## 🎯 Part 5 — Extend Your Model  
**Goal:** Explore how data models can evolve to support app features.

✅ **Tasks:**  
- [ ] Add a category property:
  ```swift
  var category: String
  ```
- [ ] Add a computed property:
  ```swift
  var categoryEmoji: String {
      switch category {
      case "Motivation": return "💪"
      case "Focus": return "🎯"
      default: return "🪶"
      }
  }
  ```
- [ ] Show this emoji next to each quote in your list.

---

## 🧠 Bonus Challenge  
Make a `User` structure that holds an array of favorite `Quote` IDs.

```swift
struct User {
    var name: String
    var favoriteQuoteIDs: [UUID]
}
```
Simulate a user saving and viewing their favorite quotes.  

---

## ✅ Wrap-Up  
By the end of this worksheet, you’ll understand:
- How to model data with `struct`
- The purpose of computed properties and methods
- How SwiftUI reacts to `@State` changes in your models
