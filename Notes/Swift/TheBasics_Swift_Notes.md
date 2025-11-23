# 📘 Topic  
*The Basics*

### 🗓 Date  
2025-11-23

## 1. Summary  
*Work with common kinds of data and write basic syntax*

## 2. Core Ideas  
-  Basic Data Types: Int, Double, Bool, and String
-  Primary collection types: Array, Set and Dictionary

## 3. Key Terms  
**Variable:** `var` :Used to store a value and refer to it by an identifying name.
**Constant:** `let` :Same as variables, but values are immutable.
**Type Annotations:** Can be provided when you declare variables and constants. They provide clarity of the declarations data type or ValueType.
**Tuples:** Tuples group multiple values into a single compound value.
**Optionals:** Represents two possibilities. A value may or may not be present.

## 4. Concepts Explained in Plain English  
- *Type Annotations:* `let a: String = "alpha" `  //In plain English: let constant 'a' of type 'String' equal "Alpha"
    - Type annotations are not required when and initial value is provided. Swift infers the ValueType based on the value provided otherwise a type annotation is required.
- *Naming Constants and Variables:*  
    - Names should be clear, descriptive, and follow Swift conventions.  
    - Use **camelCase** for most identifiers (`userName`, `totalCalories`).  
    - Avoid abbreviations unless they are obvious (`URL`, `ID`).  
    - Names **cannot contain spaces**, begin with a number, or use reserved keywords unless wrapped in backticks.  
    - Constants (`let`) should describe values that never change.  
    - Variables (`var`) should describe values that can change over time.  
    
- *Tuples:* Tuples can be of any type and the members do not have to be of the same type. Tuples are best for bundling small related values together temporarily — not for long-term data models.
    - `let http404Error = ( 404, "Not Found")` member 1 is an Int, member 2 is a String.
    - Tuple Decomp: 
        -`let (statusCode, statusMessage) = http404Error`
        -Results in `statusCode = 404` and `statusMessage = "Not Found"`
        - If you need only part of a tuples members use an underscore. (or index numbers: `http404Error.0`)
        -`let (justTheStatusCode, _) = http404Error` 
        -Results in  `justTheStatusCode = 404`
    -Tuple members can be name in the declaration
        - `let http200Status = (statusCode: 200, description: "OK")`

- *Optionals:* Optionals represent a value that may or may not be present.  
    - Declare an optional with `?`  
        - `var petName: String?` // This may contain a string or may be nil  
    - Check an optional using `if let` (safe unwrapping)  
        ```swift
        let number: Int? = 10
        if let unwrappedNumber = number {
            print("The number is \(unwrappedNumber)")
        } else {
            print("No number found")
        }
        ```
    - Force unwrap with `!` (unsafe — avoid unless guaranteed non-nil)  
        ```swift
        let guaranteed: String? = "Hello"
        print(guaranteed!) // Works, but crashes if nil
        ```
    - Optional chaining allows safe access into optional values  
        ```swift
        let person: Person? = Person(name: "Chris")
        print(person?.name)
        ```
    - Nil-coalescing (`??`) provides a default value when an optional is nil  
        ```swift
        let input: String? = nil
        let final = input ?? "Default value"
        print(final) // "Default value"
        ```

## 5. When to Use This  
-  `var` and `let` can be used anytime a value needs to be stored and refered to later on.
- `print()` can be used to print the value of any var/let to the console.

## 6. Visual Mental Model  
- Think of Swift types like labeled boxes:
    - `let` = a sealed box (cannot change contents)
    - `var` = an open box (you can replace the contents)
    - Tuples = a single box with multiple compartments
    - Optionals = a box that might be empty or contain something — you must check before opening

## 7. Related Swift Topics  
- Type Inference
- String Interpolation
- Basic Operators
- Control Flow (if, switch)

## 8. Common Mistakes / Gotchas  
- Forgetting to unwrap optionals before use
- Mixing `let` and `var` incorrectly
- Not giving enough detail in variable names
- Assuming type inference always picks the type you expect

## 9. My Practice / Hands-On Work  
- Write 3 variables and 3 constants with clear names
- Create a tuple and decompose it
- Practice converting between String, Int, and Double
- Create an optional, safely unwrap it, and print the result

## 10. Questions I Still Have  
- When should I choose a tuple vs a struct?
- How strict should I be with type annotations?
- Are optionals used frequently in real-world apps?

## 11. References  
-  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/thebasics/
