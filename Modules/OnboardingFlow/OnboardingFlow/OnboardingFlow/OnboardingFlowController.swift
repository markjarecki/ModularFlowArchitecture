//
//  OnboardingFlowController.swift
//  OnboardingFlow
//
//  Created by Mark Jarecki on 26/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FLXFlow
import OnboardingFirstFeature
import OnboardingSecondFeature

final public class OnboardingFlowController: StackedFlowController {
    
    // MARK: - Initialisers
    
    public init?() {
        
        // Assign the flow controller's navigation controller
        let navigationController = UINavigationController()
        
        // Set properties
        navigationController.isToolbarHidden = true
        navigationController.isNavigationBarHidden = true
        
        // Initialise the super class
        super.init(rootNavigationController: navigationController, nibName: nil, bundle: nil)
        
        // Assign the Flow Event Delegate
        self.flowActionDelegate = self
        
        // Assign the navigation controller's root view controller
        let firstFeature = OnboardingFirstViewController()
        
        // Assign all flow interactors to this view controller
        firstFeature.tapFlowInteractor = TapFlowInteractor(viewController: firstFeature){ tap, viewController in
            
            if tap.state == .ended {
                
                guard let flowController = viewController?.flowController else { return }
                
                // Trigger a flow action on the flow controller
                flowController.flow(action: OnboardingFlowAction.showSecond)
                
            }
            
        }
        
        // Show root view controller to the view controller stack
        navigationController.show(firstFeature, sender: nil)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
