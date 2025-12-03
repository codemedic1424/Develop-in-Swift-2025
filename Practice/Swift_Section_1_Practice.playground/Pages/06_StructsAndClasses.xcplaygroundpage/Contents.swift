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
//struct creation
struct Book {
    var title: String
    var author: String
    var pages: Int
}
//struct instantiation
let myFavorite = Book(title: "Moby Dick", author: "Herman Millvile", pages: 927)
let yourFavorite = Book(title: "Eat, Pray, Love", author: "Elizabeth Gilbert", pages: 367)

print(myFavorite.title, myFavorite.author)

/*:
 ---
 ## 2. Add a Mutating Method
 📌 **Advanced Concept (Optional)**
 The official "Develop in Swift" curriculum does *not* introduce
 `mutating` methods yet. They appear later in the Swift Programming Language
 chapter on **Methods** under "Modifying Value Types".

 We include them here early because:

 - Structs are value types
 - Mutating methods are required when changing stored properties
 - SwiftUI models and state rely on them heavily
 - Understanding them now prevents confusion later

 If this feels slightly ahead — that’s normal. Treat this section as
 *optional enrichment* that prepares you for upcoming SwiftUI work.
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
class Vehicle {
    var make: String
    var model: String
    var mileage: Double
    
    init(make: String, model: String, mileage: Double) {
        self.make = make
        self.model = model
        self.mileage = mileage
    }
}
let myCar = Vehicle(make: "Ram", model: "1500", mileage: 65432.8)


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
struct ScoreTracker {
    var score: Int
}
class ScoreKeeper {
    var score: Int
    
    init(score: Int) {
        self.score = score
    }
}
var myScore = ScoreTracker(score: 10)
var yourScore = myScore
let sharedScoreKeeper = ScoreKeeper(score: 20)
var player1Score = sharedScoreKeeper
var player2Score = sharedScoreKeeper
player1Score.score += 5
myScore.score += 5

print(myScore, yourScore, player1Score.score, player2Score.score)

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
struct UserProfile {
    let username: String
    var age: Int
    var isPremium: Bool
    var loginCount: Int
}



//: [Next](@next)
