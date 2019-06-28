//
//  FrontController.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

class HomeView {
    func show() {
        print("Displaying Home Page")
    }
}

class MyView {
    func show() {
        print("Displaying Home Page")
    }
}

class Dispatcher {
    
    var my : MyView
    var home: HomeView
    
    init() {
        my = MyView()
        home = HomeView()
    }
    
    func dispatch(request: String) {
        if request == "my" {
            my.show()
        } else {
            home.show()
        }
    }
}

class FrontController: NSObject {

    var dispatcher = Dispatcher()
    
    func isAuthenticUser() -> Bool {
        print("User is authenticated successfully.")
        return true
    }
    
    func trackRequest(request: String) -> Void {
        print("Page requested: \(request)")
    }
    
    func dispatchRequest(request: String) -> Void {
        trackRequest(request: request)
        
        if isAuthenticUser() {
            dispatcher.dispatch(request: request)
        }
    }
}
