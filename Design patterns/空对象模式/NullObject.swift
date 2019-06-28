//
//  NullObject.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol AbstractCustomer {
    var name: String? { get set }
    func isNil() -> Bool
}

class RealCustomer: AbstractCustomer {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    func isNil() -> Bool {
        return false
    }
}

class NullCustomer: AbstractCustomer {
    var name: String?
    
    init() {
        self.name = "null name"
    }
    
    func isNil() -> Bool {
        return true
    }
}

class CustomerFactory {
    static let names = ["Rob", "Joe", "Julie"]
    
    static func getCustomer(name: String) -> AbstractCustomer {
        for n in names {
            if n == name {
                return RealCustomer(name: n)
            }
        }
        return NullCustomer()
    }
}
