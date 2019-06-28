//
//  Pig.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Reborn {
    func reborn(soul: String, body: String) -> Void
}

class Soul: Reborn {
    func reborn(soul: String, body: String) {
        print("soul")
    }
}

class Body: Reborn {
    func reborn(soul: String, body: String) {
        print("body")
    }
}

protocol PersonPig {
    func generatePerson(_ api: Reborn)
}

class EightQuit: PersonPig {
    
    var soul: String
    var body: String
    
    init(soul: String, body: String) {
        self.soul = soul
        self.body = body
    }
    
    // protocol generate more eight quit
    func generatePerson(_ api: Reborn)  {
        api.reborn(soul: self.soul, body: self.body)
    }
}
