
enum SomeEnumeration {
    
}

enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

// matchin enumerations with switch
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue!")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

// iterating over Enumeratino cases
enum Beverage: CaseIterable {
    case coffe, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available!")

for beverage in Beverage.allCases {
    print(beverage)
}

// Associated values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarCode = Barcode.upc(8, 85909, 51226, 3)
productBarCode = .qrCode("Fell in love with a girl")

switch productBarCode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productionCode):
    print("QR code: \(productionCode)")
}

// Raw values
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed =  "\n"
    case carriageReturn = "\r"
}

let earthsOrder = Planet.earth.rawValue
let sunsetDirection = CompassPoint.west.rawValue

// Initialize from a Raw Value

let possiblePlanet = Planet(rawValue: 7)

let positionToFind = 11
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

// recursive enumerations
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
