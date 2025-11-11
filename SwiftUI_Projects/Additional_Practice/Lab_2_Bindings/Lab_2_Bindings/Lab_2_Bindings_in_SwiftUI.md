# Lab 2 - Bindings in SwiftUI (Simple UI)

**Goal:** Practice `@State` and `@Binding` by connecting a parent view and child views.

## Part 0 — Project Setup
- [✅] Open Xcode and create a new **iOS App** project.
- [✅] Set **Interface** to **SwiftUI**, **Language** to **Swift**.
- [✅] Name the project something like “BindingsLab”.
- [✅] Confirm you see a default `ContentView` with `#Preview`.

## Part 1 — Single Piece of State in the Parent
**Concept:** `@State` in a view and how it drives the UI.
- [✅] In `ContentView`, add a Boolean `@State` property (for example, `isOn`) and initialize it to `false`.
- [✅] In the `body`, add a control that toggles this Boolean (a Toggle or Button is fine).
- [✅] Add a `Text` view that shows different text depending on the Boolean’s value (e.g., one message when `true`, another when `false`).
- [✅] Run the preview or simulator and verify:
  - [✅] Toggling the control changes the Boolean.
  - [✅] The label text updates when the Boolean changes.

## Part 2 — Move the Control to a Child View Using `@Binding`
**Concept:** Parent owns the state, child gets a binding to it.
- [✅] Create a new SwiftUI view (for example, `ToggleRowView`) in the same file or a new file.
- [✅] Give this child view a `@Binding` Boolean property with a descriptive name (e.g., `isOn`).
- [✅] In the child’s `body`, add:
  - [✅] A control that reads and writes using that binding (e.g., a Toggle or Button bound to the `@Binding`).
  - [✅] A label that reflects the current value of the binding.
- [✅] Back in `ContentView`, replace the original Toggle/Button with the child view.
- [✅] Pass the **binding** form of the state (using the `$` prefix) to the child.
- [✅] Run the preview or simulator and verify:
  - [✅] Changing the control in the child view updates the parent’s Boolean.
  - [✅] Any labels in the parent based on that Boolean also update.

## Part 3 — Bindings in a List / Multiple Child Views
**Concept:** An array of values in `@State` and binding each element to a row.
- [ ] In `ContentView`, add another `@State` property: an array of simple values or models (e.g., integers representing counters or simple task structs).
- [ ] Create a second child view (e.g., `CounterRowView`) that:
  - [ ] Has a `@Binding` to a single element in that array (e.g., a `@Binding Int` or `@Binding` to a simple struct).
  - [ ] Contains controls that modify the bound value (for example, increment and decrement buttons).
  - [ ] Displays the current value so you can see changes.
- [ ] In the parent’s `body`, build a `List` or `ForEach` that:
  - [ ] Iterates over the array using bindings (so each row gets a `@Binding` to one element).
  - [ ] Uses your row view and passes in the correct binding for that element.
- [ ] Run the preview or simulator and verify:
  - [ ] Each row updates independently when you tap its controls.
  - [ ] The parent’s array reflects those changes (you can add a debug label or `print` for confirmation).

## Lab 2 – Bonus Ideas
- [ ] Add a “Reset All” button in the parent view that sets all values in the array back to a default.
- [ ] Add a label in the parent that shows a **total** or **summary** derived from all the values (e.g., sum of counters).
- [ ] Confirm that changing any row automatically updates the summary label.
