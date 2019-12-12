//: Playground - noun: a place where people can play

import UIKit

// TUPLES ("Collection ordonnée" in French)
// Tuples group multiple values into a single compound value.
// The values within a tuple can be of any type and don’t have to be of the same type as each other.

// Tuples are particularly useful as the return values of functions.

// Example of tuple :
let http404Error = (404, "Not Found")                       // A tuple of (Int, String)
print("The status code is \(http404Error.0)")               // Displays the first element
print("The status message is \(http404Error.1)")

let (statusCode, statusMessage) = http404Error              // Stores the two elements
print("The status code is \(statusCode)")

let (justTheStatusCode, _) = http404Error                   // Only the first element
print("The status code is \(justTheStatusCode)")

let http200Status = (statusCode: 200, description: " OK")
print("The status code is \(http200Status.statusCode)")

let myTuple = ("a", 3, "e", 5, 5.6, "e", 7,9,"é")
let (_,_,_,_,value,_,_,_,_) = myTuple
let value2 = myTuple.6
print(value)
print(value2)

