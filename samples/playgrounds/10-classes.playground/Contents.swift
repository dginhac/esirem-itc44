//: Playground - noun: a place where people can play

import UIKit

// Classes and Structures
struct Resolution {                  // Uppercase for the type of the struct
    var width = 0                    // lowaerCase for the variables
    var height = 0
}
class VideoMode {                    // Uppercase for the type of the class
    var resolution = Resolution()    // Initializer
    var interlaced = false
    var frameRate: Double = 0.0
    var name:  String?
}

// Basic Initializer Syntax
let someResolution = Resolution()
let someVideoMode = VideoMode()

// Accessing properties
print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"
let vga = Resolution(width: 640, height: 480)


// Initializer for Structure types
// Do not forget : Structures are values !!!!

let hd = Resolution(width: 1920, height: 1080)  // Constant
print("hd is  \(hd.width) pixels wide")
var cinema = hd     // cinema is a new structure in which hd data are copied.
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"





let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."


