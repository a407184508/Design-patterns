//
//  Strategy.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Strategy {
    func doOperation(num1: Int, num2: Int) -> Int
}

class OperationAdd: Strategy {
    
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

class OperationSubstract: Strategy {
    
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
}

class OperationMultiply: Strategy {
    
    func doOperation(num1: Int, num2: Int) -> Int {
        return num1 * num2
    }
}

class ContextStrategy {

    var strategy: Strategy
    
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    
    func executeStrategy(num1: Int, num2: Int) -> Int {
        return strategy.doOperation(num1: num1, num2: num2)
    }
    
}
