//
//  Mediator.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class User {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func sendMessage(_ msg: String) {
        ChatRoom.showMessage(user: self, msg: msg)
    }
}

class ChatRoom {
    
    static func showMessage(user: User, msg: String) {
        
        print("\(user.name) send message: \(msg)" )
    }
}

