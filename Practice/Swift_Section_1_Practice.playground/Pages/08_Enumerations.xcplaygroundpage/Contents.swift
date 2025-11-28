//: [Previous](@previous)
/*:
 # 🧩 Enumerations (Enums)
 Practice Exercises for Swift Enumerations

 Swift enums let you define a group of related values in a **type-safe** way.
 This page will help you practice:
 - basic enum syntax
 - associated values
 - raw values
 - switch statements
 - methods inside enums
 */

import Foundation

// -------------------------------------------------------------
// MARK: - 1. Basic Enum Definition
// -------------------------------------------------------------

enum CompassPoint {
    case north, south, east, west
}

var direction = CompassPoint.north

/*:
 ### 📝 Exercise 1
 - Change `direction` to another value.
 - Add a new case: `.northEast`
 - Add a print statement that prints what direction you are heading.
 */


// -------------------------------------------------------------
// MARK: - 2. Switching on Enums
// -------------------------------------------------------------

func describe(_ direction: CompassPoint) {
    switch direction {
    case .north:
        print("Heading north ⬆️")
    case .south:
        print("Heading south ⬇️")
    case .east:
        print("Heading east ➡️")
    case .west:
        print("Heading west ⬅️")
    }
}

describe(.east)

/*:
 ### 📝 Exercise 2
 - Add your new case from Exercise 1 to the switch.
 - Give it a unique message.
 */


// -------------------------------------------------------------
// MARK: - 3. Associated Values
// -------------------------------------------------------------

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var product = Barcode.upc(8, 85909, 51226, 3)
var ticket = Barcode.qrCode("ABCD-1234-XYZ")

/*:
 ### 📝 Exercise 3
 - Create a new instance `.qrCode("yourName")`.
 - Write a switch that extracts and prints the associated values.
 */

switch product {
case let .upc(numberSystem, manufacturer, productCode, checkDigit):
    print("UPC: \(numberSystem), \(manufacturer), \(productCode), \(checkDigit)")
case let .qrCode(code):
    print("QR: \(code)")
}


// -------------------------------------------------------------
// MARK: - 4. Raw Values
// -------------------------------------------------------------

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

print("Earth is planet number \(Planet.earth.rawValue)")

/*:
 ### 📝 Exercise 4
 - Print the raw value for Mars.
 - Create a new `Planet(rawValue: 2)` and print which planet it is.
 */


// -------------------------------------------------------------
// MARK: - 5. Enum Methods
// -------------------------------------------------------------

enum Device {
    case iPhone(model: String)
    case iPad(model: String)
    
    func description() -> String {
        switch self {
        case .iPhone(let model):
            return "iPhone \(model)"
        case .iPad(let model):
            return "iPad \(model)"
        }
    }
}

let myDevice = Device.iPhone(model: "15 Pro")
print(myDevice.description())

/*:
 ### 📝 Exercise 5
 - Create another Device (iPad).
 - Call the `.description()` method.
 */


// -------------------------------------------------------------
// MARK: - 6. Challenge
// -------------------------------------------------------------

/*:
 ### 🧠 Challenge: Build your own enum

 Create an enum called **LearningStatus** with cases like:
 - `notStarted`
 - `inProgress(percent: Int)`
 - `completed(date: String)`

 Then:
 1. Make one instance of each case.
 2. Write a switch that prints helpful messages for each case.
 3. Consider how this pattern relates to your Learning Dashboard app.
 */


//: [Next](@next)
