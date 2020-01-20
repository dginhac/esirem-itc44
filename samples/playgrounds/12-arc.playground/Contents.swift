import UIKit

var str = "Hello, playground"

// A simuler sous xCode car le Playground gere mal les references strong / weak !!

class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    weak var tenant: Person?
    init (unit:String) {
        self.unit = unit
        print("\(unit) is being initialized")
    }
    deinit {
        print("apartment \(unit) is being deinitialized" )
        
    }
}

//var reference1: Person?
//var reference2: Person?
//var reference3: Person?

//reference1 = Person(name: "John Appleseed")
// Prints "John Appleseed is being initialized"

//reference2 = reference1
//reference3 = reference1

// print (reference1!.name)


//reference1 = nil
//print (reference2!.name)
//reference2 = nil
//print (reference3!.name)

//reference3 = nil
// Prints "John Appleseed is being deinitialized"


var john : Person?
var logement: Apartment?

john = Person(name: "john")
logement = Apartment(unit: "rue de l'université")

john!.apartment = logement
logement!.tenant = john


//john!.apartment = nil
//logement!.tenant = nil
john = nil

logement = nil





class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
        print ("Client \(name) is initialized")
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

var dom: Customer?
dom = Customer(name: "D. Ginhac")
dom!.card = CreditCard(number: 1234_5678_9012_3456, customer: dom!)
dom = nil


