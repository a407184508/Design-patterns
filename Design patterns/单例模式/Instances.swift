//
//  Instances.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/26.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class Instances: NSObject {

    static let instance = Instances()
    
    public var name: String = "instance class"
    
    private override init() {
        
    }
}
