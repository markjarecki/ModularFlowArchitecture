//
//  OnboardingSecondFeatureToCompletionTapFlowInteractor+Extension.swift
//  AppFlow
//
//  Created by Mark Jarecki on 5/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import Animators

// Flows
import OnboardingFlow
import HomeFlow

extension OnboardingSecondFeatureToCompletionTapFlowInteractor: UINavigationControllerDelegate {
    
    @objc(navigationController:animationControllerForOperation:fromViewController:toViewController:)
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
        // Ensure transition conditions are correct
        guard operation == .push,
            fromVC is OnboardingFlowController,
            toVC is HomeFlowController else { return nil }
        
        // Return a simple cross fade animator
        return CrossFadeAnimator {
            
            // Remove the origin flow controller from its parent
            guard let fromFlowController = fromVC as? OnboardingFlowController else { return }
            fromFlowController.removeFlowControllerFromParent()
                        
        }
        
    }
    
}
