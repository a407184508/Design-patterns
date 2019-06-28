//
//  CompositeEntityPattern.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class DependentObject1 {
    var data: String?
}

class  DependentObject2 {
    var data: String?
}

class CoarseGrainedObject {
    var do1 = DependentObject1()
    var do2 = DependentObject2()
    
    func setData(data1: String, data2: String) {
        do1.data = data1
        do2.data = data2
    }
    
    func getData() -> [String] {
        return [do1.data!, do2.data!]
    }
}

class CompositeEntity {
    
    var cgo = CoarseGrainedObject()
    
    func setData(data1: String, data2: String) {
        cgo.setData(data1: data1, data2: data2)
    }
    
    func getData() -> [String] {
        return cgo.getData()
    }
}

class ClientEntity {
    var compositeEntity = CompositeEntity()
    
    func printData() {
        for str in compositeEntity.getData() {
            print("data: \(str)")
        }
    }
    
    func setData(data1: String, data2: String) {
        compositeEntity.setData(data1: data1, data2: data2)
    }
}
