//
//  InteractionDrivenFlowInteractor.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class InteractiveFlowInteractor: UIPercentDrivenInteractiveTransition, FlowInteractorProtocol {
    
    // MARK: - FlowInteractorProtocol conformance
    
    public weak var viewController: UIViewController?
    
    // MARK: - Interaction flag
    
    public var interactionInProgress: Bool = false
    
    // MARK: - Initialisers
    
    public init(viewController: UIViewController) {
        
        self.viewController = viewController
        
        super.init()
        
    }
    
}
