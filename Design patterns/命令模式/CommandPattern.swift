//
//  CommandPattern.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/27.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Order {
    func execute() -> Void
}



class Stock {

    var name = "abc"
    var quantity = 10
    
    func buy()  {
        print("stock [name: \(name), quantity: \(quantity)] bought")
    }
    
    func sell()  {
        print("stock [name: \(name), quantity: \(quantity)] sold")
    }
}

class BuyStock: Order {
    
    var abcStock : Stock?
    
    init(stock: Stock) {
        abcStock = stock
    }
    
    func execute() {
        abcStock?.buy()
    }
}

class SellStock: Order {
    var abcStock: Stock?
    
    init(stock: Stock) {
        abcStock = stock
    }
    
    func execute() {
        abcStock?.sell()
    }
}

class Broker {
    
    var orderList = [Order]()
    
    func takeOrder(_ order: Order)  {
        orderList.append(order)
    }
    
    func placeOrders() {
        for order in orderList {
            order.execute()
        }
        orderList.removeAll()
    }
}
