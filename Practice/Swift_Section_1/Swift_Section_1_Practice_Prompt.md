

# 🧪 Swift Practice Sheet — Core Topics

A consolidated practice worksheet covering:

- ✅ The Basics  
- ✅ Flow Control  
- ✅ Functions  
- ✅ Collections  
- ✅ Structures & Classes  
- ✅ Value vs Reference Types  
- ✅ Enumerations  

---

## 1. 🧱 The Basics

### Exercises

1. Create variables and constants for:
   - Your name  
   - Your age  
   - Whether you're a student (Bool)

2. Rewrite these using explicit types:

   ```swift
   let city: String = "Hilton Head"
   let zip: Int = 29926
   let temperature: Double = 72.5
   ```

3. Interpolate values into a sentence:

   ```swift
   let name = "Chris"
   let age = 35
   let city = "Hilton Head"

   let sentence = "\(name) is \(age) years old and lives in \(city)."
   print(sentence)
   ```

4. Fix the types so this compiles:

   ```swift
   let tripsPerYear = 3
   let avgCostPerTrip = 425.50
   // let total = tripsPerYear + avgCostPerTrip  // ❌ won't compile
   ```

---

## 2. 🔀 Flow Control

### Exercises

1. Temperature `if` chain:

   ```swift
   let temp = 82

   if temp < 50 {
       print("Cold")
   } else if temp < 80 {
       print("Warm")
   } else {
       print("Hot")
   }
   ```

2. Convert this to a `switch`:

   ```swift
   let grade = 87

   switch grade {
   case 90...100:
       print("A")
   case 80..<90:
       print("B")
   case 70..<80:
       print("C")
   case 60..<70:
       print("D")
   default:
       print("F")
   }
   ```

3. Loop practice:

   ```swift
   for i in 1...10 {
       print(i)
   }

   let names = ["Chris", "Alex", "Sam"]
   for name in names {
       print("Hello, \(name)!")
   }

   var random = 0
   repeat {
       random = Int.random(in: 1...10)
       print("Rolled: \(random)")
   } while random != 5
   ```

4. Use `where` with a loop:

   ```swift
   let scores = [45, 72, 89, 53, 99, 60]

   for score in scores where score >= 80 {
       print("High score: \(score)")
   }
   ```

---

## 3. 🔧 Functions

### Exercises

1. Greeting function:

   ```swift
   func greet(name: String) -> String {
       "Hello, \(name)!"
   }
   ```

2. Even / odd checker:

   ```swift
   func isEven(_ number: Int) -> Bool {
       number % 2 == 0
   }
   ```

3. Calculate tip:

   ```swift
   func calculateTip(amount: Double, percent: Double) -> Double {
       amount * percent
   }
   ```

4. Overloaded functions:

   ```swift
   func square(_ x: Int) -> Int { x * x }
   func square(_ x: Double) -> Double { x * x }
   ```

5. Function with default parameter:

   ```swift
   func log(message: String, prefix: String = "[INFO]") {
       print("\(prefix) \(message)")
   }
   ```

---

## 4. 📚 Collections

### Arrays

```swift
var scores = [72, 81, 65, 90, 88]
scores.append(95)
scores.sort()
scores.removeFirst()
```

### Sets

```swift
var animals: Set = ["Dog", "Cat", "Bird"]
animals.insert("Dog")

let moreAnimals: Set = ["Fish", "Cat"]
let allAnimals = animals.union(moreAnimals)
```

### Dictionaries

```swift
var airports = [
    "ATL": "Atlanta",
    "JFK": "New York",
]

airports["LAX"] = "Los Angeles"
airports["JFK"] = "John F. Kennedy International"
```

---

## 5. 🏗️ Structures & Classes

### Struct Example

```swift
struct Workout {
    var type: String
    var duration: Int
    var caloriesBurned: Int

    mutating func addFiveMinutes() {
        duration += 5
    }
}
```

### Class Example

```swift
class Device {
    var name: String
    var version: String

    init(name: String, version: String) {
        self.name = name
        self.version = version
    }
}
```

---

## 6. 🧬 Value vs Reference Types

### Struct Copy

```swift
struct Point { var x: Int; var y: Int }

var p1 = Point(x: 5, y: 5)
var p2 = p1
p1.x = 10
```

### Class Reference

```swift
class User {
    var name: String
    var level: Int
    init(name: String, level: Int) {
        self.name = name
        self.level = level
    }
}
```

---

## 7. 🎛️ Enumerations

```swift
enum Weather {
    case sunny, cloudy, rainy
    case windy(speed: Int)
}
```

```swift
enum Grade: String {
    case A, B, C, D, F
}
```

---

## 🎯 Bonus Challenge

Create a mini learning tracker model using structs, enums, and functions.
