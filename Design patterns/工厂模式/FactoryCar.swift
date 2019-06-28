//
//  FactoryCar.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/26.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol CreateCar {
    
    func createCar() -> Void
}

class FactoryCar: NSObject {
    
    enum CarType {
        case Mercedes
        case Audi
        case BMW
    }
    
    open func getCar(_ type: CarType) -> CreateCar {
        switch type {
        case .Mercedes:
            return Mercedes()
        case .Audi:
            return Audi()
        case .BMW:
            return BMW()
        }
    }
    
}

class Mercedes: CreateCar {
    
    func createCar() {
        print("create a Mercedes")
    }
}

class Audi: CreateCar {
    
    func createCar() {
        print("create a Audi")
    }
}

class BMW: CreateCar {
    
    func createCar() {
        print("create a BMW")
    }
}
