//
//  FlowActionDelegate.swift
//  HomeFlow
//
//  Created by Mark Jarecki on 21/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FLXFlow

extension HomeFlowController: FlowActionDelegate {
    
    public func process(action: FlowAction) -> Bool {
    
        switch action {
            
            // Propagate - event not handled
            default: return true
            
        }
        
    }
        
}
