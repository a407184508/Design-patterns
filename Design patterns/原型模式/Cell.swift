//
//  Cell.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/26.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol Clone: NSCopying {
    
    var id: String { get set }
    var name: String { get set }
   
    func split() -> Void
}

class CloneCell: Clone {
    
    internal var id: String = ""
    var name: String = "clone cell"
    
    func split() {

    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let cloneCell = CloneCell()
        cloneCell.id = id
        cloneCell.name = name
        return cloneCell
    }
}


class CellCache {
    
    static let instance = CellCache()
    
    // dictionary | set |  array |  hashtable |  hsahmap
    
    private var hashtable = [String : CloneCell]()
    
    // load cache
    
    func loadCache()  {
        let cell = CloneCell()
        cell.id = "1"
        hashtable["1"] = cell

        let cell2 = CloneCell()
        cell2.id = "1"
        hashtable["2"] = cell2

        let cell3 = CloneCell()
        cell3.id = "1"
        hashtable["3"] = cell3
    }
    
    // get cache cell
    func getCell(_ str: String) -> Clone {
        if let cloneCell = hashtable[str] {
            return cloneCell
        } else {
            return CloneCell()
        }
    }
}
