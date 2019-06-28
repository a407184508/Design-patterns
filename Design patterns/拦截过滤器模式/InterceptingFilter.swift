//
//  InterceptingFilter.swift
//  Design patterns
//
//  Created by xhkj on 2019/6/28.
//  Copyright © 2019 Chuck. All rights reserved.
//

import UIKit

protocol  InterceptingFilter {

    func execute(request: String) -> Void
}

class AuthenticationFilter: InterceptingFilter {
    func execute(request: String) {
        print("AuthenticationFilter request:\(request)")
    }
}

class DebugFilter: InterceptingFilter {
    func execute(request: String) {
        print("DebugFilter request:\(request)")
    }
}

class Target {
    func execute(request: String) {
        print("Target request:\(request)")
    }
}


class FilterChain {
    
    var filters = [InterceptingFilter]()
    var target = Target()
    
    func addFilter(filter: InterceptingFilter) {
        filters.append(filter)
    }
    
    func execute(request: String) {
        for filter in filters {
            filter.execute(request: request)
        }
        target.execute(request: request)
    }
}


class FilterManager {
    var filterChain = FilterChain()
    
    init(target: Target) {
        filterChain.target = target
    }
    
    func setFilter(filter: InterceptingFilter) {
        filterChain.addFilter(filter: filter)
    }
    
    func filterRequest(request: String) {
        filterChain.execute(request: request)
    }
}

class InterceptingFilterClient {
    
    var filterManager : FilterManager?
    
    func setFilterManager(filter: FilterManager) {
        self.filterManager = filter
    }
    
    func sendRequest(request: String)  {
        filterManager?.filterRequest(request: request)
    }
}
