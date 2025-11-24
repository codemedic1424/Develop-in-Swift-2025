# 📘 Topic  
*Flow Control*

### 🗓 Date  
2025-11-24

## 1. Summary  
Flow control is how Swift decides **what code runs** and **how many times** it runs.  
It includes:

- **Branching**: `if`, `else if`, `else`, and `switch`  
- **Looping**: `for in`, `while`, `repeat { } while`  
- **Control transfer**: `break`, `continue`, `fallthrough`, `return`, `throw`  
- **Early exit & labels**: `guard`, labeled statements  
- **Availability checks**: run code only on certain OS versions  

---

## 2. Core Ideas  

- Use **conditions** (`if`, `switch`) to choose one code path.  
- Use **loops** to repeat work until done.  
- Swift’s `switch` is **exhaustive** and supports advanced **pattern matching**.  
- **guard** is for early exits to keep your code clean.  
- **control transfer statements** let you break, skip, or exit early.  
- **labels** help with nested loops.  

---

## 3. Key Terms  

**Condition** — Boolean expression that determines execution path.  
**Branching** — Choosing between code paths using `if` or `switch`.  

### for-in loop
```swift
for number in 1...3 {
    print(number)
}
```

### while loop
```swift
var count = 3
while count > 0 {
    print(count)
    count -= 1
}
```

### repeat-while loop
```swift
var attempts = 0
repeat {
    attempts += 1
    print("Attempt #\(attempts)")
} while attempts < 3
```

### switch statement
```swift
let grade = 87

switch grade {
case 90...100:
    print("A")
case 80..<90:
    print("B")
default:
    print("Below B")
}
```

### where clause
```swift
let point = (x: 3, y: 0)
switch point {
case let (x, y) where x == y:
    print("On the line x == y")
default:
    break
}
```

### Labeled loops
```swift
outerLoop: for row in 1...3 {
    for column in 1...3 {
        if row == column {
            break outerLoop
        }
    }
}
```

### Availability check
```swift
if #available(iOS 18, *) {
    // New API
} else {
    // Fallback
}
```

---

## 4. Concepts Explained in Plain English  

### If / Else  
Simple yes/no decisions.

```swift
let score = 72
if score >= 90 {
    print("Excellent")
} else if score >= 70 {
    print("Passing")
} else {
    print("Needs improvement")
}
```

### Switch  
Perfect for multiple options, enums, pattern matching.

```swift
let direction = "north"
switch direction {
case "north", "south":
    print("Vertical")
case "east", "west":
    print("Horizontal")
default:
    print("Unknown")
}
```

### Loops  
- `for in` — repeat per item  
- `while` — repeat while true  
- `repeat-while` — always runs at least once  

### Control Transfer  
- `break` — stop  
- `continue` — skip to next iteration  
- `return` — exit function  
- `throw` — exit with error  

### guard  
Clean early-exit checks.

```swift
func process(username: String?) {
    guard let name = username, !name.isEmpty else {
        print("Missing username")
        return
    }
    print("Processing \(name)")
}
```

---

## 5. When to Use This  

- **if** → simple 1–3 checks  
- **switch** → many cases, enums, pattern matching  
- **for in** → iterate sequences  
- **while** → unknown number of iterations  
- **repeat-while** → loop must run once  
- **guard** → input validation, clean top-of-function logic  
- **labels** → nested loops  
- **break / continue** → skip or stop loops  

---

## 6. Visual Mental Model  

- **If / Switch** = choosing a lane at an intersection  
- **Loops** = conveyor belt processing items  
- **guard** = bouncer checking preconditions before entering  
- **Pattern matching** = sorting mail by shapes, ranges, and labels  

---

## 7. Related Swift Topics  

- Basic Operators  
- Collection Types (arrays, dictionaries, sets)  
- Functions  
- Enumerations  
- Error Handling  

---

## 8. Common Mistakes / Gotchas  

- Forgetting that **switch must be exhaustive**  
- Expecting C-style fallthrough (Swift doesn’t fall through automatically)  
- Using `while` when `for in` is simpler  
- Creating infinite loops  
- Misusing `guard` by not exiting scope  
- Overusing labels  

---

## 9. My Practice / Hands-On Work  

1. **Grade switch** — convert numeric grade → letter  
2. **FizzBuzz** using `for in`  
3. **Login validator** using `guard`  
4. **Availability check** sample  
5. **Nested loops** with label break  

---

## 10. Questions I Still Have  

-  
-  

---

## 11. References  

- Swift Programming Language — Control Flow  
  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/
