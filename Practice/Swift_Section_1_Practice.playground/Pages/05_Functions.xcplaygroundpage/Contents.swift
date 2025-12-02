//: [Previous](@previous)
// 05 — Functions Practice
// This page contains hands‑on exercises to reinforce Swift function concepts.

func divider() {
    print("--------------------------")
}

// -------------------------------------------------------------
// MARK: 1. Create a simple function
// -------------------------------------------------------------

// TODO: Write a function called greet(name:) that returns
// "Hello, <name>!" when passed a string.
// Example: greet(name: "Chris") -> "Hello, Chris!"

func greet(name: String){
    print("Hello, \(name)!")
}
greet(name: "Chris")

divider()
// -------------------------------------------------------------
// MARK: 2. Functions with multiple parameters
// -------------------------------------------------------------

// TODO: Write a function called add(a:b:) that returns the sum of two integers.
// Example: add(a: 3, b: 4) -> 7
func add(a: Int, b: Int) {
    print(a + b)
}
add(a: 2, b: 3)

divider()
// -------------------------------------------------------------
// MARK: 3. Omitting external parameter names
// -------------------------------------------------------------

// TODO: Create a function multiply that uses _ for both parameters.
// Example: multiply(3, 5) -> 15 (no labels)
func multiply(_ a: Int, _ b: Int) {
    print(a * b)
}
multiply(5, 3)

divider()
// -------------------------------------------------------------
// MARK: 4. Default parameter values
// -------------------------------------------------------------

// TODO: Build a function log(message:prefix:) where prefix defaults to "[INFO]".
// Example: log(message: "App started") -> "[INFO] App started"
//          log(message: "Warning!", prefix: "[WARN]") -> "[WARN] Warning!"
func log(message: String, prefix: String = "[INFO]") {
    print("\(prefix) \(message)!")
}

log(message: "Application started")
log(message: "Sytax Error", prefix: "[ERR]")

divider()
// -------------------------------------------------------------
// MARK: 5. Inout parameters
// -------------------------------------------------------------

// TODO: Create a function increment(_ value: inout Int) that adds 1
// to the provided integer.
// Example:
// var counter = 0
// increment(&counter)
// counter == 1
var counter = 0
print("Pre-function: \(counter)")
func increment(_ value: inout Int) {
    value += 1
}

increment(&counter)
print("Post-function: \(counter)")
divider()
// -------------------------------------------------------------
// MARK: 6. Nested functions — SCAFFOLD
// -------------------------------------------------------------

// TODO: Write a function makeMultiplier(by:) that returns a new function.
// Example:
// let double = makeMultiplier(by: 2)
// double(10)  // → 20

func makeMultiplier(by value: Double) -> (Double) -> Double {

    // 1. Define a nested function that:
    //    - accepts a number
    //    - multiplies it by `value`
    //    - returns the result
    func generatedFunction(number: Double) -> Double {
         return number * value
    }

    // 2. Return the nested function
    return generatedFunction
}

let double = makeMultiplier(by: 2)
print(double(10))
let triple = makeMultiplier(by: 3)
print(triple(10))
divider()
// -------------------------------------------------------------
// MARK: 6A. Nested Functions — Return a String
// -------------------------------------------------------------

// TODO: Write a function makeGreeter(for:) that:
//  - takes a name as input
//  - returns a nested function
//  - that nested function returns "Hello, <name>!"
//
// Example:
// let greetChris = makeGreeter(for: "Chris")
// greetChris()   // → "Hello, Chris!"
func makeGreeter(for name: String) -> () -> String {
    // Nested function:
    // - Captures: `name` from the outer function
    // - Parameters: none
    // - Returns: A greeting string using the captured `name`
    // - Behavior: Each call returns "Hello, <name>!"
    func greeter() -> String {
        return "Hello, \(name)!"
    }
    return greeter
}
let greetChris = makeGreeter(for: "Chris")
print(greetChris())
divider()

// -------------------------------------------------------------
// MARK: 6B. Nested Functions — Add Then Multiply
// -------------------------------------------------------------

// TODO: Write a function addThenMultiply(add:multiplyBy:) that:
//  - defines a nested function `calculate(_:)`
//  - calculate(x) should first add the `add` value to x
//    then multiply that sum by `multiplyBy`
//  - returns the nested function
//
// Example:
// let transform = addThenMultiply(add: 2, multiplyBy: 5)
// transform(3)   // → (3 + 2) * 5 = 25
func addThenMultiply(add: Int, multiplyBy: Int) -> (Int) -> Int {
    // Nested function:
    // - Captures: `add` and `multiplyBy`
    // - Parameters: `number` (the input value)
    // - Returns: (number + add) * multiplyBy
    // - Behavior: Performs an add-then-multiply transform
    func calculate(_ number: Int) -> Int {
        (number + add) * multiplyBy
    }
    return calculate
}
let transform = addThenMultiply(add: 5, multiplyBy: 2)
print(transform(10)) // prints "30"
divider()
// -------------------------------------------------------------
// MARK: 6C. Nested Functions — Choose Operation
// -------------------------------------------------------------

// TODO: Write a function operationSelector(_ name: String) that returns
//  a nested function based on the `name`:
//
//  - "double" → nested function returns x * 2
//  - "square" → nested function returns x * x
//  - otherwise → nested function returns x unchanged
//
// Example:
// let op = operationSelector("square")
// op(5)  // → 25
func operationSelector(_ name: String) -> (Int) -> Int {
    // Nested function:
    // - Captures: nothing
    // - Parameters: `x`
    // - Returns: x * x
    // - Behavior: Squares the input
    func square(_ x: Int) -> Int {
        x * x
    }
    
    // Nested function:
    // - Captures: nothing
    // - Parameters: `x`
    // - Returns: x * 2
    // - Behavior: Doubles the input
    func double(_ x: Int) -> Int {
        x * 2
    }
    if name == "square" {
        return square
    } else if name == "double"{
        return double
    } else {
       return { x in x }
    }
}
let op = operationSelector("square")
print(op(5))
let op2 = operationSelector("double")
print(op2(5))
let op3 = operationSelector("other")
print(op3(5))

//The swifty version of the above:
//func operationSelector(_ name: String) -> (Int) -> Int {
//    func square(_ x: Int) -> Int { x * x }
//    func double(_ x: Int) -> Int { x * 2 }
//    func identity(_ x: Int) -> Int { x }
//
//    switch name {
//    case "square": return square
//    case "double": return double
//    default:       return identity
//    }
//}
divider()
// -------------------------------------------------------------
// MARK: 6D. Nested Functions — Counter Generator
// -------------------------------------------------------------

// TODO: Write a function makeCounter(startAt:) that:
//  - stores an internal `count` variable
//  - returns a nested function that increments count by 1
//  - and returns the updated value each time
//
// Example:
// let counter = makeCounter(startAt: 10)
// counter()   // → 11
// counter()   // → 12
// counter()   // → 13
func makeCounter(startAt: Int) -> () -> Int {
    var count = startAt
    // Nested function:
    // - Captures: `count`, a mutable variable from the outer scope
    // - Parameters: none
    // - Returns: Updated count after incrementing by 1
    // - Behavior: Each call mutates `count` and returns the new value
    func increment() -> Int {
        count += 1
        return count
    }
    return increment
}
let counter1 = makeCounter(startAt: 10)
print(counter1())
print(counter1())
print(counter1())
divider()
// -------------------------------------------------------------
// MARK: 6E. Nested Functions — Capturing Multiple Values
// -------------------------------------------------------------

// TODO: Write a function makePolynomial(a:b:c:) that:
//  - returns a nested function representing:
//        f(x) = ax² + bx + c
//
// Example:
// let poly = makePolynomial(a: 1, b: 2, c: 1)
// poly(3)  // → 16  (1*9 + 2*3 + 1)
func makePolynomial(a: Int, b: Int, c: Int) -> (Int) -> Int {
    // Nested function:
    // - Captures: coefficients `a`, `b`, and `c`
    // - Parameters: `x`
    // - Returns: Result of polynomial ax² + bx + c
    // - Behavior: Computes the polynomial using captured coefficients
    func f(_ x: Int) -> Int {
        (a * (x * x)) + (b * x) + c
    }
    return f
}
let poly = makePolynomial(a: 1, b: 2, c: 1)
print(poly(3))
// -------------------------------------------------------------
// MARK: 7. Function types & passing functions
// -------------------------------------------------------------

// TODO: Write a function applyTwice(_ fn: (Int) -> Int, to value: Int)
// Example:
// func square(_ x: Int) -> Int { x * x }
// applyTwice(square, to: 3)  // → 81 (square(square(3)))


// -------------------------------------------------------------
// MARK: 8. Variadic parameters
// -------------------------------------------------------------

// TODO: Write a function sum(_ numbers: Int...) that returns the total.
// Example: sum(1, 2, 3, 4) -> 10


// -------------------------------------------------------------
// MARK: 9. Throwing functions
// -------------------------------------------------------------

// TODO: Create a function divide(_ a: Int, by b: Int) throws that
// throws an error when b == 0, otherwise returns a / b.


// -------------------------------------------------------------
// MARK: 10. Practice Challenge
// -------------------------------------------------------------
//
// Build a mini “math toolkit” containing:
// - a square function
// - a cube function
// - a function that selects one of the above using a string parameter
//
// Example:
// let result = math("cube", 3)  // → 27


//: [Next](@next)
