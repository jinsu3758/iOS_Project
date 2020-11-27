import UIKit

@propertyWrapper
struct TwelveOrLess {
    private var number: Int
    
    init() {
        self.number = 0
    }
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 12)}
    }
    
}


// MARK: - Example 1
//struct SmallRectangle {
//    @TwelveOrLess var height: Int
//    @TwelveOrLess var width: Int
//}
//
//var rectangle = SmallRectangle()
//// Print : 0
//print(rectangle.height)
//
//rectangle.height = 10
//// Print : 10
//print(rectangle.height)
//
//rectangle.height = 24
//// Print : 12
//print(rectangle.height)
//
//rectangle.width = 12
//// Print : 12
//print(rectangle.width)


// MARK: - Example 2
struct SmallRectangle3 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}


//struct SmallRectangle2 {
//    var height: Int  {
//        didSet {
//            height = min(height, 12)
//        }
//        willSet {
//            height = min(newValue, 12)
//        }
//    }
//    var width: Int
//}
//
//var rectangle2 = SmallRectangle2(height: 13, width: 1)
//// Print : 13
//print(rectangle2.height)
//
//rectangle2.height = 10
//// Print : 10
//print(rectangle2.height)
////
//rectangle2.height = 24
//// Print : 12
//print(rectangle2.height)
////
////rectangle2.width = 12
////// Print : 12
////print(rectangle2.width)
//
//struct Small {
//    var height: Int
//    var widht: Int
//}

//var small = Small()


@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
    
    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var rectangle = ZeroRectangle()

struct Test {
    lazy var test: Int = {
        return 50
    }()
}

var test = Test()

print(test.test)
test.test = 10
print(test.test)


//@propertyWrapper
//public struct Field<Value> {
//    public let name: String
//    private var record: [String : Value]?
//    private var cachedValue: Value?
//
//    public init(name: String) {
//        self.name = name
//    }
//
//    public mutating func configure(record: [String:Value]) {
//        self.record = record
//    }
//
//    public var wrappedValue: Value {
//        mutating get {
//            if cachedValue == nil { fetch() }
//            return cachedValue!
//        }
//
//        set {
//            cachedValue = newValue
//        }
//    }
//
//    public var projectedValue: Self {
//        get { self }
//        set { self = newValue }
//      }
//
//    public mutating func flush() {
//        if let value = cachedValue {
//            self.record!.updateValue(value, forKey: name)
//        }
//    }
//
//    public mutating func fetch() {
//        cachedValue = record![name]
//    }
//}
//
//public struct Person {
//  @Field(name: "first_name") public var firstName: String
//  @Field(name: "last_name") public var lastName: String
//}
//
//var jinswift = Person()
//jinswift.$firstName.configure(record: [:])
//jinswift.firstName = "Jin"
//
////jinswift.lastName = "Swift"
//jinswift.$firstName.flush()


@propertyWrapper
public struct Field<Value> {
    public let name: String
    private var record: [String : Value]?
    private var cachedValue: Value?
    
    public init(name: String) {
        self.name = name
        self.record = [:]
    }
    
    public var wrappedValue: Value {
        mutating get {
            if cachedValue == nil { fetch() }
            return cachedValue!
        }
        
        set {
            cachedValue = newValue
        }
    }
    
    public var projectedValue: Self {
        get { self }
        set { self = newValue }
      }
    
    public mutating func flush() {
        if let value = cachedValue {
            self.record!.updateValue(value, forKey: name)
        }
    }
    
    public mutating func fetch() {
        cachedValue = record![name]
    }
}

public struct Person {
  @Field(name: "first_name") public var firstName: String
  @Field(name: "last_name") public var lastName: String
}

var jinswift = Person()
jinswift.firstName = "Jin"

//jinswift.lastName = "Swift"
jinswift.$firstName.flush()

