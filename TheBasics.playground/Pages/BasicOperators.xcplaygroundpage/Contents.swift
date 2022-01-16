
// assignment operator
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)

// the assignent operator doesn't return a value
// if x = y { is not valid

1 + 2
5 - 2
2 * 3
10.0 / 2.5

 a &+ b // overflow operator
"hello, " + "world" // equals "hello, world"

9 % 4 // remainder operator

let three = 3
let minusThree = -three
let plusThree = -minusThree

let minusSix = -6
let alsoMinuxSix = +minusSix

var a2 = 1
a2 += 2

// comparison operators
1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

class Person { }
let p = Person()
p === p // true, the same object
p !== Person() // true, different referenced object
p === Person()

let name = "world"
if name == "world" {
    print("Hello, world!")
} else {
    print("I'm sorry \(name), but I don't recognize you!")
}

(1, "zebra") < (2, "apple")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

("blue", -1) < ("purple", 1)
// ("blue", false) < ("purple", true) -> error, < operator cannot be applied to bools

// ternary operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

// nil-coalescing operator
let defaultColorName = "red"
var userDefinedColorName: String? // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName

// range operators
for i in 1...5 { // includes 5
    print("\(i) times 5 is \(i * 5)")
}

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}

// one-sided ranges
for name in names[2...] {
    print(name)
}


for name in names[...2] {
    print(name)
}

for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)
range.contains(-100)

 // logical operators
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED!")
}

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

// combining logical operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}
