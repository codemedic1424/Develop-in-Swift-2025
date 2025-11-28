//: [Previous](@previous)

//: # Optionals – Practice
//:
//: Work with `?`, `!`, optional binding, and nil-coalescing.

import Foundation

// MARK: - 1. Declaring Optionals
// TODO: Declare an optional String for "middleName" and set it to nil.

var middleName: String? = nil

// Later, pretend we got data from a form:
middleName = "Daniel"

// MARK: - 2. Optional Binding (if let)
if let unwrappedMiddleName = middleName {
    print("Middle name is \(unwrappedMiddleName).")
} else {
    print("No middle name on file.")
}

// MARK: - 3. Nil-Coalescing Operator (??)
// TODO: Use ?? to provide a default when middleName is nil.

middleName = nil
let displayName = middleName ?? "No Middle Name"
print("Display name: \(displayName)")

// MARK: - 4. Optional Int from String
// TODO: Convert a String to Int using Int("...") and handle the optional safely.

let input = "42"
let maybeNumber = Int(input)

if let number = maybeNumber {
    print("Converted number: \(number)")
} else {
    print("Could not convert input to Int.")
}

// MARK: - 5. Mini Checkpoint
// TODO: Write a small function that takes a String? and prints either the value or "Missing".
func printOptional(_ label: String, value: String?) {
    if let value {
        print("\(label): \(value)")
    } else {
        print("\(label): Missing")
    }
}

printOptional("Nickname", value: "Echo")
printOptional("Badge Name", value: nil)

//: [Next](@next)
