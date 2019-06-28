//
//  Facade.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol FacadeEvent {
    func event() -> Void
}

class RegisteredEvent: FacadeEvent {
    func event() {
        print("registered event")
    }
}

class OutpatientServiceEvent: FacadeEvent {
    func event() {
        print("Outpatient service event")
    }
}

class TakeMedicne: FacadeEvent {
    func event() {
        print("Take the medicine event")
    }
}


class DoctorMaker {
    var registered : FacadeEvent = RegisteredEvent()
    var outpatientService: FacadeEvent = OutpatientServiceEvent()
    var takeMedicne: FacadeEvent = TakeMedicne()
    
    func registeredEvent() {
        registered.event()
    }
    
    func outpatientServiceEvent() {
        outpatientService.event()
    }
    
    func takeMedicneEvent() {
        takeMedicne.event()
    }
}
