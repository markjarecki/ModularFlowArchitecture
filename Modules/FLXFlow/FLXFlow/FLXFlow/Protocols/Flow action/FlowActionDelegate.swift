//
//  FlowActionDelegate.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public protocol FlowActionDelegate: class {
    
    func process(action: FlowAction) -> Bool
    
}

extension FlowActionDelegate {
    
    public func process(action: FlowAction) -> Bool {
        
        // By default, return - event not handled - and propagate action handling
        return true
        
    }
    
}
