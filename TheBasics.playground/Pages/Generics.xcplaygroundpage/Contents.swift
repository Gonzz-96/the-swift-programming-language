import Foundation

// All these three function have identical bodies!!
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt) and anotherInt is now \(anotherInt)")

// Generic Function
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)

// Generic Types
struct IntStack {
    private var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<Element> {
    private var items: [Element]
    
    init() {
        items = []
    }
    
    init(initialElements: [Element]) {
        items = initialElements
    }
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

stackOfStrings.pop()
stackOfStrings.pop()

// extending generic types
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}

class SomeClass {
    func sayHello() {}
}
protocol SomeProtocol {
    func sayBadWords()
}

// Type constraints
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    someT.sayHello()
    someU.sayBadWords()
}


// type cosntraints in action
func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findIndex(ofString: "llama", in: strings) {
    print("The index of llama is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.24159, 0.1, 0.25])
let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])

// associated values
protocol Container {
    associatedtype Item: Equatable
    
    var count: Int { get }
    
    mutating func append(_ item: Item)
    subscript(i: Int) -> Item { get }
}

extension Array: Container where Element: Equatable {}

// Using a Protocol in its Associated Type's Constraints
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

// Video content of associated types

protocol Appendable {
    associatedtype Item
    
    var collection: [Item] { get set }
    
    func append(_ item: Item)
}

class CustomArray: Appendable {
    typealias Item = String
    
    var collection = [String]()
    
    func append(_ item: String) {
        collection.append(item)
    }
}

class NumberArray: Appendable {
    typealias Item = Int
    
    var collection: [Int] = []
    
    func append(_ item: Int) {
        collection.append(item)
    }
}


func returnFirst<T: Container>(_ arg: T) -> T.Item {
    return arg[0]
}

let item = returnFirst([0])

