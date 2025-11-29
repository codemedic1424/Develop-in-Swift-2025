# 📘 Topic  
*Collections*

### 🗓 Date  
2025-11-23

## 1. Summary  
*Organize data using arrays, sets, and dictionaries*

## 2. Core Ideas  
- Arrays store ordered collections of values.
- Sets store unique values with no defined order.
- Dictionaries store key–value pairs for fast lookup.
- Collection types are value types (structs), so they copy on write.
- Mutability is controlled by `var` (mutable) vs. `let` (immutable).

## 3. Key Terms  
**Array** — An ordered collection of values stored in a list  
**Index** — The position of an item inside an array (starting at 0)  
**Set** — An unordered collection of unique values  
**Hash Value** — A numeric representation used to quickly look up values in sets and dictionary keys  
**Dictionary** — A collection storing key–value pairs  
**Key** — A unique identifier used to access a value in a dictionary  
**Value** — The data associated with a key in a dictionary  
**Mutability** — Whether a collection can change (`var` = mutable, `let` = immutable)  
**Copy-on-write** — A performance optimization where Swift copies a collection only when modified  
**Type Annotation** — Explicitly stating the type of a collection  
**Initializer Syntax** — Creating a collection using `Array()`, `Set()`, or `Dictionary()`  
**Iteration** — Looping through items in a collection  
**Membership Check** — Checking if a set contains a value  
**Subscript** — Accessing items using square brackets (e.g., `array[0]`, `dict["Key"]`)  

## 4. Concepts Explained in Plain English  
### Examples of Each Collection Type

#### **Array**
An ordered list of items. Items can repeat.
```swift
var numbers = [1, 2, 3, 3, 4]
var fruits: [String] = ["Apple", "Banana", "Orange"]
```

#### **Set**
An unordered collection of unique values.
```swift
var uniqueNumbers: Set<Int> = [1, 2, 3, 3, 4]   // duplicates removed → {1, 2, 3, 4}
var pets: Set<String> = ["Dog", "Cat", "Rabbit"]
```

#### **Dictionary**
A collection of key/value pairs.
```swift
var ages: [String: Int] = [
    "Alice": 30,
    "Bob": 25,
    "Chris": 35
]

var airportCodes = [
    "LAX": "Los Angeles",
    "JFK": "New York",
    "SAV": "Savannah"
]
```

##### Additional Real‑World Examples

**Example: Tracking Assigned EMS Crew Members**
```swift
let crews = [
    "Medic1": ["Alice", "Bob"],
    "Medic2": [],
    "Medic3": ["Charlie"]
]
```

**Example: Checking Whether a Unit Has a Crew**
- A dictionary lookup returns an *optional* `[String]?`
- You can check if a crew exists and is not empty:
```swift
if let crew = crews["Medic1"], !crew.isEmpty {
    print("Medic1 has a crew assigned.")
} else {
    print("Medic1 has no crew.")
}
```

**Example: Printing All Units That Have a Crew**
```swift
for (unit, crew) in crews {
    if !crew.isEmpty {
        print("\(unit) has a crew assigned.")
    }
}
```
```

## 5. When to Use This  
```
### When to Use Each Collection Type

**Use an Array when…**
- Order matters  
- You need to access items by position  
- Duplicates are allowed  
- You frequently iterate through items in sequence  
- Example: a list of lessons, daily temperatures, or to‑do items  

**Use a Set when…**
- You need only *unique* values  
- Order does *not* matter  
- You need fast membership checking (`set.contains(value)`)  
- Example: tracking unique badge names, visited chapters, or tags  

**Use a Dictionary when…**
- You need to associate keys with values  
- You want fast lookups based on a unique identifier  
- Order is not important  
- Example: mapping airport codes to cities, usernames to scores, or lesson IDs to completion states  
```

## 6. Visual Mental Model
**Array** → 📚 A bookshelf  
- Books stay in order  
- You can grab one by index  
- The same book can appear more than once  

**Set** → 🎟️ A bowl of unique tickets  
- Order doesn’t matter  
- Duplicates are removed automatically  
- Very fast membership checking  

**Dictionary** → 🗂️ A filing cabinet  
- Each folder (key) holds one document (value)  
- Keys must be unique  
- Fast lookup by key  

## 7. Related Swift Topics
- Optionals  
- Control Flow (`for-in`, while loops)  
- Type Inference  
- Enums as Dictionary Keys  
- Protocols (`Sequence`, `Collection`, `MutableCollection`)  
- Higher-Order Functions (`map`, `filter`, `reduce`)  
- Copy-on-write behavior  

## 8. Common Mistakes / Gotchas
- Forgetting dictionary lookups return optionals  
- Trying to index into a Set (`mySet[0]` invalid)  
- Mutating a collection declared with `let`  
- Assuming dictionaries preserve order  
- Choosing the wrong collection type for your needs  
- Mixing types inside a collection  

## 9. My Practice / Hands-On Work
- Practice modifying arrays: append, remove, insert  
- Convert an array to a set to see duplicate removal  
- Create dictionaries mapping codes/IDs to values  
- Iterate over arrays, sets, and dictionaries to see behavior  
- Build a small script using all three collection types  

## 10. Questions I Still Have
- When should enums be dictionary keys?  
- How does copy-on-write actually work?  
- When to choose sets vs. arrays with `.contains`?  
- Are ordered sets available in Swift?  
- Best practices for passing large collections around?  

## 10.1 Diagrams (Most Compatible Format)

Markdown itself cannot draw diagrams natively, but the most widely‑compatible approach is to use **ASCII diagrams**.  
These render correctly in Xcode, GitHub, Apple Notes, and plain text editors.

### Array (ordered, indexed)

```
Index:   0     1     2     3
Values: [A] – [B] – [C] – [D]
```

### Set (unordered, unique)

```
{ A, B, C }
(think “a loose pile of items, no order”)
```

### Dictionary (key → value pairs)

```
"NY"  →  "New York"
"LAX" →  "Los Angeles"
"SAV" →  "Savannah"
```

ASCII diagrams = maximum compatibility across all your apps.

## 11. References  
-  https://docs.swift.org/swift-book/documentation/the-swift-programming-language/collectiontypes/
