//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// SETS

// Use Sets instead of array when the order of items is not important
// need to ensure that an item only appears once

var letters = Set<Character>()                                      // letters is of type Set<Character> with 0 item
letters.insert("a")                                                 // letters now contains 1 value of type Character
letters.insert("b")
letters.insert("c")
    
print(letters)


//letters = []                                                        // letters is now an empty set

var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]  // favoriteGenres has been initialized with three initial items
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]         // Same thing
favoriteGenres.insert("Jazz")                                       // favoriteGenres now contains 4 items
favoriteGenres.remove("Rock")                                       // favoriteGenres now contains 3 items

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sorted()                                // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()                         // []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()             // [1, 9]

