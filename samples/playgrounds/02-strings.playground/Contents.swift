//: Playground - noun: a place where people can play

import UIKit

// STRINGS
let someString = "Some string literal value"
var emptyString = ""                     // empty string literal
var anotherEmptyString = String()        // empty string with initializer syntax
var anotherNotEmptyString = String("test")
var yetAnotherEmptyString:String

var variableString = "Hello"
variableString += " world"               // String mutability - Error with a constant String
variableString.append(" again")
variableString = variableString.capitalized(with: nil)
print(variableString)


let label = "The width is "              // Create a String
let width = 94                           // Create an Int
var widthLabel = label + String(width)   // Create a new String by concatenation
widthLabel = label + "\(width)"

print (width)
print ("Width is \(width)")


let apples = 3 ; let oranges = 5         // Two Int - Use semicolon for separation
// Addition of two Int and then creation of a new String
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
fruitSummary.lowercased()
fruitSummary.uppercased()
fruitSummary.capitalized

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)                                  // Prints "Cat!🐱"

let 🐱 = "cat"
let 😎 = "glasses"
let stuff = 🐱 + " with " + 😎
print (stuff)


