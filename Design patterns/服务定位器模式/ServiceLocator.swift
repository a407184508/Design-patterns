//
//  ServiceLocator.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol SuperService {

    func getName() -> String
    func exeute()
}

class Service1: SuperService {
    func getName() -> String {
        return "Service 1"
    }
    
    func exeute() {
        print("exeute service 1")
    }
}

class Service2: SuperService {
    func getName() -> String {
        return "Service 2"
    }
    
    func exeute() {
        print("exeute service 2")
    }
}

class InitialContext {
    
    func lookup(name: String) -> SuperService {
        if name == "Service 1" {
            print("Looking up and creating a new Service1 object")
            return Service1()
        } else {
            print("Looking up and creating a new Service2 object")
            return Service2()
        }
    }
}

class CacheService {
    
    var services = [SuperService]()
    
    func getService(name: String) -> SuperService? {
        for s in services {
            if s.getName() == name {
                return s;
            }
        }
        return nil
    }
    
    func addService(newValue: SuperService) {
        var exists = false
        for service in services {
            if service.getName() == newValue.getName() {
                exists = true
            }
        }
        guard exists else {
            services.append(newValue)
            return
        }
    }
}

class ServiceLocator {
    
    var cache = CacheService()
    
    func getService(name: String) -> SuperService {
        
        if let service = cache.getService(name: name) {
            return service
        }
        
        let context = InitialContext()
        let service = context.lookup(name: name)
        cache.addService(newValue: service)
        return service
        
    }
}

