//
//  PresentModalFeatureTapFlowInteractor+Extension.swift
//  AppFlow
//
//  Created by Mark Jarecki on 21/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Animators
import HomeFlow

extension PresentModalFeatureTapFlowInteractor: UIViewControllerTransitioningDelegate {
    
    @objc(animationControllerForPresentedController:presentingController:sourceController:)
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Return a simple cross fade animator
        return CrossFadeAnimator{
            
            // Reset the origin view controller's view properties
            presenting.view.alpha = 1
            
        }
        
    }
    
}
