//: [Previous](@previous)

//: # Optionals – Practice
//:
//: Work with `?`, `!`, optional binding, and nil-coalescing.

import Foundation

// MARK: - 1. Declaring Optionals
// TODO: Declare an optional String for "middleName" and set it to nil.

var middleName: String? = nil

// MARK: - 2. Optional Binding (if let)
// TODO: Use optional binding (if let) to safely unwrap middleName.

if let unwrappedMiddleName = middleName {
    print("The middle name is \(unwrappedMiddleName)")
} else {
    print("The middle name does not exist.")
}

// MARK: - 3. Nil-Coalescing Operator (??)
// TODO: Use ?? to provide a default when middleName is nil.

let coalessedMiddleName = middleName ?? "Error: No middle name is present."
print(coalessedMiddleName)

// MARK: - 4. Optional Int from String
// TODO: Convert a String to Int using Int("...") and handle the optional safely.
let age: String? = nil

if let ageString = age, let integerAge = Int(ageString) {
    print("The age is \(integerAge).")
} else {
    print("No age provided or the value is not a valid number.")
}

// MARK: - 5. Mini Checkpoint
// TODO: Write a small function that takes a String? and prints either the value or "Missing".
func optionalOutput(message: String?) {
    if let goodMessage = message {
        print(goodMessage)
    } else {
        print("Missing")
    }
}

optionalOutput(message: "Smoke")
//: [Next](@next)
