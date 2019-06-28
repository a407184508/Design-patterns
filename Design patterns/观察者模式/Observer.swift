//
//  Observable.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Subject {
    
    var observers = [Observer]()
    
    var state: Int = 0 {
        didSet {
            notifyAllObservers()
        }
    }
    
    func attach(obs: Observer) {
        observers.append(obs)
    }

    func notifyAllObservers() {
        for obs in observers {
            obs.update()
        }
    }
    
}

protocol Observer {
    var subject: Subject { get set }
    func update() -> Void
}

class BinaryObserver: Observer {
    
    var subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
        self.subject.attach(obs: self)
    }
    
    func update() {
        print("BinaryObserver update \(subject.state)")
    }
}

class OctalObserver: Observer {
    
    var subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
        self.subject.attach(obs: self)
    }
    
    func update() {
        print("OctalObserver update \(subject.state)")
    }
}

class HexaObserver: Observer {
    
    var subject: Subject
    
    init(subject: Subject) {
        self.subject = subject
        self.subject.attach(obs: self)
    }
    
    func update() {
        print("HexaObserver update \(subject.state)")
    }
}
