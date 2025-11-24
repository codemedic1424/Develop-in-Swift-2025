# 📘 Topic  
Value Types vs Reference Types in Swift

### 🗓 Date  
2025-11-23

## 1. Summary  
Swift uses **value types** (structs, enums, tuples) and **reference types** (classes, actors, closures) to manage data. Value types create **copies** when assigned or passed around, while reference types share a **single instance** in memory. Understanding the difference helps avoid bugs related to unexpected mutation and enables safer, more predictable code.

## 2. Core Ideas  
- Value types **copy** on assignment, mutation happens per‑instance.  
- Reference types **share** a single instance—mutating one reference affects all others.  
- Swift favors **value semantics** for safety and predictability.  
- Classes are needed when identity, inheritance, or shared mutable state matters.  

## 3. Key Terms  
**Value Type:** A type where each variable has its own copy of data.  
**Reference Type:** A type where variables refer to the same shared instance.  
**Copy-on-Write (CoW):** Swift optimizes copying so values copy only when actually modified.  
**Identity:** The concept that a specific object instance is unique in memory.

## 4. Concepts Explained in Plain English  
- Value types are like **photocopies** — each person gets their own version, and editing yours doesn’t change mine.  
- Reference types are like **shared Google Docs** — multiple people point to the same document, so one person’s edits appear everywhere.  
- Swift prefers structs (value types) for most models because they reduce accidental side effects.  
- Classes are still important when you want shared behavior or persistent identity.

## 5. When to Use This  
Use **value types (structs, enums)** when:  
- You want predictability.  
- States should not be shared.  
- You’re modeling simple data (Coordinates, Settings, Models, Results).  
- Working with SwiftUI (value types play well with diffing).

Use **reference types (classes, actors)** when:  
- Multiple parts of your app need to share and mutate the same data.  
- You need inheritance or polymorphism.  
- Identity matters (e.g., long‑lived objects, controllers, resources).  
- You’re working with asynchronous shared state (actors).

## 6. Visual Mental Model  
**Value Type:**  
```
A = 5  
B = A → B gets its own copy (5)  
B changes to 10 → A stays 5  
```

**Reference Type:**  
```
A = 🟦(object)  
B = A → both point to the same 🟦  
B mutates → A sees the mutation too  
```

## 7. Related Swift Topics  
- Structs vs Classes  
- Enums  
- ARC (Automatic Reference Counting)  
- Memory safety  
- Actors and concurrency  
- Copy-on-write performance  
- SwiftUI data flow (value semantics)

## 8. Common Mistakes / Gotchas  
- Thinking value types behave like classes (they don't — they copy).  
- Forgetting that classes can lead to unexpected mutation if shared.  
- Accidentally sharing class instances across views or tasks.  
- Copy-on-write surprises: copying collections doesn’t always create a new buffer until needed.  
- Using classes for “simple data holders” when a struct is safer.

## 9. My Practice / Hands-On Work  
- Create a struct and demonstrate copying behavior.  
- Create a class and show shared-state mutation.  
- Convert a class model to a struct and observe behavior differences.  
- Try a CoW example with arrays and check buffer identity.

## 10. Questions I Still Have  
- When is it better to use an actor vs a class for shared state?  
- How does Swift optimize copy-on-write internally?  
- When is reference semantics actually more ergonomic?

## 11. References  
- Apple Swift Documentation: Value and Reference Types  
  https://www.swift.org/documentation/articles/value-and-reference-types.html  
- Swift Language Guide: Classes and Structures  
