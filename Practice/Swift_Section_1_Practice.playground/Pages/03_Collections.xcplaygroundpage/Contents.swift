//: [Previous](@previous)

//: # Collections – Arrays, Sets, Dictionaries
//:
//: Practice basic operations with each collection type.

import Foundation

// MARK: - 1. Arrays
// TODO: Create an array of call priorities and practice append, remove, and subscripting.

var priorities = ["Low", "Medium", "High"]
priorities.append("Critical")
print("All priorities: \(priorities)")

let firstPriority = priorities[0]
print("First priority: \(firstPriority)")

priorities.remove(at: 1)
print("After removal: \(priorities)")

// MARK: - 2. Sets
// TODO: Create a set of unique station names.

var stations: Set<String> = ["Station 1", "Station 2", "Airport"]
stations.insert("HQ")
stations.insert("Station 2") // duplicate, will be ignored
print("Stations: \(stations)")

// Check membership
if stations.contains("Airport") {
    print("✈️ Airport station is active.")
}

// MARK: - 3. Dictionaries
// TODO: Map unit name -> crew count.

var unitCrewCount: [String: Int] = [
    "Engine 1": 3,
    "Truck 1": 4
]

unitCrewCount["Medic 1"] = 2
print("Unit crews: \(unitCrewCount)")

// Read a value safely
if let medic1Crew = unitCrewCount["Medic 1"] {
    print("Medic 1 crew size: \(medic1Crew)")
} else {
    print("No crew info for Medic 1.")
}

// MARK: - 4. Mini Checkpoint
// TODO: Add one more unit and then loop over all units to print their crew sizes.

unitCrewCount["Battalion 1"] = 1

for (unit, crew) in unitCrewCount {
    print("🚒 \(unit): \(crew) personnel")
}

//: [Next](@next)
