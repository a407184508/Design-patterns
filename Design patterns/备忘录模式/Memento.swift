//
//  Memento.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Memento {

    var state: String
    
    init(state: String) {
        self.state = state
    }
}

class Originator {
    
    var state: String = ""
    
    func saveStateToMemento() -> Memento {
        return Memento(state: state)
    }
    
    func getStateFormMemento(memento: Memento) {
        self.state = memento.state
    }
}

class CareTaker {
    
    var mementoList = [Memento]()
    
    func add(state: Memento) {
        mementoList.append(state)
    }
    
    func get(index: Int) -> Memento {
        return mementoList[index]
    }
}
