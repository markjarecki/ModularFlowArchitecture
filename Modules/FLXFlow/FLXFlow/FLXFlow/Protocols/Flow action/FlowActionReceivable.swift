//
//  FlowActionReceivable.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

public protocol FlowActionReceivable: class {
    
    var flowActionDelegate: FlowActionDelegate? { get set }
    
    func flow(action: FlowAction)
    
}
