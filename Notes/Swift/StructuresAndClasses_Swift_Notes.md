# 📘 Topic  
Swift Structures and Classes

### 🗓 Date  
2025-11-23

## 1. Summary  
Swift provides two primary building blocks for creating custom data types: **structures** and **classes**. Both allow you to model data and behavior, but they differ in memory semantics, inheritance, and identity.

## 2. Core Ideas  
- Structures and classes define custom types with properties and methods.
- Structs are **value types**; classes are **reference types**.
- Classes support inheritance; structs do not.
- Classes provide identity features (deinitializers, reference comparison).
- Swift favors structs unless you specifically need class-only capabilities.

## 3. Key Terms  
**Value type:** A type where each instance keeps a unique copy of its data.  
**Reference type:** A type where multiple variables can refer to the same instance in memory.  
**Initializer:** A method that sets up an instance before use.  
**Mutating method:** A method in a struct that can modify the instance.  
**Inheritance:** The ability of classes to derive from a superclass.  
**Identity operator (===):** Checks if two references point to the same class instance.

## 4. Concepts Explained in Plain English  
- When you copy a **struct**, you get a brand-new, independent copy. Modifying one does not affect the other.
- When you copy a **class reference**, you end up with two variables pointing to the same object—changing one affects both.
- Structs are lightweight, safe, and used everywhere in Swift (Strings, Arrays, Dictionaries).
- Classes come into play when you need shared state or inheritance behaviors.

## 5. When to Use This  
Use a **struct** when:
- You want simple, encapsulated data.
- Copies should be independent.
- You don’t need inheritance.
- Performance and safety matter (value types reduce shared-state bugs).

Use a **class** when:
- You need inheritance/polymorphism.
- You require shared mutable state.
- You need identity (comparing by reference).

## 5a. Guidance from Apple: Choosing Between Structures and Classes
Apple’s official guidance provides additional clarity on when to choose a struct versus a class:

### 📌 Apple’s Key Recommendations

#### Prefer Structures When:
- You’re modeling **simple data** that is primarily a set of values.
- The data should be **copied rather than shared**.
- You don’t need **inheritance**.
- You want **predictable value semantics** that reduce the risk of shared‑state bugs.
- All stored properties are themselves **value types**.
- You want to take advantage of **automatic memberwise initializers**.

#### Consider Classes When:
- You need to create a type with **identity** — where the instance itself has meaning beyond its data.
- You require **shared mutable state** across the app.
- You need **inheritance**, subclassing, or polymorphism.
- You need to interoperate with **Objective‑C frameworks**, which are class‑based.
- Your type manages **resources that should not be duplicated** (e.g., file handles, connections, buffers).

### 🧠 Additional Notes from Apple
- **Value semantics** make code easier to reason about, especially in SwiftUI.
- **Copy‑on‑write optimization** allows Swift’s value types to stay efficient even when copied.
- **Reference types** are more flexible but introduce complexity due to shared state and ARC.

### 📝 Summary of Apple’s Decision Checklist
Ask these questions:
1. Does my type need to inherit behavior? → **Use a class.**
2. Should copies be independent? → **Use a struct.**
3. Do multiple parts of the app need to modify the same instance? → **Use a class.**
4. Is this type meant to be simple, predictable, and safe? → **Use a struct.**

### 5b. Side-by-Side Struct vs Class Examples

#### Example 1 – Copy vs Shared Reference

```swift
// Struct: value type (each copy is independent)
struct PlayerStruct {
    var name: String
}

var s1 = PlayerStruct(name: "Chris")
var s2 = s1              // copy
s2.name = "Echo"

print(s1.name)  // Chris
print(s2.name)  // Echo

// Class: reference type (shared instance)
class PlayerClass {
    var name: String
    init(name: String) {
        self.name = name
    }
}

var c1 = PlayerClass(name: "Chris")
var c2 = c1              // reference to the same object
c2.name = "Echo"

print(c1.name)  // Echo  ✅ both changed
print(c2.name)  // Echo
```

#### Example 2 – Mutating vs Non-Mutating Methods

```swift
struct CounterStruct {
    var value = 0

    // Must be marked mutating to change self
    mutating func increment() {
        value += 1
    }
}

class CounterClass {
    var value = 0

    // Classes can always mutate their properties
    func increment() {
        value += 1
    }
}

var cs = CounterStruct()
cs.increment()        // OK

let cc = CounterClass()
cc.increment()        // OK
```

### 5c. Decision Tree (Text Diagram)

Use this as a quick mental checklist when designing a type:

```text
                    Start
                      │
                      ▼
    ┌────────────────────────────────┐
    │ Do you need inheritance or     │
    │ polymorphism (subclassing)?    │
    └────────────────────────────────┘
                      │
      Yes ──────────┴──────────▶ Use a CLASS
                      │
                      ▼
    ┌────────────────────────────────┐
    │ Should copies be independent   │
    │ (changing one shouldn't affect │
    │ the others)?                   │
    └────────────────────────────────┘
                      │
      Yes ──────────┴──────────▶ Use a STRUCT
                      │
                      ▼
    ┌────────────────────────────────┐
    │ Do multiple parts of the app   │
    │ need to share and mutate the   │
    │ same instance?                 │
    └────────────────────────────────┘
                      │
      Yes ──────────┴──────────▶ Use a CLASS
                      │
                      ▼
                   Otherwise
                      │
                      ▼
                   Use a STRUCT
```

### 5d. SwiftUI-Specific Recommendations

Apple strongly encourages **value types (structs)** in SwiftUI for UI description, with reference types (classes) used for shared, observable state.

**In SwiftUI, prefer:**
- `struct` for your `View` types.  
  - These are cheap to create and work well with SwiftUI’s diffing system.
- `struct` for simple, immutable models (e.g., `Task`, `Lesson`, `UserSettingsSnapshot`).
- `struct` for data that you pass down the view hierarchy by value.

**Use `class` (often with `ObservableObject`) when:**
- You need **shared, mutable state** across multiple views.
- The state is long-lived (e.g., session managers, data controllers, network managers).
- You rely on `@Published` properties with `@StateObject`, `@ObservedObject`, or `@EnvironmentObject`.

```swift
// SwiftUI: typical pattern

// 1. Model as a struct
struct Lesson: Identifiable, Codable {
    let id: UUID
    var title: String
    var isComplete: Bool
}

// 2. Shared state as a class
final class LessonStore: ObservableObject {
    @Published var lessons: [Lesson] = []
}

// 3. Views as structs
struct LessonListView: View {
    @StateObject private var store = LessonStore()

    var body: some View {
        List(store.lessons) { lesson in
            Text(lesson.title)
        }
    }
}
```

**Mental shortcut for SwiftUI:**
- **UI description → `struct View`**
- **Shared app state → `class` `ObservableObject`**
- **Simple data → `struct` value types**

## 6. Visual Mental Model  
- **Struct = a copy machine**  
  Each assignment creates a new “printout,” fully independent.

- **Class = a shared whiteboard**  
  Multiple references can write on the same underlying object.

## 7. Related Swift Topics  
- Value vs Reference Types  
- Memory management (ARC)  
- Mutating methods  
- Protocol conformance  
- Copy-on-write behavior  

## 8. Common Mistakes / Gotchas  
- Forgetting that modifying a class instance affects all references.
- Not marking struct methods as `mutating` when they modify properties.
- Using classes unnecessarily when a struct would be safer.
- Assuming structs are always cheaper—large copies can still incur cost.

## 9. My Practice / Hands-On Work  
- Created a struct and tested how copying works across variables.
- Created a class and validated shared-state behavior.
- Practiced `mutating` methods and custom initializers.

## 10. Questions I Still Have  
- How do structs behave with copy-on-write collections?
- When does ARC apply to classes inside structs?

## 11. References  
- Swift Book – Classes and Structures  
  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/
