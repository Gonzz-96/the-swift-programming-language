import Darwin

let greeting = "Hello, world!"
let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]

let newString = String(beginning)

// comparing strings
let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I"
if quotation == sameQuotation {
    print("These two strings are considered equals!")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}"
if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal!")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters aren't equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

let act1SceneCount = romeoAndJuliet.reduce(0) { count, act in
    return act.hasPrefix("Act 1") ? count + 1 : count
}

let locationCount = romeoAndJuliet.reduce((mansion: 0, cell: 0)) { count, act in
    if act.hasSuffix("Capulet's mansion") {
        return (count.mansion + 1, count.cell)
    } else if act.hasSuffix("Friar Lawrence's cell") {
        return (count.mansion, count.cell + 1)
    } else {
        return count
    }
}

let dogString = "Dog‼🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

