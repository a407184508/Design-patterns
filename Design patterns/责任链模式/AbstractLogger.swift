//
//  AbstractLogger.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class AbstractLogger {
    
    enum Level: Int {
        case info = 1
        case debug = 2
        case error = 3
    }
    
    var level: Level = .info
    
    var nextLogger: AbstractLogger?
    
    func logMessage(level: Level, withMessage msg: String) {
        if self.level.rawValue <= level.rawValue {
            write(msg)
        }
        if let next = nextLogger {
            next.logMessage(level: level, withMessage: msg)
        }
    }
    
    func write(_ msg: String) { }
}

class ConsoleLogger: AbstractLogger {
    
    init(level: Level) {
        super.init()
        self.level = level
    }
    
    override func write(_ msg: String) {
        print("Standard Console::Logger:\(msg)")
    }
}

class ErrorLogger: AbstractLogger {
    
    init(level: Level) {
        super.init()
        self.level = level
    }
    
    override func write(_ msg: String) {
        print("Standard Error::Logger:\(msg)")
    }
}

class FileLogger: AbstractLogger {
    init(level: Level) {
        super.init()
        self.level = level
    }
    
    override func write(_ msg: String) {
        print("Standard File::Logger:\(msg)")
    }
}
