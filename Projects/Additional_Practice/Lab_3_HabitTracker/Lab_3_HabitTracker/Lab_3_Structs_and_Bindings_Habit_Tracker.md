# Lab 3 - Structs + Bindings (Mini App: Habit Tracker)

**Objective:** Combine struct logic (`mutating`, computed properties) with SwiftUI bindings to manage and update data interactively.  
**Goal:** Build a mini "Habit Tracker" that lets you mark habits as complete and track daily streaks.  
**Estimated Time:** 60–90 minutes.

---

## 🧠 Concept Overview
You’ll combine the Swift fundamentals from earlier labs with `@State`, `@Binding`, and `List` in SwiftUI.  
You’ll build a data model (`Habit`), a list view with bindings, and a simple computed streak counter.

---

## Part 1 — Project Setup
- [ ] Open Xcode and create a new **iOS App** project.
- [ ] Set **Interface** to **SwiftUI**, **Language** to **Swift**.
- [ ] Name the project “HabitTrackerLab”.
- [ ] Confirm you see a `ContentView` with `#Preview`.

---

## Part 2 — Build the Model
- [ ] Create a new Swift file named `Habit.swift`.
- [ ] Define a struct named `Habit` that conforms to `Identifiable`.
- [ ] Add these stored properties:
  - [ ] `let id = UUID()`
  - [ ] `var name: String`
  - [ ] `var category: String`
  - [ ] `var streak: Int = 0`
  - [ ] `var isComplete: Bool = false`
- [ ] Add a computed property:
  - [ ] `var categoryEmoji: String` returning an emoji based on category.
- [ ] Add a mutating method:
  - [ ] `mutating func toggleComplete()` that flips `isComplete` and increases streak by 1 if true, resets to 0 if false.

---

## Part 3 — Display Habits in a List
- [ ] In `ContentView.swift`, create a `@State` array of `Habit`:
  - [ ] Include 3–5 example habits with various categories.
- [ ] Wrap the `List` in a `NavigationStack`.
- [ ] Create a `List($habits)` that iterates over the bound array.
- [ ] For each row, display:
  - [ ] The category emoji.
  - [ ] The habit name.
  - [ ] The current streak.
  - [ ] A button that toggles completion with a checkmark or circle icon.

---

## Part 4 — Add Binding-Based Interaction
- [ ] Use the `$` prefix in the `List` so each habit is editable via binding.
- [ ] Inside the row, write:
  - [ ] `Button { habit.toggleComplete() } label: { ... }`
  - [ ] Change the button icon and color based on `isComplete`.
- [ ] Verify:
  - [ ] Tapping the button updates the row immediately.
  - [ ] The streak count updates automatically.

---

## Part 5 — Computed Summaries and Styling
- [ ] Add a computed property in `ContentView`:
  - [ ] `var totalStreak: Int` that sums all habit streaks.
- [ ] Add a label below the list showing `Total streak: \(totalStreak)`.
- [ ] Add `.navigationTitle("Daily Habits")`.
- [ ] Add `.navigationBarTitleDisplayMode(.large)`.

---

## 🪄 Bonus Challenges
- [ ] Add a “Reset All” button that sets all habits’ `isComplete` to false and resets streaks to 0.
- [ ] Add a `Filter` toggle to show only completed habits.
- [ ] Add a computed property in `Habit` that returns a motivational message based on streak count.
- [ ] Add animation to the streak label when a habit is marked complete.

---
