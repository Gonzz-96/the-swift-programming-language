let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2})
reversedNames = names.sorted(by: { s1, s2 in s1 > s2})
reversedNames = names.sorted(by: { $0 > $1 })
reversedNames = names.sorted(by: >)

func someFunctionThatTakesAClosure(closure: () -> Void) -> Int {
    1
}

someFunctionThatTakesAClosure(closure: {
    
})

someFunctionThatTakesAClosure {
    
}

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

func download(picture: String, from server: String) -> String? {
    return picture
}

func loadPicture(from server: String, completion: (String) -> Void, onFailure: () -> Void) {
    if let picture = download(picture: ("photo.jpg"), from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

loadPicture(from: "SomeServer") { picture in
    print("Picture in View!")
} onFailure: {
    print("Couldn't download the next picture!")
}

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementBySeven()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()


// escaping closures
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// auto closures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())")
print(customersInLine.count)

// the @autoclosure annotation helps to pass in a value of
// the returning type of the closure, and the value will be
// automatically wrapped in a closure
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())")
}

serve(customer: customersInLine.remove(at: 0) )
