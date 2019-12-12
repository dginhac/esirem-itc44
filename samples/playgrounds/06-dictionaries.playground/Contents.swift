//: Playground - noun: a place where people can play

import UIKit

// DICTIONARIES

// A dictionary stores associations between keys of the same type
// and values of the same type in a collection with no defined ordering


var namesOfIntegers = [Int: String]()                       // namesOfIntegers is an empty [Int: String] dictionary

namesOfIntegers[16] = "sixteen"
namesOfIntegers[10] = "ten"
print (namesOfIntegers)

var airports: [String: String] = ["CDG": "Paris", "DUB": "Dublin"]    // the airports dictionary now contains 2 items

print("The airports dictionary contains \(airports.count) items.")
airports["LHR"] = "London"                                            // the airports dictionary now contains 3 items
airports["LHR"] = "London Heathrow"                                   // value for "LHR" is now "London Heathrow »

airports["APL"] = "Apple International"             // "Apple International" is not the real airport for APL, so delete it
airports["APL"] = nil                               // APL has now been removed from the dictionary

let airportCodes = [String](airports.keys)          // airportCodes is ["CDG", "DUB", "LHR"]
let airportNames = [String](airports.values)        // airportNAmes is ["Paris", "Dublin", "London Heathrow"]

print (airports)


for airport in airports {
    let code = airport.key
    let city = airport.value
    print("Code: \(code) - City: \(city)")
}
