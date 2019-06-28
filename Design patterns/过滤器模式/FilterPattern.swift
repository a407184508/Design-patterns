//
//  FilterPattern.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Person: Equatable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name
    }
    
    
    var name: String = ""
    var gender: String = ""
    var maritalStatus: String = ""
    
    
    init(name: String, gender: String, maritalStatus: String) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
}

protocol Criteria {
    func meetCriteria(persons: Array<Person>) -> Array<Person>
}

class CriteriaMale: Criteria {
    func meetCriteria(persons: Array<Person>) -> Array<Person> {
        var ps = Array<Person>()
        for person in persons {
            if person.gender == "male" {
                ps.append(person)
            }
        }
        return ps
    }
}

class CriteriaFemale: Criteria {
    func meetCriteria(persons: Array<Person>) -> Array<Person> {
        var ps = Array<Person>()
        for person in persons {
            if person.gender == "female" {
                ps.append(person)
            }
        }
        return ps
    }
}

class CriteriaSingle: Criteria {
    func meetCriteria(persons: Array<Person>) -> Array<Person> {
        var ps = Array<Person>()
        for person in persons {
            if person.maritalStatus == "single" {
                ps.append(person)
            }
        }
        return ps
    }
}

class AndCriteria: Criteria {
    
    var criteria : Criteria
    var otherCriteria: Criteria
    
    init(criteria: Criteria, other: Criteria) {
        self.criteria = criteria
        self.otherCriteria = other
    }
    
    func meetCriteria(persons: Array<Person>) -> Array<Person> {
        let first = criteria.meetCriteria(persons: persons)
        return otherCriteria.meetCriteria(persons: first)
    }
}

class OrCriteria: Criteria {
    
    var criteria : Criteria
    var otherCriteria: Criteria
    
    init(criteria: Criteria, other: Criteria) {
        self.criteria = criteria
        self.otherCriteria = other
    }
    
    func meetCriteria(persons: Array<Person>) -> Array<Person> {
        var first = criteria.meetCriteria(persons: persons)
        let secced = otherCriteria.meetCriteria(persons: persons)
        
        for person in secced {
            for item in first {
                if item != person {
                    first.append(person)
                }
            }
        }
        
        return first
    }
}
