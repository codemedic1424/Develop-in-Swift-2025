//: [Previous](@previous)
import Foundation

/*:
 # 🏗️ Structs & Classes — Practice Sheet

 This page helps you practice:
 - Creating structs
 - Creating classes
 - Stored properties
 - Initializers
 - Mutating vs non‑mutating methods
 - Value semantics vs reference semantics
 - When to use structs vs classes

 ---
 ## 1. Create a Basic Struct
 Create a struct called `Book` with:
 - title (String)
 - author (String)
 - pages (Int)

 Then create two different `Book` instances.
*/




/*:
 ---
 ## 2. Add a Mutating Method
 Add a method `addPages(_:)` that increases the page count.
 Try calling it on an instance.
*/




/*:
 ---
 ## 3. Create a Basic Class
 Create a class called `Vehicle` with:
 - make (String)
 - model (String)
 - mileage (Double)

 Then create an instance and modify the mileage.
*/




/*:
 ---
 ## 4. Class With Methods
 Add a method `drive(_ distance: Double)` that adds to the mileage.
*/




/*:
 ---
 ## 5. Value Type vs Reference Type Practice
 Do this:

 1️⃣ Create a `struct ScoreTracker` with a single Int property: `score`.  
 2️⃣ Create a `class ScoreKeeper` with a single Int property: `score`.

 Then:

 - Create two variables referencing the SAME `ScoreKeeper` instance.
 - Create two variables containing the same `ScoreTracker` struct.

 Modify one variable in each pair.
 Observe what happens.
*/




/*:
 ---
 ## 6. Challenge: Build a Mini Model

 Build **either a struct or a class** to represent a `UserProfile`:

 Required:
 - username: String  
 - age: Int  
 - isPremium: Bool  
 - loginCount: Int  

 Add:
 - an initializer
 - a method `incrementLoginCount()`
 - a method `togglePremium()`

 Create a few instances and test all behavior.
*/




//: [Next](@next)
