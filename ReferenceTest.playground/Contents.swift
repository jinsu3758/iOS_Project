import UIKit


class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}
 
class Apartment {
    let name: String
    let number: Int
    
    unowned var tenant: Person?
    
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    
    deinit { print("\(name) #\(number) is being deinitialized") }
}

var jinsu: Person? = Person(name: "jinsu")
var prugio: Apartment? = Apartment(name: "Prugio", number: 1)

jinsu?.apartment = prugio
prugio?.tenant = jinsu

jinsu = nil
// jinsu is being deinitialized
prugio = nil
// Prugio #1 is being deinitialized


