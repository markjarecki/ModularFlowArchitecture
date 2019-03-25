//
//  StackedFlowController.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class StackedFlowController: FlowController {
    
    // MARK: - Convenience

    public var stackedNavigationController: UINavigationController? {
        
        guard let stackedNavigationController = rootNavigationController as? UINavigationController else { return nil }
        return stackedNavigationController
        
    }
    
    // MARK: - Initialisers
    
    public override init?(rootNavigationController: UIViewController, nibName: String?, bundle: Bundle?) {
        
        // Ensure rootNavigationController is of correct type
        guard rootNavigationController is UINavigationController else { return nil }
        
        super.init(rootNavigationController: rootNavigationController, nibName: nibName, bundle: bundle)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
