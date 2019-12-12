//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// ARRAYS

var someInts = [0,1,2,3]
var someOtherInts: [Int] = [0,1,2,3]
var someOtherInts2 = [Int]()                                      // Empty array of Int
someOtherInts2.append(3)                                          // someOtherInts2 now contains 1 value of type Int
someOtherInts2.append(4)
someOtherInts2.append(7)
someOtherInts2.insert(10, at: 2)
someOtherInts2.insert(20, at: 2)
someOtherInts2 = []                                               // someOtherInts2 is now an empty array of Int



var threeDoubles = Array(repeating: 0.0, count: 3)          // threeDoubles is of type [Double],
//and equals [0.0, 0.0, 0.0]
var anotherFiveDoubles = Array(repeating: 2.5, count: 5)
// is equals [2.5, 2.5, 2.5, 2.5, 2.5]
var eightDoubles = threeDoubles + anotherFiveDoubles         // eightDoubles is inferred as [Double]
// and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5, 2.5, 2.5]


var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")                                // shoppingList now has 3 items,
// so you can make pancakes
shoppingList += ["Baking Powder"]                           // shoppingList now contains 4 items
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]    // contains 7 items
print (shoppingList)

shoppingList[4...6] = ["Bananas", "Apples"]                 // now contains 6 items
var firstItem = shoppingList[0]                             // firstItem = "Eggs"
var firstItem2 = shoppingList.first
var lastItem = shoppingList.last
var lastItem2 = shoppingList[shoppingList.count-1]

shoppingList[2] = "Six eggs"
shoppingList.insert("Maple Syrup", at: 0)                   // "Maple Syrup" is now the first item
let mapleSyrup = shoppingList.remove(at: 0)                 // Item 0 has just been removed
let apple = shoppingList.removeLast()                       // Last item has just been removed
shoppingList.removeAll()
shoppingList = []
print (shoppingList)
