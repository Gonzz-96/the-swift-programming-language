import Darwin


let minValue = UInt8.min
let maxValue = UInt8.max

print("\(UInt.min) - \(UInt.max)")

// type inference
let meaningOfLife = 42 // Int inferred
let pi = 3.14150 // Double inferred
let anotherPi = 3 + 0.14159 // Double inferred

// numeric literals
let decimalInteger = 17
let binaryInteger =  0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11
print("\(decimalInteger) - \(binaryInteger) - \(octalInteger) - \(hexadecimalInteger)")

// scientific notation
print("\(1.25e2) - \(1.25e-2)")
print("\(0xFp2) -  \(0xFp-2)")
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// integer conversions
//let cannotBeNegative: UInt8 = -1 --> UInt 8 can't store negative numbers, and so this will repot an error
//let tooBig: Int8 = Int8.max + 1 --> Int8 can't store a number larger than its maximum value and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// Integer and Floating-point Conversion
let three = 3
let pointOneFourOneFiveNine = 0.14159
let newPi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double

let integerPi = Int(pi)
3/4.0
