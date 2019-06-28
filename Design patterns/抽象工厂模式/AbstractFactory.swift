//
//  AbstractFactory.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/26.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit


protocol Shape {
    
    func draw() -> Void
}

class Rectangle: Shape {
    
    func draw() {
        print("draw a Rectangle")
    }
}

class Square: Shape {
    
    func draw() {
        print("darw a Square")
    }
}

class Circle: Shape {
    
    func draw() {
        print("darw a Circle")
    }
}



class AbstractFactory {
    func getShape(_ type: FactoryShape.ShapeType) -> Shape? {
        return FactoryShape().getShape(type)
    }
    
    func getColor(_ type: FactoryColor.ColorType) -> Color? {
        return FactoryColor().getColor(type)
    }
}

class FactoryShape: AbstractFactory {
    
    enum ShapeType {
        case Rectangle
        case Square
        case Circle
    }
    
    
    override func getShape(_ type: FactoryShape.ShapeType) -> Shape? {
        switch type {
        case .Rectangle:
            return Rectangle()
        case .Square:
            return Square()
        case .Circle:
            return Circle()
        }
    }
    
    override func getColor(_ type: FactoryColor.ColorType) -> Color? {
        return nil
    }
}

protocol Color {
    
    func fill() -> Void
}

class Red: Color {
    
    func fill() {
        print("fill Red")
    }
}

class Green: Color {
    
    func fill() {
        print("fill Green")
    }
}

class FactoryColor: AbstractFactory {
    
    enum ColorType {
        case red
        case green
    }
    
    override func getColor(_ type: FactoryColor.ColorType) -> Color? {
        switch type {
        case .red:
            return Red()
        case .green:
            return Green()
        }
    }
    
    override func getShape(_ type: FactoryShape.ShapeType) -> Shape? {
        return nil
    }
}


class FactoryProducer {
    
    enum FactoryType {
        case color
        case shape
    }
    
    func getFactory(_ type: FactoryType) -> AbstractFactory {
        switch type {
        case .color:
            return FactoryColor()
        case .shape:
            return FactoryShape()
        }
    }
}

