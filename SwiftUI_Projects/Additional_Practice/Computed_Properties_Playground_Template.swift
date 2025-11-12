// 🧮 Computed Properties – Practice Template
// Use this file to complete the exercises from your “Computed Properties” practice guide.
// You can open this in Xcode or the Swift Playgrounds app (macOS or iPad).

import Foundation
import PlaygroundSupport

// ==========================================================
// MARK: - Section 1 – Basics of Computed Properties
// ==========================================================

// Exercise 1 – Full Name
// Create a Person struct with firstName and lastName.
struct Person {
    var firstName: String
    var lastName: String
    // Add a computed property fullName -> "<firstName> <lastName>"
    var fullName {
        return "Hello! My name is \(firstName) \(lastName)"
    }
}
let me = Person(firstName: "Christopher", lastName: "Wilshusen")
print(me)


// Exercise 2 – Rectangle Area
// Create a Rectangle struct with width and height (Double).
// Add computed property area -> width * height.

// Exercise 3 – Even or Odd
// Create a NumberInfo struct with value: Int.
// Add computed property isEven -> Bool and parityDescription -> "Even"/"Odd".

// ==========================================================
// MARK: - Section 2 – Read-Only vs Read–Write Computed Properties
// ==========================================================

// Exercise 4 – Temperature in Celsius/Fahrenheit
// Add computed property fahrenheit with get/set logic for conversion.

// Exercise 5 – Clamped Score
// Use private _value and a computed value property that clamps between 0–100.

// ==========================================================
// MARK: - Section 3 – Weather / Forecast Themed
// ==========================================================

// Exercise 6 – Temperature Range String ("low–highº")
// Exercise 7 – Weather Summary Text ("Rainy"/"Sunny")
// Exercise 8 – High Temperature Category ("Cold"/"Mild"/"Hot")

// ==========================================================
// MARK: - Section 4 – Computed Properties in SwiftUI Views
// ==========================================================

// Exercise 9 – Button Title Based on State
// @State var isPlaying: Bool
// Computed property buttonTitle -> "Play"/"Pause"

// Exercise 10 – Dynamic Icon Name
// Computed property favoriteIconName -> "star" or "star.fill"

// Exercise 11 – Card Background Color
// Computed property cardBackground -> green or gray opacity

// ==========================================================
// MARK: - Section 5 – Challenge Exercises
// ==========================================================

// Challenge 1 – Step Counter (Goal progress)
// Challenge 2 – Grading System (Letter + Passing Bool)
// Challenge 3 – Daily Motivation Card (Styled quote card)

// ==========================================================
// ✅ Notes
// ==========================================================
// You can run this file directly in Xcode’s playground console.
// Add print() statements after each struct to verify computed outputs.
// Use get/set syntax where needed for read–write properties.
// For SwiftUI parts, copy relevant structs into an Xcode project later.
