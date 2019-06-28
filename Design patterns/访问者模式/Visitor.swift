//
//  Visitor.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol ComputerPart {
    func accept(_ part: ComputerPartVisitor) -> Void
}

class Keyboard: ComputerPart {
    
    func accept(_ part: ComputerPartVisitor) {
        part.visit(self)
    }
}

class Monitor: ComputerPart {
    
    func accept(_ part: ComputerPartVisitor) {
        part.visit(self)
    }
}


class Mouse: ComputerPart {
    
    func accept(_ part: ComputerPartVisitor) {
        part.visit(self)
    }
}

class Computer: ComputerPart {
    
    var parts: [ComputerPart]
    
    init() {
        parts = [Keyboard(), Mouse(), Monitor()]
    }
    
    func accept(_ part: ComputerPartVisitor) {
        for p in parts {
            p.accept(part)
        }
        part.visit(self)
    }
}

protocol ComputerPartVisitor {
    
    func visit(_ keyboard: Keyboard)
    func visit(_ monitor: Monitor)
    func visit(_ mouse: Mouse)
    func visit(_ computer: Computer)
}

class ComputerPartDisplayVisitor: ComputerPartVisitor {
    
    func visit(_ keyboard: Keyboard) {
        print("Displaying Keyboard.")
    }
    
    func visit(_ monitor: Monitor) {
        print("Displaying Monitor.")
    }
    
    func visit(_ mouse: Mouse) {
        print("Displaying Mouse.")
    }
    
    func visit(_ computer: Computer) {
        print("Displaying Computer.")
    }
}
