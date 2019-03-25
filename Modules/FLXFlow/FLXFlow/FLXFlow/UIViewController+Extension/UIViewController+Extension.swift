//
//  UIViewController+Extension.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 26/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Method adds appends a child view UIViewController to the VC stack - including its contained UIView
    public func addChildViewController(_ viewController: UIViewController) {
    
        viewController.willMove(toParent: self)
    
        addChild(viewController)
        viewController.view.frame = view.frame
        view.addSubview(viewController.view)
    
        viewController.didMove(toParent: self)
    
    }
    
    /// Property returns a UIViewController's immediate parent FlowController
    public var flowController: FlowController? {
        
        // Ensure view controller is not itself a flow controller
        guard (self as? FlowController) == nil else { return self as? FlowController }
        
        // Retain first parent VC
        var parent: UIViewController? = self.parent
        
        // Iterate while parent is not a flow controller
        while parent as? FlowController == nil {
            
            // Make sure the value is itself not nil
            guard parent != nil else { return nil }
            
            // Update the value to the current parent
            parent = parent!.parent
            
        }

        return parent as? FlowController
        
    }
    
    /// Property returns a UIViewController's presenting FlowController
    public var presentingFlowController: FlowController? {
        
        return self.presentingViewController as? FlowController
            
    }

}
