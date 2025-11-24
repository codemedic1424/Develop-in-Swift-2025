# 📘 Topic: Swift Enumerations

### 🗓 Date  
2025-11-24

## 1. Summary  
Swift enumerations (enums) define a common type for a group of related values and let you work with those values in a type-safe way.

## 2. Core Ideas  
- Enums group related cases into a single type.  
- Cases can store associated values.  
- Enums can have raw values (strings, ints, etc.).  
- Enums can include methods and computed properties.  
- Enums are value types.  

## 3. Key Terms  
**Enumeration (Enum):** A type that groups related values.  
**Case:** A distinct value inside an enum.  
**Associated Value:** Extra data attached to a case.  
**Raw Value:** A predefined value for cases (Int, String, etc.).  

## 4. Concepts Explained in Plain English  
- Enums describe a closed set of possible values. They prevent invalid states, enforce safety, and eliminate magic strings.  
- Associated values allow each case to store custom information.  
- Raw values allow enums to map to external data (API codes, strings, etc.).  
- Enums can behave like mini-types with methods and computed properties.  

## 5. When to Use This  
- When a value should only be one of a fixed set of possibilities.  
- When modeling states: loading, success, failure.  
- When avoiding booleans that lack context.  
- When API data is best represented as symbolic names instead of numbers/strings.  

## 6. Visual Mental Model  
- Think of enums as labeled boxes. Only one box may be chosen at a time, and some boxes can hold extra details.  

## 7. Related Swift Topics  
- Structs  
- Pattern Matching  
- Switch Statements  
- Optionals (which are enums!)  

## 8. Common Mistakes / Gotchas  
- Forgetting that associated values belong to the case instance, not the type.  
- Confusing raw values with associated values.  
- Using strings or ints instead of enums, causing fragile code.  
- Adding raw values when not necessary.  

## 9. My Practice / Hands-On Work  
- Create enums with simple cases, associated values, raw values, and methods.  

## 10. Questions I Still Have  
- When should I choose raw values vs. associated values?  
- How complex should an enum become before a struct/class is better?  

## 12. Extra Examples  
### Simple Enum Example  
```swift
enum Direction {
    case north, south, east, west
}

var heading = Direction.north
heading = .west
```

### Enum with Associated Values  
```swift
enum LoginState {
    case success(userID: Int)
    case failure(message: String)
}

let result = LoginState.failure(message: "Invalid password")
```

### Enum with Raw Values  
```swift
enum HTTPStatus: Int {
    case ok = 200
    case notFound = 404
    case serverError = 500
}

let status = HTTPStatus(rawValue: 404)
```

---

## 13. Decision Tree: When to Use Enums  
```text
              ┌──────────────┐
              │  Do you have  │
              │  a fixed set   │
              │  of values?    │
              └───────┬────────┘
                      │ Yes
                      ▼
             ┌──────────────────┐
             │ Use an Enum      │
             │ (safe + typed)   │
             └──────────────────┘
                      │ No
                      ▼
          ┌────────────────────────┐
          │ Do cases need stored   │
          │ data?                  │
          └───────────┬────────────┘
                      │ Yes
                      ▼
             ┌──────────────────┐
             │ Enum w/ Associated│
             │ Values            │
             └──────────────────┘
```

---

## 14. SwiftUI-Specific Recommendations  
- Prefer **enums** for view states:  
  - `.loading`, `.loaded(data)`, `.error(message)`  
- Use enums to simplify conditional UI rendering.  
- Avoid using raw strings for identifiers—enums prevent typos and unify logic.  
- Combine enums with `@State` or `@Observable` data models for clear state management.

## 11. References  
- https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations/
