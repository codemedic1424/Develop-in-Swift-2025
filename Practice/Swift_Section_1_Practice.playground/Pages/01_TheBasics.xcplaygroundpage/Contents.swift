//: [Previous](@previous)

//: # The Basics – Practice
//:
//: Warm up with constants, variables, type annotations, and string interpolation.

import Foundation

// MARK: - 1. Constants & Variables
// TODO: Declare a constant for your first name and a variable for how many Swift sessions you've done this week.

let firstName = "Chris"
var swiftSessionsThisWeek = 0

// Change the variable a couple of times:
swiftSessionsThisWeek = 2
swiftSessionsThisWeek = 3

print("🧑‍💻 \(firstName) has completed \(swiftSessionsThisWeek) Swift sessions this week.")

// MARK: - 2. Type Annotations
// TODO: Add explicit type annotations for each of these values.

let age: Int = 34
let piApprox: Double = 3.14
let isOnShift: Bool = false
let greeting: String = "Hello, Swift!"

// MARK: - 3. String Interpolation
// TODO: Create a string that combines at least 3 of the above values.

let statusMessage = "Name: \(firstName), Age: \(age), On shift: \(isOnShift)"
print(statusMessage)

// MARK: - 4. Tuple Practice
// TODO: Create a tuple representing a call: (callId: Int, priority: String, location: String)

let callInfo = (callId: 1424, priority: "High", location: "Hilton Head Island")
print("📟 Call \(callInfo.callId) – \(callInfo.priority) priority at \(callInfo.location).")

// MARK: - 5. Mini Checkpoint
// TODO: Change one of your values and print a new status line describing the change.

swiftSessionsThisWeek = 4
print("Updated: \(firstName) has now completed \(swiftSessionsThisWeek) Swift sessions this week.")

//: [Next](@next)
