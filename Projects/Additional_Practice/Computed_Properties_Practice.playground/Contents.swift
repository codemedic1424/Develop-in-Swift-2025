// 🧮 Computed Properties – Practice Template
// Use this file to complete the exercises from your “Computed Properties” practice guide.
// You can open this in Xcode or the Swift Playgrounds app (macOS or iPad).

import Foundation


// ==========================================================
// MARK: - Section 1 – Basics of Computed Properties
// ==========================================================

// Exercise 1 – Full Name
// Create a Person struct with firstName and lastName.
struct Person {
    var firstName: String
    var lastName: String
    // Add a computed property fullName -> "<firstName> <lastName>"
    var fullName: String {
        return "Hello! My name is \(firstName) \(lastName)"
    }
}
let me = Person(firstName: "Christopher", lastName: "Wilshusen")
print(me)
print(me.fullName)
//print(Person.fullName(firstName: "John", lastName: "Doe")) *Remember you have to instatiate a Person before you can print its properties.


// Exercise 2 – Rectangle Area
// Create a Rectangle struct with width and height (Double).
struct Rectangle {
    var name: String
    var width: Double
    var height: Double
    
    // Add computed property area -> width * height.
    var area: Double {
        return width * height
    }
}
let alpha = Rectangle(name: "alpha", width: 10, height: 20)
let beta = Rectangle(name: "beta", width: 25, height: 50)
let charlie = Rectangle(name: "charlie", width: 50, height: 75)

let rectangles = [alpha, beta, charlie]

for rectangle in rectangles {
    print("The area for \(rectangle.name) is \(rectangle.area) feet.")
}



// Exercise 3 – Even or Odd
// Create a NumberInfo struct with value: Int.
struct NumberInfo {
    var number: Int
    
    // Add computed property isEven -> Bool and parityDescription -> "Even"/"Odd".
    var isEven: Bool {
        if number % 2 == 0 {
            return true
        } else {
            return false
        }
    }
    var parityDescription: String {
        switch isEven {
        case true:
            return "even"
        case false:
            return "odd"
        }
    }
}
var num1 = NumberInfo(number: 1)
var num2 = NumberInfo(number: 2)
let num3 = NumberInfo(number: 567)
let nums = [num1, num2, num3]

print(num1.number)
print(num1.isEven)
print(num1.parityDescription)

for num in nums {
    print("\(num.number) is an \(num.parityDescription) number.")
}

// ==========================================================
// MARK: - Section 2 – Read-Only vs Read–Write Computed Properties
// ==========================================================

// Exercise 4 – Temperature in Celsius/Fahrenheit
// Add computed property fahrenheit with get/set logic for conversion.
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
temp.fahrenheit = 212
print("\(temp.celsius)ºC is \(temp.fahrenheit)ºF")

// Exercise 5 – Clamped Score
// Use private _value and a computed value property that clamps between 0–100.
struct Score {
    private var _value: Int = 0   // private, internal storage
    
    var value: Int {              // public, controlled interface
        get { _value }            // returns the stored number
        set {
            _value = min(max(newValue, 0), 100)  // clamps 0–100
        }
    }
}

var score = Score()
score.value = 150
print(score.value)  // prints 100, not 150

// a clamped value is simply a value constrained between two limits, ensuring it always stays valid.

// ==========================================================
// MARK: - Section 3 – Weather / Forecast Themed
// ==========================================================

// Exercise 6 – Temperature Range String ("low–highº")
struct WeatherTemperature {
    var low: Int
    var high: Int
    
    var report: String{
        get {
            return "The temperature today ranges from \(low)º to \(high)º"
        }
    }
    var tempCondition: String {
        switch high {
        case ..<60:
            return "Cold"
        case 60...84:
            return "Mild"
        case 85...:
            return "Hot"
        default:
            return "Unknown"
        }
    }
}

let mondayWeather = WeatherTemperature(low: 46, high: 78)
print(mondayWeather.high)
print(mondayWeather.low)
print(mondayWeather.report)

// Exercise 7 – Weather Summary Text ("Rainy"/"Sunny")
struct WeatherSummary {
    private var _condition: String = ""
    
    var condition: String {
        get { _condition }
        set {
            _condition = newValue.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    var summary: String {
        switch condition {
        case "clear", "sunny":
            return "Sunny"
        case "rain", "rainy", "showers", "drizzle", "storm":
            return "Rainy"
        case "cloudy", "overcast", "fog":
            return "Cloudy"
        default:
            return "Could be sunny, could be cloudy. Go check."
        }
    }
}

let monday = WeatherSummary()
print(monday.summary)
var tuesday = WeatherSummary()
tuesday.condition = "rain"
print(tuesday.summary)
print(tuesday.condition)
//trimming test
var today = WeatherSummary()
today.condition = "        rAIN     "
print(today.condition)
print(today.summary)

// Exercise 8 – High Temperature Category ("Cold"/"Mild"/"Hot")

print(mondayWeather.tempCondition)
print("The weather today is \(mondayWeather.tempCondition.lowercased()).")

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
