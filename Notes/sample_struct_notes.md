# 📘 Topic  
**Structures (`struct`) in Swift**

### 🗓 Date  
2025-11-21

## 1. Summary  
Structures are value-type containers used to group related data. They form the backbone of most Swift data models and are heavily used in SwiftUI for representing items in lists, cards, and screens.

## 2. Core Ideas  
- Structs bundle related properties together.  
- Structs are **value types**, meaning they copy on assignment.  
- You can add methods to structs.  
- SwiftUI prefers structs because they are predictable and lightweight.  

## 3. Key Terms  
**Value Type:** A type that makes copies of itself when assigned.  
**Property:** A stored value inside a struct.  
**Protocol Conformance:** Giving a struct behaviors like `Identifiable`.

## 4. Concepts Explained in Plain English  
- A struct is like a container that holds pieces of information that belong together.  
- Swift makes a new copy when a struct is assigned.  
- Useful in SwiftUI for predictable UI updates.

## 5. When to Use This  
- Modeling simple data.  
- SwiftUI lists.  
- Lightweight models in MVVM.

## 6. Visual Mental Model  
Car  
 ├─ name  
 ├─ imageName  
 └─ isFavorite  

## 7. Related Swift Topics  
- Classes vs Structs  
- Identifiable  
- MVVM models  
- SwiftUI State

## 8. Common Mistakes / Gotchas  
- Forgetting Identifiable  
- Expecting reference-type behavior  
- Trying to mutate a let-constant struct

## 9. My Practice / Hands-On Work  
- Built car models for grid layout.  
- Implemented UUID-based IDs.

## 10. Questions I Still Have  
- When to choose a class?  
- How structs behave inside ViewModels?

## 11. References  
- Develop in Swift Fundamentals  
- Apple Docs: Structures and Classes  
