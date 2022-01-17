
let someString = "Some string literal value"
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop.
"""

let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""

// it's true :0
singleLineString == multilineString

let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""

let linesWithIndentation = """
    This line doesn't begin with whitespace.
        This line begins with whitespace.
    This line doesn't begin with whitespace.
    """

// special characters
let wiseWord = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//let threeDoubleQuotationMarks = """
//Escaping the frist quotation mark \"""
//Escaping all three quotation marks \"\"\"
//"""

var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty || anotherEmptyString.isEmpty {
    print("Nothing to see here")
}

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander" --> compile time error

for character in "Dog!🐶" {
    print(character, terminator: String())
}
let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print("\n\(catString)")

// concatenating strings and characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
var meme = "General Kenobi!"
var instruction = "look over"
instruction += string2
welcome.append(exclamationMark)

// string interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// unicode
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ”

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

// couting characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")

var word = "cafe"
print("The number of characters in \(word) is \(word.count)")
word += "\u{301}"
print("The number of characters in \(word) is \(word.count)")

// strinf index
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

// isnerting and removing
var welcome2 = "hello"
welcome2.insert("!", at: welcome2.endIndex)
welcome2.insert(contentsOf: " there", at: welcome2.index(before: welcome2.endIndex))

welcome2.remove(at: welcome2.index(before: welcome2.endIndex))

let range = welcome2.index(welcome.endIndex, offsetBy: -6)..<welcome2.endIndex
welcome2.removeSubrange(range)
