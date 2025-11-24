# 📘 Topic  
Functions in Swift

### 🗓 Date  
YYYY-MM-DD

## 1. Summary  
Functions in Swift are self‑contained chunks of code that perform specific tasks. They can accept inputs (parameters), return outputs, and help organize and reuse logic.

## 2. Core Ideas  
- Functions encapsulate reusable logic.
- Functions can have parameters (with names and types).
- Functions can return values (single or multiple via tuples).
- Parameter labels help functions read naturally.
- Functions support default values, variadic parameters, and inout parameters.

## 3. Key Terms  
**Function:** A named block of code that performs a task.  
**Parameter:** Input value provided to a function.  
**Argument:** Actual value passed when calling the function.  
**Return type:** The type of value a function gives back.  
**Parameter label:** External name used when calling a function.  
**Inout parameter:** A parameter that allows modification of the passed‑in variable.

## 4. Concepts Explained in Plain English  
- A function groups work into a named reusable block.  
- Parameters allow you to customize what the function acts on.  
- Swift uses both parameter labels and internal names to make code readable.  
- A function may or may not return something—if not, its return type is `Void`.  
- You can return multiple values by returning a tuple.

## 5. When to Use This  
- When logic will be reused.  
- When code is getting too long—split into smaller functions.  
- When you want more readable abstraction.  
- When you need to pass information in and get results back out.

## 6. Visual Mental Model  
Think of a function like a vending machine:  
- You give inputs (parameters).  
- It does work internally.  
- You receive an output (return value).

## 7. Related Swift Topics  
- Closures  
- Methods  
- Struct and Class functions  
- Function overloading  
- Higher‑order functions (map, filter, reduce)

## 8. Common Mistakes / Gotchas  
- Forgetting parameter labels when calling a function.  
- Mismatching argument types.  
- Returning the wrong type vs. the declared return type.  
- Confusing parameter names vs. labels.  
- Not using `return` when required.

## 9. My Practice / Hands-On Work  
```swift
// Basic function
func greet(name: String) -> String {
    "Hello, \(name)!"
}

// Function with multiple parameters
func add(_ a: Int, _ b: Int) -> Int {
    a + b
}

// Function returning a tuple
func getMinMax(numbers: [Int]) -> (min: Int, max: Int) {
    (numbers.min()!, numbers.max()!)
}

// Function with a default parameter
func multiply(_ value: Int, by factor: Int = 2) -> Int {
    value * factor
}

// Variadic parameter
func average(_ numbers: Double...) -> Double {
    numbers.reduce(0, +) / Double(numbers.count)
}

// Inout parameter
func increment(_ value: inout Int) {
    value += 1
}
```

## 10. Questions I Still Have  
- When should I prefer inout over returning a new value?  
- How do functions compare to closures in performance and use cases?

## 11. References  
- Swift Book – Functions: https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions/
