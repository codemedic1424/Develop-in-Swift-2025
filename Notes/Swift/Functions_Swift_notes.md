# 📘 Topic  
Functions in Swift

### 🗓 Date  
2025-11-23

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

### 4A. Nested Functions In Swift
In Swift, a function can exist inside of another function; this is called a nested function.

#### Syntax Nested Functions Example

```swift
//outer function
func function1() {
    //code
    
    //inner function
    func function2() {
        //code
    }

}
```

#### Simple Nested Functions Example (no parameters)

```swift
//outer function
func greetMessage() {

    //inner function
    func displayName() {
    print("Good Morning Abraham!")
    }
    
    //calling inner function
    displayName()
}
//calling outer function
greetMessage() //will print "Good Morning Abraham!"
```

Inner functions are not visible outside the outer function — attempting to call `displayName()` directly will result in an error.

#### Nested Functions Example (with parameters)

```swift
//outer function
func addNumbers() {
    print("Addition")
    
    //inner function
    func display(num1: Int, num2: Int) { //in this example, we will use 5 and 10
        print("5 + 10 =", num1 + num2)
    }
    
    //calling inner function with two values
    display(num1: 5, num2: 10)
}

//calling outer function
addNumbers() //prints "Addition \n 5+10=15"
```

#### Nested Functions Example (with Return Values)

```swift
func operate(symbol: String) -> (Int, Int) -> Int {
    //inner function to add two numbers
    func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    //inner function to subtract two numbers
    func subtract(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    let operation = (symbol == "+") ? add : subtract
    return operation
}
let operation = operate(symbol: "+")
let result = operation(8, 3)
print("Result:", result)
```
Breakdown: 

In the above example, `(Int, Int) - > Int` (line 93), the return type states the outer function returns a function with two parameters of type `Int` and a return value of `Int`.
Line 95 defines an inner function that takes two variables and returns their sum. Line 96 returns the sum of the two added variables.
Next, on line 99, we created another inner function that takes two variables of type `Int` with a return value of `Int`. Line 100 returns the difference of the subtracted varibles.
Line 102 creates the variable `operation` with a ternary operator that checks if the symbol is equal to "+". If true, it 'routes' the input variables to the add function, if false, to the subtract function.
Line 103 returns the chosen function (add or subtract).
Line 105 calls `operate()` using "+" as the symbol. 
Line 106 sets the return value of operate. It will be replaced by either `add(8,3)` or `subtract(8,3)` based on the value of `symbol` passed to `operate()`
Line 107 prints the value of `result` to the console. 

### 4B. Variadic Parameters
A variadic parameter (VP) accepts zero or more values of a specified type. To indicate a variadic parameter, insert three periods after the parameter's name type. Ex. `Doube...` The values passed to a VP are made available as an array of appropriate types located in the function body. Ex. `[Double]`
A function can have multiple VP, however, the first parameter to come after a VP, must contain an argument label to discern which arguments are passed to the parameters that come after the VPs. 

#### Variadic Parameter Example:

This example calcualtes the arithmetic mean or average of a list of numbers of any length.

```swift
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
```

 

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
