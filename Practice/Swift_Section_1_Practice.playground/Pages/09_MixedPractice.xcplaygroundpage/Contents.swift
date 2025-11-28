//: [Previous](@previous)
/*:
 # ❓ Optionals
 Practice Exercises for Swift Optionals

 Swift optionals represent a value that might be **present** or **absent**.
 This page will help you practice:
 - creating optionals
 - safely unwrapping
 - optional binding
 - nil-coalescing
 - implicitly unwrapped optionals
 - optional chaining
 */

import Foundation

// -------------------------------------------------------------
// MARK: - 1. Creating Optionals
// -------------------------------------------------------------

var age: Int? = 25
var nickname: String? = nil

/*:
 ### 📝 Exercise 1
 - Change `nickname` to hold a value.
 - Create another optional of any type.
 - Print the values.
 */


// -------------------------------------------------------------
// MARK: - 2. Forced Unwrapping (❌ unsafe)
// -------------------------------------------------------------

let forced = age!

print("Forced unwrapped age: \(forced)")

/*:
 ### 📝 Exercise 2
 ⚠️ Try forcing an unwrap on `nickname` BEFORE giving it a value.
 What happens? Why is it unsafe?
 */


// -------------------------------------------------------------
// MARK: - 3. Optional Binding (if let)
// -------------------------------------------------------------

if let unwrappedAge = age {
    print("Your age is \(unwrappedAge)")
} else {
    print("Age is missing")
}

/*:
 ### 📝 Exercise 3
 - Add an optional binding check for `nickname`.
 - Print a custom message depending on if it’s nil or not.
 */


// -------------------------------------------------------------
// MARK: - 4. Optional Binding (guard let)
// -------------------------------------------------------------

func greet(_ name: String?) {
    guard let name = name else {
        print("No name provided")
        return
    }
    print("Hello, \(name)!")
}

greet("Chris")
greet(nil)

/*:
 ### 📝 Exercise 4
 Create your own function using `guard let` to:
 - unwrap an optional Int
 - print whether it’s even or odd
 */


// -------------------------------------------------------------
// MARK: - 5. Nil-Coalescing Operator (??)
// -------------------------------------------------------------

var username: String? = nil
let finalName = username ?? "Guest"

print(finalName)

/*:
 ### 📝 Exercise 5
 - Change the optional value and see how it affects the coalesced result.
 */


// -------------------------------------------------------------
// MARK: - 6. Optional Chaining
// -------------------------------------------------------------

struct UserProfile {
    var name: String
    var favoriteMovie: String?
}

var profile: UserProfile? = UserProfile(name: "Chris", favoriteMovie: nil)

// Optional chaining: safely access favoriteMovie
let movie = profile?.favoriteMovie?.uppercased()

print("Favorite movie: \(movie as Any)")   // `as Any` avoids warnings

/*:
 ### 📝 Exercise 6
 - Add a movie value and see how optional chaining changes.
 - Chain another call: `lowercased()` or `.count`
 */


// -------------------------------------------------------------
// MARK: - 7. Implicitly Unwrapped Optionals (!)
// -------------------------------------------------------------

var assumedValue: String! = "Hello"
print(assumedValue)

/*:
 ### 📝 Exercise 7
 - Set `assumedValue` to nil.
 - Try using it in a print statement. What happens?
 ⚠️ Why should implicitly unwrapped optionals be used sparingly?
 */


// -------------------------------------------------------------
// MARK: - 8. Challenge Problem
// -------------------------------------------------------------

/*:
 ## 🧠 Challenge: Safe Login System

 Create a function:

 ```swift
 func login(username: String?, password: String?) { ... }
 ```

 ### Requirements
 - Use **optional binding** (`if let` or `guard let`) to safely unwrap both `username` and `password`.
 - If either value is `nil` or an **empty string**, print: `"Missing credentials"`.
 - If both are non-nil and non-empty:
   - Check them against a stored username and password.
   - If they match, print: `"✅ Login successful. Welcome, \(username)!"`.
   - If they don’t match, print: `"❌ Invalid username or password"`.

 ### 📝 Exercise 8
 - Implement the `login(username:password:)` function using the rules above.
 - Test it with:
   - A correct username and password
   - A wrong password
   - A missing (`nil`) username
   - An empty string for password

 ```swift
 // Example calls you can use to test once you implement the function:
 login(username: "Chris", password: "password123")    // expected: success
 login(username: "Chris", password: "wrong")          // expected: invalid
 login(username: nil, password: "password123")         // expected: missing credentials
 login(username: "Chris", password: "")               // expected: missing credentials
 ```

 */

// Starter function stub for you to complete:
func login(username: String?, password: String?) {
    // TODO: Use optional binding to unwrap username and password
    // TODO: Check for nil or empty values
    // TODO: Compare against stored credentials and print the correct message
}

//: [Next](@next)
