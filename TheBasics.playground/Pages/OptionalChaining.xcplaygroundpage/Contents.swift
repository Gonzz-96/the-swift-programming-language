import Foundation


class Person {
    var residence: Residence?
}

class Residence {
    var address: Address?
    var rooms: [Room] = []
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let john = Person()

// let roomCount = john.residence!.numberOfRooms --> runtime error, john.residence is nil

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms")
}

// accessing properties thorugh optional chaining
let gonz = Person()
if let roomCount = gonz.residence?.numberOfRooms {
    print("Gonz' residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acaica Road"
// here, since gonz.residence is nil, the right-hand side is not even evaluated
gonz.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acaica Road"
    
    return someAddress
}
gonz.residence?.address = someAddress

if gonz.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (gonz.residence?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}
