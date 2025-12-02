//: # Control Flow – Practice
//:
//: Work with `if`, `switch`, loops, and early exit patterns.
//: Each section includes a TODO where you will type your answer.

import Foundation

// MARK: - 1. If / Else
// TODO: Write a function that takes an Int representing a heart rate
// and prints whether it's low, normal, or high.

func checkHeartRate(_ rate: Int) {
    // TODO: Your code here
    if rate < 60 {
        print("\(rate) bpm is considered LOW")
    } else if rate >= 60 && rate < 100 {
        print("\(rate) bpm is considered NORMAL")
    } else {
        print("\(rate) bpm is considered HIGH")
    }
}
checkHeartRate(40)
checkHeartRate(65)
checkHeartRate(105)

// MARK: - 2. Switch Statements
// TODO: Use a switch to evaluate call priority (1–4) and print the meaning.

let callPriority = 3

switch callPriority {
    // TODO: Add your cases here
case 1:
    print("Alpha")
case 2:
    print("Bravo")
case 3:
    print("Charlie")
case 4:
    print("Delta")
default:
    print("ERROR: Invalid Call Priority")
}


// MARK: - 3. For Loops
// TODO: Loop over an array of unit names and print each one.

let units = ["Engine 1", "Medic 2", "Truck 1"]

for unit in units {
    // TODO: Print each unit
    print(unit)
}


// MARK: - 4. While Loop
// TODO: Count up to 5 using a while loop.

var counter = 1

// TODO: Write your while loop here
while counter <= 5 {
    print(counter)
    counter += 1
}


// MARK: - 5. Continue & Break
// TODO: Loop 1–10, skip even numbers, and stop the loop once you hit 9.

for number in 1...10 {
    // TODO: Skip even numbers, stop at 9
    if number % 2 == 0 {
        continue
    }
    print(number)
    if number == 9 {
        break
    }
}


// MARK: - 6. Early Exit (guard)
// TODO: Write a function that checks if a String? is non-empty using guard.

func printName(_ name: String?) {
    // TODO: Use guard to unwrap name
    guard let userName = name, !userName.isEmpty else {
        print("Name Missing")
        return
    }
    print("Hello, \(userName)!")
}

printName("Mike")
printName(nil)

//: [Next](@next)
