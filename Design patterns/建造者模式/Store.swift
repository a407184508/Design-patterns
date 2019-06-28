//
//  Store.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/26.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Packing {
    
    func pack() -> String
}

protocol Item {
    
    var name: String { get }
    var packing: Packing { get }
    var price: Double { get }
}


class Wrapper: Packing {
    
    func pack() -> String {
        print("Wrapper packing")
        return "Wrapper"
    }
}

class Bottle: Packing {
    
    func pack() -> String {
        print("Bottle packing")
        return "Bottle"
    }
}

class Burger: Item {
    
    var name: String { return "this is a burger" }
    var packing: Packing { return Wrapper() }
    var price: Double { return 7.5}
    
}

class VegBurger: Burger {
    
    override var name: String { return "this is a veg burger" }
    override var price: Double { return 25.0 }
}

class ChickenBurger: Burger {
    
    override var name: String { return "this is a chuicken burger" }
    override var price: Double { return 50.0 }
}

class ColdDrink: Item {
    
    var name: String { return "this is a cold drink" }
    var packing: Packing { return Bottle() }
    var price: Double { return 0.5 }
}

class Coke: ColdDrink {
    override var name: String { return "this is a coke" }
    override var price: Double { return 30.0 }
}

class Pepsi: ColdDrink {
    override var name: String { return "this is a Pepsi" }
    override var price: Double { return 35.0 }
}

class Meal {
    
    private var items = [Item]()
    
    func addItem(_ item: Item)  {
        items.append(item)
    }
    
    func getCost() -> Double {
        var cost = 0.0
        for item in items {
            cost += item.price
        }
        return cost
    }
    
    func showItems()  {
        for item in items {
            print("item:\(item.name), packing: \(item.packing.pack()), price: \(item.price)")
        }
    }
}

class MealBuilder {
    
    func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(VegBurger())
        meal.addItem(Coke())
        meal.addItem(Coke())
        return meal
    }
    
    func prepareChickenMeal() -> Meal {
        let meal = Meal()
        meal.addItem(ChickenBurger())
        meal.addItem(Pepsi())
        return meal
    }
    
    
}


