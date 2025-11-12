# Lab 4 – Computed Properties in Swift Structures

**Goal:** Practice how to create and use computed properties in your Swift structures to make your code cleaner, more reactive, and less repetitive.

---

## 🎯 Learning Objectives

- Understand what computed properties are and how they differ from stored properties.  
- Create both **read-only** and **read/write** computed properties.  
- Learn how computed properties automatically reflect changes in stored properties.  
- Use computed properties to simplify your logic and reduce redundant data.

---

## 🧩 Part 1 – Understanding Computed Properties

### Task
Create a simple structure called `Rectangle` that has:
- Two stored properties: `width` and `height` (both `Double`).
- One **computed property**: `area`, which calculates the rectangle’s area.

### Concept Focus
A computed property does not store data. Instead, it derives its value from other stored properties.

**Hint:** Your computed property should look like this in concept:
> When `area` is called, it multiplies `width` × `height` and returns that result.

---

## 🧠 Part 2 – Read/Write Computed Properties

### Task
Extend your `Rectangle` struct with a **read/write** computed property called `perimeter`:
- When **read**, it should return `(width + height) * 2`.  
- When **set**, it should adjust `width` and `height` evenly so that the new total perimeter matches the value assigned.

### Concept Focus
A read/write computed property includes both:
- `get { }` – for retrieving a value  
- `set { }` – for changing related stored properties

---

## 💡 Part 3 – Computed Properties that Depend on Other Computed Properties

### Task
Add another computed property called `summary` that returns a string summary of the rectangle:
> "Width: X, Height: Y, Area: Z, Perimeter: P"

This property should *use* your other computed properties (`area` and `perimeter`) instead of recalculating.

### Concept Focus
This shows that computed properties can reference each other to build dynamic descriptions or summaries.

---

## 🧮 Part 4 – Challenge: Nested Computed Properties

### Task
Create a new struct called `Circle` with:
- One stored property: `radius`
- Two computed properties:
  - `diameter` → radius × 2
  - `area` → π × radius² (use `Double.pi`)
- A `summary` computed property that prints all three values.

Then make one instance of `Circle` and print its `summary`.

---

## ✅ Check Your Understanding

- Do you understand how computed properties can replace redundant stored values?  
- Can you explain the difference between stored, computed, and read/write properties?  
- Can you spot when a computed property automatically updates its result without you reassigning it?

---

**Next Steps:**  
In **Lab 5**, you’ll apply computed properties in a SwiftUI context — using them to dynamically display colors, emojis, or styles that respond to changes in your data.
