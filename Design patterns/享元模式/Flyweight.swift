//
//  Flyweight.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol ShapeFlyweight {
    func draw() -> Void
}

class DrawCircle: NSObject, ShapeFlyweight {
    
    var x: Int = 0
    var y: Int = 0
    var color: String = ""
    var radius: String = ""
    
    func draw() {
        print("x: \(x) y: \(y) color: \(color) radius: \(radius)")
    }
}

class ShapeFlyweightFactory {
    
    private let maptable = NSMapTable<NSString, DrawCircle>(keyOptions: NSPointerFunctions.Options.strongMemory, valueOptions: NSPointerFunctions.Options.weakMemory)
    
    func getCircle(color: NSString) -> DrawCircle {
        
        if let drawCircle = maptable.object(forKey: color) {
            return drawCircle 
        } else {
            let draw = DrawCircle()
            draw.color = color as String
            return draw
        }
    }
}
