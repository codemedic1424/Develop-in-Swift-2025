# Lab 5 – Computed Properties in SwiftUI

**Goal:** Practice using computed properties to drive your SwiftUI UI — changing labels, emojis, and styles automatically based on underlying data.

---

## 🎯 Learning Objectives

- Use computed properties inside your models and views to control what the UI shows.  
- See how changing a single stored property automatically updates multiple computed ones.  
- Avoid duplicate state by deriving values (like labels, colors, and emojis) instead of storing them twice.

---

## 🧩 Part 1 – Mood Model with Computed Description

### Task

Create a simple `Mood` struct with:

- One stored property: `level` (an `Int` from 1–5).  
- One computed property: `description`, which returns a short text string based on `level`.  

Examples of mapping:

- 1 → "Very Sad"  
- 2 → "Sad"  
- 3 → "Neutral"  
- 4 → "Happy"  
- 5 → "Very Happy"  
- Any other value → "Unknown"

### Concept Focus

The `description` is derived from `level`. You never store both separately — the text is always computed from the numeric mood level.

---

## 🧠 Part 2 – MoodView Using a Computed Property

### Task

In a SwiftUI view (for example, `MoodView`):

- Add a `@State var moodLevel: Int`.  
- Create a computed property in the view called `moodDescription` that uses the same logic as your `Mood.description` (or delegates to a `Mood` instance).  
- Show a `Text` view that displays `moodDescription`.  
- Add a stepper or buttons to increase or decrease `moodLevel` between 1 and 5.

### Concept Focus

As `moodLevel` changes, `moodDescription` recalculates and the `Text` updates automatically — no extra state needed.

---

## 🎨 Part 3 – Computed Color and Emoji

### Task

Extend your SwiftUI view with more computed properties:

- A computed property `moodColor` that returns a different color based on `moodLevel` (for example, red for low, yellow for middle, green for high).  
- A computed property `moodEmoji` that returns an emoji based on `moodLevel` (for example, 😢, 😐, 🙂, 😄).  

Update your UI so that:

- The emoji is shown in a `Text` view.  
- The color is used to style the emoji or the background of a container.

### Concept Focus

Multiple computed properties can all depend on the same underlying `@State` value and remain perfectly in sync without storing duplicate data.

---

## 📊 Part 4 – Summary Computed Property

### Task

Add a final computed property called `summary` that returns something like:

> "Mood: [emoji] [description] (level [moodLevel])"

Display this summary at the bottom of the view. Then:

- Change the mood level using your controls.  
- Confirm that the summary text, emoji, and color all stay in sync automatically.

### Concept Focus

This shows how you can build expressive, human-readable summaries from smaller computed pieces without extra storage.

---

## 🧪 Bonus Challenges

- Add a "Reset" button that sets `moodLevel` back to a default value.  
- Add a small history list that shows previous mood levels (you can store them in an array) and a computed property that returns the average mood.  
- Create a second view that receives the current mood as a binding and displays only the emoji and color — no direct access to `moodLevel`.

---

## ✅ Check Your Understanding

- Can you explain the difference between `@State` (stored) and a computed property (derived)?  
- Can you identify when you should *compute* a value (like an emoji or color) instead of storing it separately?  
- Do you see how changing one piece of data can automatically update many parts of your UI when those parts are based on computed properties?

---

**Next Steps:**  
Try applying the same pattern in your own projects — for example, in your Habit Tracker, use computed properties to derive:
- A streak label,  
- A category emoji,  
- Or a progress description from a single numeric value.
