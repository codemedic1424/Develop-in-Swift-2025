//: # Control Flow – Practice
//:
//: Work with `if`, `switch`, loops, and early exit patterns.
//: Each section includes a TODO where you will type your answer.

import Foundation

// MARK: - 1. If / Else
// TODO: Write a function that takes an Int representing a heart rate
// and prints whether it's low, normal, or high.

func checkHeartRate(_ rate: Int) {
    if rate < 60 {
        print("Low heart rate: \(rate) bpm")
    } else if rate <= 100 {
        print("Normal heart rate: \(rate) bpm")
    } else {
        print("High heart rate: \(rate) bpm")
    }
}

checkHeartRate(55)
checkHeartRate(82)
checkHeartRate(132)


// MARK: - 2. Switch Statements
// TODO: Use a switch to evaluate call priority (1–4) and print the meaning.

let callPriority = 3

switch callPriority {
case 1:
    print("🚨 Priority 1 – Life-threatening")
case 2:
    print("⚠️ Priority 2 – Serious")
case 3:
    print("📟 Priority 3 – Routine")
case 4:
    print("ℹ️ Priority 4 – Non-emergency")
default:
    print("Unknown priority")
}


// MARK: - 3. For Loops
// TODO: Loop over an array of unit names and print each one.

let units = ["Engine 1", "Medic 2", "Truck 1"]

for unit in units {
    print("Unit responding: \(unit)")
}


// MARK: - 4. While Loop
// TODO: Count up to 5 using a while loop.

var counter = 1

while counter <= 5 {
    print("Count: \(counter)")
    counter += 1
}


// MARK: - 5. Continue & Break
// TODO: Loop 1–10, skip even numbers, and stop the loop once you hit 9.

for number in 1...10 {
    if number % 2 == 0 { continue }
    if number == 9 { break }
    print("Odd number: \(number)")
}


// MARK: - 6. Early Exit (guard)
// TODO: Write a function that checks if a String? is non-empty using guard.

func printName(_ name: String?) {
    guard let name, !name.isEmpty else {
        print("❌ No name provided")
        return
    }
    print("Hello, \(name)!")
}

printName(nil)
printName("Chris")

//: [Next](@next)
