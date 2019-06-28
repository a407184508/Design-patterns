//
//  ProxyPattern.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol DPImage {
    func display() -> Void
}

class ProxyPattern: NSObject {

    var delegate: DPImage?
    
    func proxy()  {
        self.delegate?.display()
    }
}
