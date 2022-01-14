// Enumeration classes
enum Rank: Int {
    case ace = 1
    case two, three, four, five, sinx, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

func areRanksTheSame(_ one: Rank, _ another: Rank) -> Bool {
    return one.rawValue == another.rawValue
}
areRanksTheSame(Rank.ace, Rank.ace)
areRanksTheSame(Rank.three, Rank.two)

// getting enum from raw value
if let convertedRank = Rank(rawValue: 13) {
    convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// enum instances with values
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case random(String)
}

let success = ServerResponse.result("6:00 am","8:09 pm")
let failure = ServerResponse.failure("Out of cheese!")
let random = ServerResponse.random("Memes are good :3")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
case let .failure(message):
    print("Failure... \(message)")
case let .random(randomString):
    print(randomString)
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
