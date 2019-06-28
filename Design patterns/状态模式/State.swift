//
//  State.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol State {
    func doAction(_ context: Context) -> Void
}

class StartState: State, CustomStringConvertible {
    
    func doAction(_ context: Context) {
        context.state = self
    }
    
    var description: String {
        return "start state"
    }
    
}

class StopState: State, CustomStringConvertible {
    
    func doAction(_ context: Context) {
        context.state = self
    }
    
    var description: String {
        return "stop state"
    }
}


class Context {
    
    var state: State?
}
