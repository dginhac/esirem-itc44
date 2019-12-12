//: Playground - noun: a place where people can play

import UIKit

// FOR IN LOOP
var i = 8
for i in 1...5 {
    print("\(i) x 5 = \(i * 5)") // prints 1*5=5 2*5=10 ...
}
for i in 1..<5 {
    print("\(i) x 5 = \(i * 5)") // prints 1*5=5 2*5=10 ...
}

print(i)

for index in (1...9).reversed() {
    print("\(index) x 5 = \(index * 5)") // prints 9*5=45 8*5=40 ...
}

var tutu = 12
var toto = 25
for i in 1...tutu {
    print (i)
}


print (i)


let base = 3, power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)! ") // Prints Hello Anna, Hello Alex ...
}
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]

for data in numberOfLegs {
    print ("\(data.key) have \(data.value) legs ")
}
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs ") // Prints spiders have 8 legs ...
}
let loop = 10
for index in 0..<loop {
    print(index) // prints 0 1 2 ... 9
}
let interval = 2
print ("stride to")
for index in stride(from: 0, to: loop, by: interval) {
    print(index) // prints 0 2 4 6 8
}
print ("stride through")
for index in stride(from: 0, through: loop, by: interval) {
    print(index) // prints 0 2 4 6 8 10
}

print ("stride downto")
for index in stride(from: 10, to: 0, by: -2) {
    print(index) // prints 0 2 4 6 8
}


// WHILE LOOP
var number = 103
var binary = 0
var digit  = 1

while number > 0 {
    let reminder = number % 2 // add the new digit to the number
    binary = digit * reminder + binary // move the digit to the left
    print ("\(number) %2 gives a reminder equals to \(reminder), binary = \(binary)")
    digit *= 10
    // remove the last binary digit
    number /= 2
}
// Iter1: Prints "103 %2 gives a reminder equals to 1, binary = 1"
// Iter2: Prints "51 %2 gives a reminder equals to 1, binary = 11"
// Iter3: Prints "25 %2 gives a reminder equals to 1, binary = 111"
// Iter4: Prints "12 %2 gives a reminder equals to 0, binary = 0111"
// Iter5: Prints "6 %2 gives a reminder equals to 0, binary = 00111"
// Iter6: Prints "3 %2 gives a reminder equals to 1, binary = 100111"
// Iter7: Prints "1 %2 gives a reminder equals to 1, binary = 1100111"
binary // 1100111


// REPEAT-WHILE LOOP

i = 1
repeat {
    print(i)
    i+=1
} while i < 10 // equivalent to for i in 1...9

var counter = 5
var factorial = 1
repeat {
    factorial *= counter
    counter -= 1
} while counter > 0
print(factorial)  // Prints 120


// IF STATEMENT
var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}
// Prints "It's really warm. Don't forget to wear sunscreen."

if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

let temperature = 23
let pression = 1000

if temperature <= 25 && pression > 990 {
    print ("ok")
}



// SWITCH STATEMENT
let someCharacter = "a"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}



// SWITCH STATEMENT
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")


// SWITCH STATEMENT

let somePoint = (-1, 0)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis ")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis ")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box ")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box ")
} // Prints (1, 1) is inside the box

let stillAnotherPoint = (0, 12)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin ")
default:
    print("Not on an axis ")
} // Prints On an axis, 9 from the origin


let data = [2,2,2]
let data2 = (2,2,5)


switch data2 {
case (2,2,_):
        print ("ok")
default:
    print ("default")
}



// SWITCH STATEMENT WITH WHERE CLAUSE TO CHECK FOR ADDITIONAL CONDITIONS
let yetAnotherPoint = (1, -12)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"



// CONTINUE BREAK

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput) // Prints "grtmndsthnklk"

print ("continue")
for i in 1...10 {
    if (i>=4 && i<=7){
        continue
    }
    print(i) // Prints "1 2 3 8 9 10"
}

for i in 1...10 {
    if (i<4 || i>7){
        print(i) // Prints "1 2 3 8 9 10"
    }
}

print ("break")
for i in 1...10 {
    if (i>=4 && i<=7){
        break
    }
    print(i) // Prints "1 2 3"
}


// FALLTHROUGH

let integerToDescribe = 8
let value=8
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
case 4,6,8:
    description += "equal to 4,6,8"
case value:
    description += "equal to 10"
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."


