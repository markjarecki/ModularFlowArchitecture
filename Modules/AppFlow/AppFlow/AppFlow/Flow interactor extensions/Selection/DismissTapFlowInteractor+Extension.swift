//
//  DismissTapFlowInteractor+Extension.swift
//  AppFlow
//
//  Created by Mark Jarecki on 21/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import Animators

// Flows
import ModalFlow

extension DismissTapFlowInteractor: UIViewControllerTransitioningDelegate {
    
    @objc(animationControllerForDismissedController:)
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Return a simple cross fade animator
        return CrossFadeAnimator()
        
    }
    
}
