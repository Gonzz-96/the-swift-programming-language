
// arrays
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(3)
someInts = []

var threeDoubles = Array(repeating: 0.0, count: 3)

// array concat
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

// array literals
var shoppingList = ["Eggs", "Milk"] // type [String] inferred

print("The shopping list contains \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}

shoppingList.append("Flour")

shoppingList += ["Baking powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList.count

shoppingList.insert("Mapple Syrup", at: 0)

let mapleSyrup = shoppingList.remove(at: 0)

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

for item in shoppingList {
    print("\(item) ", terminator: "")
}
print()

// iterate indexed
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// sets
var letters = Set<Character>()
print("letters is type of Set<Character> with \(letters.count) items")

letters.insert("a")
letters = [] // set literal

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

// accessing/modifying a set
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it!")
} else {
    print("I never much cared for that.")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
print()

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

// set operations

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // 0...10
oddDigits.intersection(evenDigits).sorted() // []
oddDigits.subtracting(singleDigitPrimeNumbers) // [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers) // [1, 2, 9]

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
print()

// dictionaries
var namesOfIntegers: [Int: String] = [:] // dictionary literal
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

var airports = [
    "YYZ": "Toronto Pearson",
    "DUB": "Dublin",
]

// accessing and modifying a dictionary
print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport isn't in the airports dictionary.")
}

airports["APL"] = "Apple International"
airports["APL"] = nil // remove key-value pair by assigning nil for that key!

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airpot's name is \(removedValue)")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airpot name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
