import UIKit

protocol Flyable {
    func fly() -> String
    
}
class Airplane: Flyable {
    func fly() -> String {
        return ("Airplane can fly")
    }
}
class Bird: Flyable {

    
    func fly() -> String {
        return ("Bird can fly too")
    }
}
var jet = Airplane()
jet.fly()
var tweetie = Bird()
tweetie.fly()


protocol Cook {
    func makingFood()
    
}
class Mom: Cook {
    func makingFood() { print("Pizza coming soon!") }
}
// Make a mom
var mom = Mom()
mom.makingFood() // "Pizza coming soon!"

// Make a baby
class Baby {
    var delegate: Cook? // delegate = someone with special skills
                        // automatically set to nil
}
// Create a baby
var babe = Baby()
//babe.delegate = mom
if (babe.delegate != nil) {
babe.delegate!.makingFood() // called only if not nil
}
// Same as
babe.delegate?.makingFood() // called only if not nil
// The baby doesn’t know how to cook. However, he added an optional delegate who can
// possibly cook for him. He then assigned the delegate as the mom object who can
// do alot more things than the baby itself.


public class Foo {
    public private(set) var bar: String
    init(text: String) {
        bar = text
    }
}

let foo = Foo(text: "aaaaaaa")
foo.bar
//foo.bar = "azerty"
