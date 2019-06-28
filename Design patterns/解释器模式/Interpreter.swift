//
//  Interpreter.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Expression {
    func interpreter(_ context: String) -> Bool
}

class TerminalExpression: Expression {
    
    private var data : String
    
    init(_ data: String) {
        self.data = data
    }

    func interpreter(_ context: String) -> Bool {
        return context.contains(data)
    }
}

class OrExpression: Expression {
    
    private var expr1 : Expression
    private var expr2 : Expression
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpreter(_ context: String) -> Bool {
        return expr1.interpreter(context) || expr2.interpreter(context)
    }
}

class AndExpression: Expression {
    
    private var expr1 : Expression
    private var expr2 : Expression
    
    init(expr1: Expression, expr2: Expression) {
        self.expr1 = expr1
        self.expr2 = expr2
    }
    
    func interpreter(_ context: String) -> Bool {
        return expr1.interpreter(context) && expr2.interpreter(context)
    }
}
