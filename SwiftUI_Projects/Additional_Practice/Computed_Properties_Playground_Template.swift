// 🧮 Computed Properties – Swift Playground Template
// Created for practice with Sections 1 & 2 of your Computed Properties exercises.
// You can open this file in Xcode or in the Swift Playgrounds app on macOS or iPad.

import Foundation

// MARK: - Example 1: Basic Computed Property
struct Person {
    var firstName: String
    var lastName: String
    
    // Computed property combining first and last name
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}

// Test it
var person = Person(firstName: "Chris", lastName: "Wilshusen")
print("Full name:", person.fullName)

// MARK: - Example 2: Rectangle Area
struct Rectangle {
    var width: Double
    var height: Double
    
    var area: Double {
        width * height
    }
}

let rect = Rectangle(width: 10, height: 5)
print("Area:", rect.area)

// MARK: - Example 3: Even or Odd
struct NumberInfo {
    var value: Int
    
    var isEven: Bool {
        value % 2 == 0
    }
    
    var parityDescription: String {
        isEven ? "Even" : "Odd"
    }
}

var num = NumberInfo(value: 7)
print("Value:", num.value, "| Parity:", num.parityDescription)

num.value = 10
print("Value:", num.value, "| Parity:", num.parityDescription)

// MARK: - Example 4: Read/Write Computed Property (Temperature)
struct Temperature {
    var celsius: Double
    
    var fahrenheit: Double {
        get {
            (celsius * 9 / 5) + 32
        }
        set {
            celsius = (newValue - 32) * 5 / 9
        }
    }
}

var temp = Temperature(celsius: 0)
print("Celsius:", temp.celsius, "| Fahrenheit:", temp.fahrenheit)

temp.fahrenheit = 212
print("Celsius after update:", temp.celsius)

// MARK: - Example 5: Clamped Score
struct Score {
    private var _value: Int = 0
    
    var value: Int {
        get { _value }
        set {
            _value = min(max(newValue, 0), 100)
        }
    }
}

var score = Score()
score.value = 120
print("Clamped high:", score.value)
score.value = -10
print("Clamped low:", score.value)
score.value = 85
print("Within range:", score.value)

// ✅ You can now continue adding your own structs for Exercises 6–11 in this same file.
