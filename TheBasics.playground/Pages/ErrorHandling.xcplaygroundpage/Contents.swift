import Foundation

enum VendingMachingError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachingError.insufficientFunds(coinsNeeded: 5)

func canThrowErrors() throws -> String {
    "Hello"
}

func cannotThrowErrors() -> String {
    "Hello"
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11),
    ]
    
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachingError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachingError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachingError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}


let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// do-catch
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Sucess! Yum!")
} catch VendingMachingError.outOfStock {
    print("Invalid selection.")
} catch VendingMachingError.invalidSelection {
    print("Out of Stock.")
} catch VendingMachingError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachingError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beet-Flavored Chips")
} catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachingError.invalidSelection, VendingMachingError.insufficientFunds, VendingMachingError.outOfStock {
        print("Invalid selection, out of stock, or not enough money.")
    }
}

func someThrowingFunction(shouldThrow: Bool = true) throws -> Int {
    if shouldThrow {
        throw VendingMachingError.outOfStock
    } else {
        return 10
    }
}

let x = try? someThrowingFunction(shouldThrow: true)

let y: Int?
do {
    y = try someThrowingFunction(shouldThrow: true)
} catch {
    y = nil
}

assert(x == y, "x and y don't have the same value")
