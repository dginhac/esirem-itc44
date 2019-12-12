import UIKit

// FUNCTIONS with no parameter and no return values
func sayHelloWorld() {                  // Functions without a defined return type return a special value of type Void.
    print("Hello World")                // This is simply an empty tuple, which is written as
}
let tmp = sayHelloWorld()               // Prints "Hello World"
print (tmp)

// Functions with one input parameter
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")                               // Prints "Hello, Dave!"


// Function with one input parameter and one return value
func greetAgain(person: String) ->  String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
let Dave=greetAgain(person: "Dave")
print(Dave)                                        // Prints "Hello, Dave!"

// Function with several input parameters and one return values
func greetAgainAgain(firstname: String, lastname: String) ->  String {
    let greeting = "Hello, \(firstname) \(lastname) !"
    return greeting
}
greetAgainAgain(firstname: "John", lastname: "Doe")

// MORE COMPLEX FUNCTIONS
// Function with one parameter and two return values
func minMax(data: [Int]) -> (min: Int, max: Int) {
    var currentMin = data[0]
    var currentMax = data[0]
    for value in data {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax(data: [8, -6, 2, 109, 3, 71])
print("1 - min is \(bounds.min) and max is \(bounds.max)") // Prints "min is -6 and max is 109"

// A MORE COMPLEX FUNCTION WITH OPTIONAL
// Function with one parameter and two return values
func minMaxWithOptional(data: [Int]) -> (min: Int, max: Int)? {
    if data.isEmpty { return nil }
    var currentMin = data.first!
    var currentMax = data.first!
    for value in data {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var someInts = [4, -2, 20, 10, -43, 73]

let bounds2 = minMaxWithOptional(data: someInts)
if let b=bounds2 {
    print("2 - min is \(b.min) and max is \(b.max)") // Prints "min is -6 and max is 109"

}
someInts = []
let bounds3 = minMaxWithOptional(data: someInts)
if let b=bounds3 {
    print("3 - min is \(b.min) and max is \(b.max)") // Prints "min is -6 and max is 109"
}








// RENAMING THE ARGUMENT LABELS
// Function with original argument label
func greet(person:  String, hometown: String) ->  String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Steve", hometown: "Cupertino"))                // Prints "Hello Steve!  Glad you could visit from Cupertino."


// Function with modified argument label
func greetMoreExpressive(person:  String, from hometown: String) ->  String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greetMoreExpressive(person: "Steve", from: "Cupertino"))      // Prints "Hello Steve!  Glad you could visit from Cupertino."

// OMITTING THE LABELS
// Function with ommited argument label
func greetNoLabel(_ person:  String, _ hometown: String) ->  String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greetNoLabel("Steve", "Cupertino"))                           // Prints "Hello Steve!  Glad you could visit from Cupertino."

// INITIALIZING FUNCTION PARAMETERS
// Function with initialized values
func greetInit(_ person:  String,  hometown: String = "Dijon") ->  String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greetInit("d0m", hometown: "lyon"))                                             // Prints "Hello d0m!  Glad you could visit from Dijon."

func greetInit2(person:  String = "Dom",  hometown: String ) ->  String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

print(greetInit2(hometown: "Paris"))                                             // Prints "Hello d0m!  Glad you could visit from Dijon."


// Variadic parameters
// A function may have at most one variadic parameter.

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

func arithmeticMeanWithOptional(_ numbers: Double...) -> Double? {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    if numbers.count>0 {
        return total / Double(numbers.count)
    }
    else {
        return nil
    }
}
let mean1 = arithmeticMean(1, 2, 3, 4, 5)
print (mean1)           // Prints 3.0, which is the arithmetic mean of these five numbers
let mean2 = arithmeticMean(3, 8.25, 18.75)
print (mean2)           // Prints 10.0, which is the arithmetic mean of these three numbers
let mean3 = arithmeticMean()
print (mean3)           // Prints nan



// InOut functions

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporary = a
    a = b
    b = temporary
}
var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")




// Closure
var team = ["Dom", "Steve", "Tim", "Bill"]
var teamSorted = team.sorted()  // ["Bill", "Dom", "Steve", "Tim"]
print (team)
print (teamSorted)

func ReverseSort (str1: String, str2: String) -> Bool {
    return str1 > str2
}


// the sorted(by:) methods accept a closure that takes 2 arguments and return a Bool value
// true if the first argument should appear before the second one in the sorted array, and false otherwise
let t1 = team.sorted(by: ReverseSort)
print (t1)          // Prints ["Tim", "Steve", "Dom", "Bill"]


// Declaration of the Closure parameters : (s1: String, s2: String) -> Bool
// Code of the closure after "in" : return s1 > s2
let t2 = team.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2})
print (t2)          // Prints ["Tim", "Steve", "Dom", "Bill"]

// Inferring Type from Context
// The sorted(by:) method is being called on an array of strings,
// So its argument must be a function of type (String, String) -> Bool.
let t3 = team.sorted(by: { s1, s2 in return s1 > s2})
print (t3)          // Prints ["Tim", "Steve", "Dom", "Bill"]


// With implicit return
// Return keyword can be omitted because the expression (s1 > s2) returns a Bool value
let t4 = team.sorted(by: { s1, s2 in s1 > s2})
print (t4)          // Prints ["Tim", "Steve", "Dom", "Bill"]

// Shorthand Argument Names
// $0 and $1 refer to the first and second String arguments.
let t5 = team.sorted(by: { $0 > $1})
print (t5)          // Prints ["Tim", "Steve", "Dom", "Bill"]

// Operator Methods
// $0 and $1 can be omitted and you can simply pass the '>' operator
let t6 = team.sorted(by: >)
print (t6)          // Prints ["Tim", "Steve", "Dom", "Bill"]


