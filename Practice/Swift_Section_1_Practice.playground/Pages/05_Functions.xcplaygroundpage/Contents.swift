//: [Previous](@previous)
// 05 — Functions Practice
// This page contains hands‑on exercises to reinforce Swift function concepts.

// -------------------------------------------------------------
// MARK: 1. Create a simple function
// -------------------------------------------------------------

// TODO: Write a function called greet(name:) that returns
// "Hello, <name>!" when passed a string.
// Example: greet(name: "Chris") -> "Hello, Chris!"


// -------------------------------------------------------------
// MARK: 2. Functions with multiple parameters
// -------------------------------------------------------------

// TODO: Write a function called add(a:b:) that returns the sum of two integers.
// Example: add(a: 3, b: 4) -> 7



// -------------------------------------------------------------
// MARK: 3. Omitting external parameter names
// -------------------------------------------------------------

// TODO: Create a function multiply that uses _ for both parameters.
// Example: multiply(3, 5) -> 15 (no labels)


// -------------------------------------------------------------
// MARK: 4. Default parameter values
// -------------------------------------------------------------

// TODO: Build a function log(message:prefix:) where prefix defaults to "[INFO]".
// Example: log(message: "App started") -> "[INFO] App started"
//          log(message: "Warning!", prefix: "[WARN]") -> "[WARN] Warning!"


// -------------------------------------------------------------
// MARK: 5. Inout parameters
// -------------------------------------------------------------

// TODO: Create a function increment(_ value: inout Int) that adds 1
// to the provided integer.
// Example:
// var counter = 0
// increment(&counter)
// counter == 1


// -------------------------------------------------------------
// MARK: 6. Nested functions
// -------------------------------------------------------------

// TODO: Write a function makeMultiplier(by:) that returns a new function.
// Example:
// let double = makeMultiplier(by: 2)
// double(10)  // → 20


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
