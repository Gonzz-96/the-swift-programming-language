
func greet(person: String) -> String {
    return "Hello, \(person)!"
}

print(greet(person: "Gonz"))
print(greet(person: "Mona"))
print(greet(person: "Yuyo"))

// no-parameters function
func sayHelloWorld() -> String {
    return "Hello, world!"
}

print(sayHelloWorld())

// compound return values
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("\(bounds.min) *** \(bounds.max)")
}

func greeting(for person: String) -> String {
    "Hello, \(person)!"
}

func anotherGreeting(for person: String) -> String {
    return "Hello, \(person)!"
}

print(greeting(for: "Dave"))
print(anotherGreeting(for: "Dave"))

// function argument labels and parameters names
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // no body
}
someFunction(firstParameterName: 1, secondParameterName: 2)

func someFunction(argumentLabel parameterName: Int) {
    // no body
}
someFunction(argumentLabel: 1)

func greet(person: String, from hometown: String) -> String {
    "Hello \(person)! Glad you could visit from \(hometown)"
}
print(greet(person: "Bill", from: "Cupertino"))

// no argument label
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    
}
someFunction(1, secondParameterName: 2)

// default parameters
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// variadic parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt = \(someInt) and anotherInt = \(anotherInt)")

// functino types
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")

// function types as parameters type
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

// function types as return types
func stepForward(_ input: Int) -> Int {
    input + 1
}
func stepBackward(_ input: Int) -> Int {
    input - 1
}
func chooseStepFunction(backward: Bool) -> ((Int) -> Int) {
    backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("Zero!")
