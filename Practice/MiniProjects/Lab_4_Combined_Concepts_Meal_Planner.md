# Lab 4 - Combined Concepts (Extended Challenge: Meal Planner)

**Objective:** Apply struct relationships, computed properties, and nested bindings to manage interconnected data models.  
**Goal:** Build a "Meal Planner" that tracks meals, ingredients, and user preferences using multiple bindings.  
**Estimated Time:** 90–120 minutes.

---

## 🧠 Concept Overview
This lab ties together everything you’ve learned:  
- Multiple structs with relationships (`Meal`, `Ingredient`, `UserProfile`)  
- Computed summaries and filters  
- Passing bindings through multiple layers of SwiftUI views

---

## Part 1 — Project Setup
- [ ] Open Xcode → **New iOS App** → name it “MealPlannerLab”.
- [ ] Interface: **SwiftUI**, Language: **Swift**.
- [ ] Confirm a working preview in `ContentView`.

---

## Part 2 — Define Core Models
- [ ] Create `Ingredient` struct:
  - [ ] `let id = UUID()`
  - [ ] `var name: String`
  - [ ] `var calories: Int`
  - [ ] Computed property: `var emoji: String` (e.g., 🥦 for veggies, 🍗 for protein, 🍞 for carbs)
- [ ] Create `Meal` struct:
  - [ ] `let id = UUID()`
  - [ ] `var name: String`
  - [ ] `var category: String` (Breakfast, Lunch, Dinner)
  - [ ] `var ingredients: [Ingredient]`
  - [ ] Computed property: `var totalCalories: Int` (sum of ingredient calories)
- [ ] Create `UserProfile` struct:
  - [ ] `var name: String`
  - [ ] `var favoriteMealIDs: [UUID] = []`

---

## Part 3 — Main View with Meals
- [ ] In `ContentView`, add:
  - [ ] `@State private var meals: [Meal]` with 3–4 examples.
  - [ ] `@State private var user = UserProfile(name: "Chris")`
- [ ] Wrap everything in a `NavigationStack`.
- [ ] Create `List($meals)` to display each meal with:
  - [ ] Its name, category, and total calories.
  - [ ] A “star” button that toggles favorite status for that meal in the user’s profile.
- [ ] Add `.navigationTitle("Meal Planner")`.

---

## Part 4 — Ingredient Detail View
- [ ] Create a new SwiftUI view `MealDetailView`.
- [ ] Give it a `@Binding var meal: Meal`.
- [ ] Inside the body:
  - [ ] Show the meal’s name and category.
  - [ ] Use a `List` to display ingredients with their emoji and calorie count.
  - [ ] Add a button to add a new ingredient (for now, just append a sample one).
- [ ] Add a `NavigationLink` from each row in `ContentView` to `MealDetailView`.

---

## Part 5 — Favorites and Filters
- [ ] Add a toggle button in the navigation bar to switch between:
  - [ ] “All Meals”
  - [ ] “Favorites Only”
- [ ] Create a computed property `filteredMeals` in `ContentView`:
  - [ ] Returns all meals if the toggle is off.
  - [ ] Returns only meals whose IDs are in `user.favoriteMealIDs` if on.
- [ ] Base your `List` on `filteredMeals`.

---

## 🪄 Bonus Challenges
- [ ] Add a computed property in `UserProfile` that returns the number of favorite meals.
- [ ] Add a footer label: “Total Calories Today: X”.
- [ ] Add the ability to remove ingredients.
- [ ] Add animations when meals are favorited.
- [ ] Persist meals and favorites to `UserDefaults`.

---
