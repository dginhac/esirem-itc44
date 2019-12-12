import UIKit

// OPTIONAL
let possibleNumber = "123"                              // "123" is a String that can be interpreted as an Int
let convertedNumber = Int(possibleNumber)               // Try to convert to Int -> Generate an Optional Int with 123 as value
                                                        // convertedNumber is inferred to be of type "Int?", ie "optional Int"
// Same thing but explicit declaration of the Optional Int
let explicitConvertedNumber:Int? = Int(possibleNumber)

// Nil value
var serverResponseCode: Int? = 404                // serverResponseCode is a Int value of 404
serverResponseCode = nil                          // serverResponseCode now contains no value
var surveyAnswer: String?                         // surveyAnswer is automatically set to nil

var test: Int?


// In Objective-C, nil is a pointer to a nonexistent object.
// In Swift, nil is not a pointer. It is the absence of a value of a certain type


// Always make sure that an optional contains a non-nil value before using ! to force-unwrap its value.
if convertedNumber != nil {
    print ("\(convertedNumber!) is the integer value of \(possibleNumber)")
}
else {
    print ("\(possibleNumber) is not an integer ")
}

let possibleNumber2 = "azerty"                          // "azerty" is a String
let convertedNumber2 = Int(possibleNumber2)             // Try to convert to Int -> Generate an Optional Int with nil as value

print(convertedNumber2)
print(convertedNumber2!) // Error because of nil

if convertedNumber2 != nil {
    print ("\(convertedNumber2!) is  the integer value of \(possibleNumber2)")
}
else {
    print ("\(possibleNumber2) is not an integer ")
}


// Optional binding = "declaration optionnelle" in french
// actualNumber is an Int and not an Int? if possibleNumber contains un Int
if let actualNumber = Int(possibleNumber) {
    print ("\(actualNumber) is a number")
}
else {
    // actualNumber does not exist here because it is only defined in the body of the if statement
    print ("The string \"\(possibleNumber)\" could not be converted to an integer")
}
if let actualNumber2 = Int(possibleNumber2) {
    print ("\(actualNumber2) is a number")
}
else {
    // actualNumber does not exist here because it is only defined in the body of the if statement
    print ("The string \"\(possibleNumber2)\" could not be converted to an integer")
}

var shoppingList: [String] = ["Eggs", "Milk", "Chocolate Spread", "Cheese", "Butter"]
print ("first = " + shoppingList.first!) // dangerous
if let first=shoppingList.first {
    print ("first = \(first)")
}
else {
    print ("first does not exist")
}

var shoppingList2: [String] = []
if let last=shoppingList2.last {
    print ("last = " + last)
}
else {
    print ("last does not exist")
}




// Implicitly Unwrapped Optionals

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark

// Rather than placing an exclamation mark after the optional’s name each time you use it,
// you can place an exclamation mark after the optional’s type when you declare it
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark

if assumedString != nil {
    print(assumedString!) // Prints "An implicitly unwrapped optional string."
    print(implicitString) // Prints "An implicitly unwrapped optional string."
}

// Optional Binding + implicitly unwrapped optional
if let definiteString = assumedString {
    print(definiteString) // Prints "An implicitly unwrapped optional string."
}
