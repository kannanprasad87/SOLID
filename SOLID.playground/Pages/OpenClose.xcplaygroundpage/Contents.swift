//: [Previous](@previous)

import Foundation

// In the below example AreaCalucator got strong dependcy with shapes
// if you want to introduce a new shape, it will then requires a modification on the AreaCalculator class.

class Rectangle {
    var length: Double
    var breadth: Double
    
    init(length: Double, breadth: Double) {
        self.length = length
        self.breadth = breadth
    }
}

class Circle {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Square {
    var side: Double
    
    init(side: Double) {
        self.side = side
    }
}


class AreaCalculator {
    func calculateArea(shape: Any) -> Double {
        if shape is Rectangle {
            let rectangle = shape as! Rectangle
            return rectangle.length * rectangle.breadth
        } else if shape is Circle {
            let circle = shape as! Circle
            return  Double.pi * circle.radius * circle.radius
        } else if shape is Square {
            let square = shape as! Square
            return square.side * square.side
        }
        
        return 0
    }
}

let circle = Circle(radius: 10)
let square = Square(side: 9)
let rectangle = Rectangle(length: 5, breadth: 5)

let areaCalcualtor = AreaCalculator()
areaCalcualtor.calculateArea(shape: circle)
areaCalcualtor.calculateArea(shape: square)
areaCalcualtor.calculateArea(shape: rectangle)


// Will rewrite `AreaCalculator` to adhere open close principles.
// Introduced a protocol `Shape` which all other shapes to confirm in their implementation.
// And `AreaCalculator` will now rely on the protocol than the concrete types. So any addition of new shape doesn't need change.
// Make sure the `AreaCalculator` is made final so that it wont be closed for modification in any existing method.

protocol Shape {
    func calculateArea() -> Double
}

class OptimisedRectangle: Shape {
    var length: Double
    var breadth: Double
    
    init(length: Double, breadth: Double) {
        self.length = length
        self.breadth = breadth
    }
    
    func calculateArea() -> Double {
        return length * breadth
    }
}

class OptimisedCircle: Shape {
    var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func calculateArea() -> Double {
        return Double.pi * radius
    }
}

class OptimisedSquare: Shape {
    var side: Double
    
    init(side: Double) {
        self.side = side
    }
    
    func calculateArea() -> Double {
        return side * side
    }
}

final class OptimisedAreaCalculator {
    func areaCalculator(shape: Shape) -> Double {
        return shape.calculateArea()
    }
}

extension OptimisedAreaCalculator {
    func prettyPrintArea(shape: Shape) {
        print("Area is \(areaCalculator(shape: shape))")
    }
}

let rectangleNew = OptimisedRectangle(length: 5, breadth: 5)
let circleNew = OptimisedCircle(radius: 10)
let squareNew = OptimisedSquare(side: 9)


let optimisedAreaCalculator = OptimisedAreaCalculator()
optimisedAreaCalculator.areaCalculator(shape: rectangleNew)
optimisedAreaCalculator.areaCalculator(shape: circleNew)
optimisedAreaCalculator.areaCalculator(shape: squareNew)

optimisedAreaCalculator.prettyPrintArea(shape: rectangleNew)

//: [Next](@next)
