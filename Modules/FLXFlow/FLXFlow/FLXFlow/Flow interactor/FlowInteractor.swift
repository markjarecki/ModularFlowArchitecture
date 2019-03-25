//
//  FlowInteractor.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class FlowInteractor: NSObject, FlowInteractorProtocol {
    
    // MARK: - FlowInteractorProtocol conformance
    
    public weak var viewController: UIViewController?
    
    // MARK: - Initialisers
    
    public init(viewController: UIViewController) {

        self.viewController = viewController
        
        super.init()
        
    }
    
}
