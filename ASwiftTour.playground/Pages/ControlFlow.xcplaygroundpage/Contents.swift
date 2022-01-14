
// for loop
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

// optional variables
var optionalString: String? = "Hello"
print(optionalString == nil)

//var optionalName: String? = "John Applessed"
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, unknown person! :)"
}
print(greeting)


// ?? operator
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi, \(nickname ?? fullName)"
print(informalGreeting)

// switch statement and when keyword
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raising and make ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everything tasted good in soup.")
}

// Iterate over dictionaries
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while lopp
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

var total = 0
// (...) is inclusive, whereas (..<) is exclusive
for i in 0...4 {
    total += i
}
print(total)
