//
//  Iterator.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Iterator {
    func hasNext() -> Bool
    func next() -> Any?
}

protocol Container {
    func getInerator() -> Iterator
}



class NameRepository: Container {
    
    var names = ["Robert" , "John" ,"Julie" , "Lora"]
    
    class NameIterator: Iterator {
        
        var index: Int = 0
        var names: [String]
        
        init(_ names: [String]) {
            self.names = names
        }
        
        func hasNext() -> Bool {
            if index < names.count {
                return true
            } else {
                return false
            }
        }
        
        func next() -> Any? {
            if hasNext() {
                let name = names[index]
                index += 1
                return name
            } else {            
                return nil
            }
        }
    }
    

    func getInerator() -> Iterator {
        return NameIterator(names)
    }
}
