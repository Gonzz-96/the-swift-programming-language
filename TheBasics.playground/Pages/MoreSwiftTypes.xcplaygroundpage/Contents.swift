
// Bool type
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible!")
}

let i = 1
if i == 1  {
    print("this will run")
}

// Tuple type
let http404Error = (404, "Not found")
let (statusCode, statusMessage) = http404Error
print("The sataus code is \(statusCode)")
print("The status msg is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("Thes tatus code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// namming the elements in the tuple
let http200Status = (statusCode: 200, description: "Ok")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // this is an Int?

// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? // this is nil by default

// if statements and forced unwrapping

if convertedNumber != nil {
    print("convertedNumber contains some integer -> \(convertedNumber!)")
}

// optional binding
if let actualNumber = Int(possibleNumber) {
    print("The string  \"\(possibleNumber)\" has integer value of \(actualNumber)")
} else {
    print("The string  \"\(possibleNumber)\" couldn't be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

// implicitly unwrapped optionals
let possibleString: String? =  "An optional string"
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString
let optionalString = assumedString

// error handling
func canThrowAnError() throws {
    // this functio may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients([String])
}

func makeASandwich() throws {
    // make a perfect sandwich
}
func eatASandwich() {
    
}

do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    // washDishes()
} catch SandwichError.missingIngredients(_) {
    // buyGroceries(ingredients)
}

// assertions and preconditions
// assertions -> evaluated  only in debug builds, production builds ignore them
// preconditions -> evaluated in both debug and production builds
let age = 25
assert(age >= 0, "A person's age can't be less than zero!") // this will fail

if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age > 0 {
    print("You can rida the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero")
}


let index = 1
precondition(index > 0, "Index must be greater than zero.")
