//
//  MonkeyKing.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol MonkeyKing {
    func skills() -> Void
}

class Monkey: MonkeyKing  {
    func skills() {
        print("monkey")
    }
}

class Temple: MonkeyKing {
    func skills() {
        print("temple")
    }
}

class MonkeyKingDecorator: MonkeyKing {
    
    var decorator: MonkeyKing
    
    init(decorator: MonkeyKing) {
        self.decorator = decorator
    }
    
    func skills() {
        decorator.skills()
    }
}

class TempleDecorator: MonkeyKing {
    
    var decorator: MonkeyKing
    
    init(decorator: MonkeyKing) {
        self.decorator = decorator
    }
    
    func skills() {
        decorator.skills()
        BurningIncense()
    }
    
    private func BurningIncense() {
        // todo . new skills
        print("new skills")
    }
}
