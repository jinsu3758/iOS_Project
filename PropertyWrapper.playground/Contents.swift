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
struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
// Print : 0
print(rectangle.height)

rectangle.height = 10
// Print : 10
print(rectangle.height)

rectangle.height = 24
// Print : 12
print(rectangle.height)


// MARK: - Example 2
struct SmallRectangle2 {
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
