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
//structs are value types and each instantiation creates a new 'copy' of the variable that acts independent of any others of the same type. 

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

//classes are reference types. dog1 inherited the name change from dog2 as they reference the same variable instance.

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

print("c1.count =", c1.count)  // 0
print("c2.count =", c2.count)  // 1

/*:
 ### 📝 Exercise 3
 - Why does only `c2` change?
 - Why does `mutating` matter for structs?
 */

//c2 was instantiated as a 'copy of c1, therefore they are independent of one another.
//mutating flag denotes the func is altering the variable, like a method.

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

print("s1.points =", s1.points) // 1
print("s2.points =", s2.points) // 1

/*:
 ### 📝 Exercise 4
 - Why does `s1` also change here?
 */

//They are reference types - referring to the same instance of the variable - thus the change affects all references to it.

// -------------------------------------------------------------
// MARK: - 5. Challenge: Convert Between Types
// -------------------------------------------------------------

/*:
 ### 🧠 Challenge A
 Convert this *class* into a *struct* and predict how the output changes.
 */

struct Box {
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

class Player {
    var level: Int
    init(level: Int) {
        self.level = level
    }
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
