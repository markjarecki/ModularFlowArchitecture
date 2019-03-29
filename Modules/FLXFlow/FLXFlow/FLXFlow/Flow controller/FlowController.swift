//
//  FlowController.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 18/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class FlowController: UIViewController, FlowActionReceivable {

    // MARK: - Properties
    
    private(set) public var parentFlowController: FlowController?
    
    private(set) public var childFlowControllers: [FlowController] = []
    
    public let rootNavigationController: UIViewController
    
    // MARK: - Initialisers
    
    public init?(rootNavigationController: UIViewController, nibName: String?, bundle: Bundle?) {
        
        // Ensure rootNavigationController is of correct type
        
        self.rootNavigationController = rootNavigationController
        
        super.init(nibName: nil, bundle: nil)
        
        addChildViewController(rootNavigationController)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    // MARK: - Public parent/child hierarchy mutation methods
    
    public func addChildFlowController(_ flowController: FlowController) {
        
        flowController.parentFlowController = self
        
        childFlowControllers.append(flowController)
        
    }
    
    public func removeFlowControllerFromParent() {
        
        guard let firstMatchingChildIndex = parentFlowController?.childFlowControllers.firstIndex(of: self) else { return }
        
        parentFlowController?.childFlowControllers.remove(at: firstMatchingChildIndex)
        
    }
    
    // MARK: - FlowActionReceivable conformance
    
    public var flowActionDelegate: FlowActionDelegate?
    
    public func flow(action: FlowAction) {
    
        // Process action - if propagation not stopped, pass it to the parent flow controller
        if let propagate = flowActionDelegate?.process(action: action), propagate == true {
            
            parentFlowController?.flow(action: action)
            
        }
        
    }
    
}
