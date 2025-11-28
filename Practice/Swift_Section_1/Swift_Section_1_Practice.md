# 🧪 Swift Practice – Section 1  
A structured practice sheet covering:  
**Basics · Flow Control · Functions · Collections · Structs & Classes · Value vs Reference Types · Enums**

Use this file as the *specification*.  
Write your actual Swift answers inside a separate file:  
`Practice/Section_1/Swift_Section_1_Practice.swift`

---

## ✅ 1. The Basics

### Exercise 1 — Variables & Constants
- [ ] Create variables for:
  - Your name  
  - Your age  
  - Whether you’re a student  
- [ ] Convert one of the variables into a constant  
- [ ] Add type annotations to each  

#### Starter Code
```swift
// Your code here
```

---

### Exercise 2 — String Interpolation
- [ ] Create a greeting sentence using your variables  
- [ ] Return it from a function  

```swift
func basics_ex2() {
    // Your code here
}
```

---

### Exercise 3 — Type Fixing
- [ ] Fix the types so this compiles:

```swift
let number = "5"
let doubled = number * 2   // ❌ Fix this
```

---

## ✅ 2. Flow Control

### Exercise 1 — `if/else`
- [ ] Write a function that takes an integer and:
  - Returns “small” if < 10  
  - “medium” if 10–20  
  - “large” otherwise  

```swift
func flow_ifElse(_ value: Int) -> String {
    // Your code here
}
```

---

### Exercise 2 — `switch`
- [ ] Create a switch on a tuple `(speed, visibility)`  
- [ ] Return one of: “Safe”, “Caution”, “Danger”

```swift
func flow_switch(speed: Int, visibility: Int) -> String {
    // Your code here
}
```

---

### Exercise 3 — Loops
- [ ] Print every even number from 2 to 20  
- [ ] Store them in an array  

```swift
func flow_loops() -> [Int] {
    // Your code here
}
```

---

## ✅ 3. Functions

### Exercise 1 — Arguments & Return
- [ ] Write a function that adds two numbers  
- [ ] Then make a version with an external label  
- [ ] Make another version with no external label  

```swift
func add(_ a: Int, _ b: Int) -> Int { /* ... */ }
func addNumbers(a: Int, b: Int) -> Int { /* ... */ }
```

---

### Exercise 2 — Default Values
- [ ] Create a function `makeGreeting(name:times:)`  
- [ ] Default `times` to 1  

---

### Exercise 3 — Inout
- [ ] Write a function that doubles an integer using `inout`

```swift
func doubleValue(_ number: inout Int) { /* ... */ }
```

---

## ✅ 4. Collections

### Exercise 1 — Arrays
- [ ] Create an array of 5 favorite movies  
- [ ] Add one  
- [ ] Remove one  
- [ ] Sort alphabetically  

---

### Exercise 2 — Dictionaries
- [ ] Dictionary of airport codes → airport names  
- [ ] Add and remove values  
- [ ] Access safely with nil-coalescing  

---

### Exercise 3 — Sets
- [ ] Create a set of foods you like  
- [ ] Insert a duplicate  
- [ ] Show why duplicates don’t add  

---

## ✅ 5. Structures & Classes

### Exercise 1 — Define a struct
- [ ] Create a struct `Car` with:
  - make  
  - model  
  - year  
  - computed property `age`  
- [ ] Instantiate two cars  

---

### Exercise 2 — Define a class
- [ ] Create a class `Dog` with:
  - name  
  - breed  
  - bark() method  
- [ ] Show reference behavior  

---

## ✅ 6. Value vs Reference Types

### Exercise 1 — Demonstrate value copying
- [ ] Copy a struct → change one copy → show independence  

---

### Exercise 2 — Demonstrate reference linking
- [ ] Copy a class → change one → show both update  

---

## ✅ 7. Enumerations

### Exercise 1 — Basic Enum
- [ ] Create an enum `Compass` with four directions  
- [ ] Create a function that describes each case  

---

### Exercise 2 — Enums with Raw Values
- [ ] Enum for HTTP status codes  
- [ ] Access raw values  

---

### Exercise 3 — Enums with Associated Values
- [ ] Enum `Media`:
  - image(width,height)
  - text(String)
  - video(lengthSeconds)  
- [ ] Switch on it and describe each

---

## ⭐ Bonus Challenge — Mini Learning Tracker
Build the smallest possible version of your LearningDashboard model:

- [ ] Create an enum `Module` (swift, swiftUI, dis, labs)  
- [ ] Create a struct `LearningItem` with:
  - title  
  - module  
  - completed (Bool)  
- [ ] Create functions:
  - add item  
  - mark completed  
  - filter by module  
- [ ] Print progress  

---

## 🧪 How to Use This Sheet

- Do **not** write answers in this file  
- All answers go in: `Practice/Section_1/Swift_Section_1_Practice.swift`
- Check off tasks here as you complete them
- Commit work with messages like:
  - `feat: complete basics exercises`
  - `feat: add flow-control solutions`

---

Happy practicing, Chris! 🚀  
Let me know when you want a Section 2 sheet built.
