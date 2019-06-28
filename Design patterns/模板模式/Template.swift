//
//  Template.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit


class Game {
    
    func initGame() { }
    
    func startGame() { }
    
    func endGame() { }
    
    func play() {
        initGame()
        
        startGame()
        
        endGame()
    }
}

class Cricket: Game {
    
    override func initGame() {
        print("Cricket Game Initialized! Start playing.")
    }
    
    override func startGame() {
        print("Cricket Game Started. Enjoy the game!")
    }
    
    override func endGame() {
        print("Cricket Game Finished!")
    }
}

class Football: Game {
    
    override func initGame() {
        print("Football Game Initialized! Start playing.")
    }
    
    override func startGame() {
        print("Football Game Started. Enjoy the game!")
    }
    
    override func endGame() {
        print("Football Game Finished!")
    }
}



// .. template .. extends ..
