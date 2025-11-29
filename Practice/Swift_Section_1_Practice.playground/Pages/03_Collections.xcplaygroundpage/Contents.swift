//: [Previous](@previous)

//: # Collections – Arrays, Sets, Dictionaries
//:
//: Practice basic operations with each collection type.

import Foundation

// MARK: - 1. Arrays
var priorities: [String] = []
// TODO: Add items, append, remove, and subscript
// Add to array
priorities += ["Alpha", "Bravo", "Charlie"]
// Append method
priorities.append("Delta")
priorities.append("Echo")
priorities.append("Gamma")
print(priorities)
// Remove method
priorities.remove(at: 5) //Gamma sits at index 5 - Gamma removed
print(priorities)
//subscript method
print(priorities[2]) // Charlie


// MARK: - 2. Sets
var stations: Set<String> = [] // or var stations =[String]()
// TODO: Insert station names and test membership
stations = [
    "Station 1",
    "Station 2",
    "Station 3"
]
print(stations)
// MARK: - 3. Dictionaries
var unitCrewCount: [String: Int] = [:]
// TODO: Add units and crew counts, then read values safely

// MARK: - 4. Mini Checkpoint
// TODO: Add another unit and loop through all entries

//: [Next](@next)
