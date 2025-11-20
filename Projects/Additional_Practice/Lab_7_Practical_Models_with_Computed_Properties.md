# Lab 6 – Practical Data Models with Computed Properties

**Goal:** Apply computed properties to more realistic data models (scores, goals, and progress) so your structs can “explain themselves” without extra stored state.

---

## 🎯 Learning Objectives

- Design models that use computed properties for summaries and derived values.  
- Avoid redundant stored data (like storing both “total” and “average” when one can be computed).  
- Combine functions and computed properties in the same struct to encapsulate logic cleanly.

---

## 🧩 Part 1 – Score Tracker Model

### Task

Create a struct called `ScoreTracker` with:

- A stored property `scores: [Int]` (an array of scores).  
- A computed property `totalScore` that returns the sum of all scores.  
- A computed property `averageScore` that returns the average as a `Double` (or `0` if there are no scores).  

Add two methods:

- One to `addScore(_:)` (append a value to the array).  
- One to `reset()` (clear all scores).  

### Concept Focus

The `totalScore` and `averageScore` are *derived* from `scores`. You never manually set them — they always reflect the current array.

---

## 🧠 Part 2 – Daily Goal Model

### Task

Create a struct called `DailyGoal` with:

- A stored property `target: Int` (for example, target steps or minutes).  
- A stored property `current: Int` (how much has been completed today).  

Add computed properties:

- `remaining` → `target - current`, but never less than 0.  
- `progressFraction` → a `Double` between `0.0` and `1.0` representing completion progress (handle the case when `target` is 0).  
- `isComplete` → `true` when `current >= target`, otherwise `false`.  

### Concept Focus

Multiple computed properties can represent different “views” of the same underlying data — remaining amount, fraction complete, and completion status all come from `target` and `current`.

---

## 📊 Part 3 – Summary and Status Text

### Task

Extend `DailyGoal` with a computed property:

- `statusText` that returns a message, for example:  
  - If not complete: `"Keep going – X left to reach your goal!"`  
  - If complete: `"Goal reached! 🎉"`  

Then in a playground or small Swift script:

- Create a `DailyGoal` instance.  
- Change `current` a few times.  
- Print `statusText` each time to see how it reacts.

### Concept Focus

A single change to stored properties (`current`) updates **all** derived views: `remaining`, `progressFraction`, `isComplete`, and `statusText`.

---

## 🧮 Part 4 – Combining Models: UserProgress

### Task

Create a struct called `UserProgress` with:

- A stored property `name: String`.  
- A stored property `goals: [DailyGoal]`.  

Add computed properties:

- `completedGoals` → an array of goals where `isComplete` is `true`.  
- `incompleteGoals` → an array of goals where `isComplete` is `false`.  
- `completionRate` → a `Double` between `0.0` and `1.0` describing how many goals are complete out of the total (0 if there are no goals).  
- `summary` → a string describing the user’s progress, such as:  
  > "Chris – 2/5 goals complete (40%)."

### Concept Focus

This shows how higher-level models can use computed properties from **other structs** to build richer summaries and maintain a clean data flow.

---

## 🧪 Bonus Challenges

- Add a computed property on `UserProgress` that returns the **average progressFraction** across all goals.  
- Add a method `resetAllGoals()` that resets each `DailyGoal`’s `current` to 0.  
- Integrate `UserProgress` into a small SwiftUI view and show:
  - The user’s name,  
  - The summary text,  
  - A list of goals with their `statusText`.

---

## ✅ Check Your Understanding

- Can you look at a model and decide which fields should be *stored* and which should be *computed*?  
- Can you avoid storing “duplicate” values when one can be derived from the other?  
- Do you see how computed properties help keep your UI and data in sync without extra bookkeeping?

---

**Next Steps:**  
Try revisiting your existing projects (Quote app, Habit Tracker, Meal Planner) and ask:
- “What values am I storing that could instead be computed?”  
- “Where can a computed `summary` or `status` string make my views simpler to build?”
