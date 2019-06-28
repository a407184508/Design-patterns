//
//  Composite.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Employee: CustomStringConvertible  {
    
    var name: String = ""
    var dept: String = ""
    var salary: Int = 0
    
    var subordinates = [Employee]()
    
    init(name: String, dept: String, salary: Int) {
        self.name = name
        self.dept = dept
        self.salary = salary
    }
    
    func add(_ e: Employee) {
        subordinates.append(e)
    }
    
    func remove(_ e: Int)  {
        subordinates.remove(at: e)
    }
    
    var description: String {
        return "name: \(name) dept:\(dept) salary: \(salary)"
    }
}
