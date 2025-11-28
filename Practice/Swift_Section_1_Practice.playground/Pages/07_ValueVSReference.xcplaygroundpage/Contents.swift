//: [Previous](@previous)
/*:
 # 🧩 Value vs Reference Types
 Practice Exercises for Swift Structures & Classes
 
 This page will help you reinforce the difference between:
 - **Value types (struct, enum)**
 - **Reference types (class)**
 
 Work through the exercises below and run each segment as you go.
 */

import Foundation

// -------------------------------------------------------------
// MARK: - 1. Basic Value Type Behavior
// -------------------------------------------------------------

struct Point {
    var x: Int
    var y: Int
}

var a = Point(x: 1, y: 1)
var b = a  // Copy

b.x = 10

print("a.x =", a.x)   // what do you expect?
print("b.x =", b.x)   // what do you expect?

/*:
 ### 📝 Exercise 1
 - Explain why `a` did *not* change when you modified `b`.
 - This demonstrates **value semantics** — write your own definition below.
 */


// -------------------------------------------------------------
// MARK: - 2. Basic Reference Type Behavior
// -------------------------------------------------------------

class Dog {
    var name: String
    init(name: String) { self.name = name }
}

var dog1 = Dog(name: "Rex")
var dog2 = dog1  // Reference copy

dog2.name = "Buddy"

print("dog1.name =", dog1.name) // what do you expect?
print("dog2.name =", dog2.name)

/*:
 ### 📝 Exercise 2
 - Explain why *both* `dog1` and `dog2` changed.
 - This demonstrates **reference semantics** — define it below.
 */


// -------------------------------------------------------------
// MARK: - 3. Mutating Methods (Struct)
// -------------------------------------------------------------

struct Counter {
    var count: Int = 0
    
    mutating func increment() {
        count += 1
    }
}

var c1 = Counter()
var c2 = c1
c2.increment()

print("c1.count =", c1.count)  // ?
print("c2.count =", c2.count)  // ?

/*:
 ### 📝 Exercise 3
 - Why does only `c2` change?
 - Why does `mutating` matter for structs?
 */


// -------------------------------------------------------------
// MARK: - 4. Class Methods (Reference Types)
// -------------------------------------------------------------

class Score {
    var points: Int = 0
    func add() {
        points += 1
    }
}

let s1 = Score()
let s2 = s1
s2.add()

print("s1.points =", s1.points) // ?
print("s2.points =", s2.points) // ?

/*:
 ### 📝 Exercise 4
 - Why does `s1` also change here?
 */


// -------------------------------------------------------------
// MARK: - 5. Challenge: Convert Between Types
// -------------------------------------------------------------

/*:
 ### 🧠 Challenge A
 Convert this *class* into a *struct* and predict how the output changes.
 */

class Box {
    var height: Int
    init(height: Int) { self.height = height }
}

var boxA = Box(height: 5)
var boxB = boxA
boxB.height = 99

print("boxA.height =", boxA.height)
print("boxB.height =", boxB.height)

/*:
 ### 🧠 Challenge B
 Convert this *struct* into a *class* and predict changes.
 */

struct Player {
    var level: Int
}

var pA = Player(level: 1)
var pB = pA
pB.level = 42

print("pA.level =", pA.level)
print("pB.level =", pB.level)

/*:
 ### 📝 Final Reflection
 Write a few sentences:
 - When should you choose a struct?
 - When should you choose a class?
 - Which one does SwiftUI prefer—and why?
 */


//: [Next](@next)
