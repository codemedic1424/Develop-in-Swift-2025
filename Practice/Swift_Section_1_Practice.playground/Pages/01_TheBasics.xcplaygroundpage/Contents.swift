//: [Previous](@previous)

//: # The Basics – Practice
//:
//: Warm up with constants, variables, type annotations, and string interpolation.

import Foundation

// MARK: - 1. Constants & Variables
// TODO: Declare a constant for your first name and a variable for how many Swift sessions you've done this week.

let firstName = "Chris"
var swiftSessionsThisWeek = 5

// Change the variable a couple of times:
swiftSessionsThisWeek = 6
swiftSessionsThisWeek += 1




// MARK: - 2. Type Annotations
// TODO: Add explicit type annotations for each of these values.

let age: Int = 32
let piApprox: Double = 3.14
let isOnShift: Bool = false
let greeting: String = "Hello, World!"

// MARK: - 3. String Interpolation
// TODO: Create a string that combines at least 3 of the above values.

let statusMessage = "Hey, \(firstName)! Did you know that pi is approx. \(piApprox) and you completed \(swiftSessionsThisWeek) Swift sessions this week."

print(statusMessage)


// MARK: - 4. Tuple Practice
// TODO: Create a tuple representing a call: (callId: Int, priority: String, location: String)

let callInfo = (
    callId: 01,
    priority: "Delta",
    location: "123 N. Main Street"
)

print(callInfo)

// MARK: - 5. Mini Checkpoint
// TODO: Change one of your values and print a new status line describing the change.

swiftSessionsThisWeek = 8

print("`swiftSessionsThisWeek` was changed to '8' from '7'. This is possibile because the variable is mutable.")


//: [Next](@next)
