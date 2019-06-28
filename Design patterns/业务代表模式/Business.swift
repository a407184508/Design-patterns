//
//  Business.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol BusinessService {
    func doProcessing() -> Void
}

class EJBService: BusinessService {
    func doProcessing() {
        print("Processing task by invoking EJB Service")
    }
}

class JMSService: BusinessService {
    func doProcessing() {
        print("Processing task by invoking JMS Service")
    }
}

// look up 
class BusinessLookUp {
    
    func getBusinessService(_ str: String) -> BusinessService {
        if str == "EJB" {
            return EJBService()
        } else {
            return JMSService()
        }
    }
}

// Business Delegate
class BusinessDelegate {
    var lookupService: BusinessLookUp  = BusinessLookUp()
    var businessService: BusinessService?
    
    var serviceType: String = ""
    
    func doTask() {
        businessService = lookupService.getBusinessService(serviceType)
        businessService?.doProcessing()
    }
}

// client
class Client {
    var businessService: BusinessDelegate
    
    init(service: BusinessDelegate) {
        self.businessService = service
    }
    
    func doTask() {
        businessService.doTask()
    }
}


