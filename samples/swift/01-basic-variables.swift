//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// BASIC VARIABLES
// Declaring Constants and Variables
var test: Int
test = 0

print (test)

var meaningOfLife=40              // Create a variable and init to 42
meaningOfLife = 42                  // Modify the value
var x=0.0, y=0.0, z=0.0             // Declare multiple variables
let myConstant = 20                 // Create a constant
// myConstant = 21                     // Error - Prints "change 'let' to 'var' to make it mutable"

// Type annotations
let implicitInteger = 70            // Create an Int - Type is inferred
let implicitDouble = 70.0           // Create a Double - Type is inferred
let explicitDouble: Double = 70.0     // Create a Double - Type is specified
var WelcomeMessage: String          // Create an empty String
WelcomeMessage = "hello"            // Give the String a value
var red, green, blue: Double        // Create empty Doubles
// var black                           // Prints "error: type annotation missing in pattern

let π = 3.14159                     // Unicode
var radius = 3.0
var perimeter = 2*π*radius

let three = 3                                       // Create an Int
let pointOneFourOneFiveNine = 0.14159               // Create an double
let pi = Double(three) + pointOneFourOneFiveNine    // pi is inferred as a double
// three is converted to Double

let pi2 = three + Int(pointOneFourOneFiveNine)

let a = 3, b=4
let c = a/b

let d=pointOneFourOneFiveNine
let e=Int(d)
let f=round(d)

let orangesAreOrange = true              // Create a Bool
let turnipsAreDelicious = false; let p: Int = 6




// Integers
// Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.

// 8 bits
let minU8Value = UInt8.min      // 0
let maxU8Value = UInt8.max      // 255 = 0b11111111
let min8Value = Int8.min        // -128
let max8Value = Int8.max        // 127


// display Int into series of bits
print(String(max8Value, radix:2))
// in hexa
print(String(max8Value, radix:16))
print(String(format: "%x", max8Value))

// On a 32-bit platform, Int is the same size as Int32
//On a 64-bit platform, Int is the same size as Int64.
let minInt = Int.min        // -9223372036854775807
let maxInt = Int.max        // 9223372036854775807
let minUInt = UInt.min      // 0
let maxUInt = UInt.max      // 18446744073709551615

let min32Value = Int32.min  // -2147483648
let max32Value = Int32.max  // 2147483647
let min64value = Int64.min  // -9223372036854775808
let max64value = Int64.max  // 9223372036854775808

//let moreThan32 = max32Value + 1  // error
//let lessThan32 = min32Value - 1  // error

// Real numbers: Float or Double

// Double represents a 64-bit floating-point number.
// Float represents a 32-bit floating-point number.
// Real = significand * type.radix ** exponent
let piDouble: Double = 3.1415926
print (piDouble.significand)
print (piDouble.exponent)
print (Double.radix)

let Value: Float = 21.5
print (Value.significand)
print (Value.exponent)
print (Float.radix)

