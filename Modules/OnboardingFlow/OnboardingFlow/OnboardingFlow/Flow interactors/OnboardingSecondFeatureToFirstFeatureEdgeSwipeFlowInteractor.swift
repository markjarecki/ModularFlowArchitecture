//
//  OnboardingSecondFeatureToFirstFeatureEdgeSwipeFlowInteractor.swift
//  OnboardingFlow
//
//  Created by Mark Jarecki on 27/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import Animators
import FLXFlow

// Features
import OnboardingFirstFeature
import OnboardingSecondFeature

public class OnboardingSecondFeatureToFirstFeatureEdgeSwipeFlowInteractor: InteractiveFlowInteractor {
        
    // MARK: Gesture recognizer
    
    public let leftEdgeSwipeGesture = UIScreenEdgePanGestureRecognizer()
    
    // MARK: - Initialisers
    
    public override init(viewController: UIViewController) {
        
        super.init(viewController: viewController)
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        print("PREPARING")
        
        // Set up gesture recognizer
        leftEdgeSwipeGesture.addTarget(self, action: #selector(handler(pan:)))
        leftEdgeSwipeGesture.edges = .left
        viewController?.view.addGestureRecognizer(leftEdgeSwipeGesture)
        
        print(view)
         print(viewController)
         print("FINISHED PREP")
        
    }
    
    // MARK: - Gesture handler
    
    @objc private func handler(pan: UIScreenEdgePanGestureRecognizer) {
        
        print("DUDE")
        
        guard let panView = pan.view else { return }
                
        let translation = pan.translation(in: panView)
        
        // Distance travelled
        let distance = translation.x / panView.bounds.width
        
        switch pan.state {
            
            case .began:
                
                interactionInProgress = true
                
                // Start the interactive transition
                // Call the flow controller FlowActionReceivable method for this interaction event
                guard let viewController = viewController as? OnboardingSecondFeature else { return }
                guard let flowController = viewController.flowController else { return }
                
                flowController.flow(action: OnboardingFlowAction.returnToFirst(from: viewController))
            
            case .changed:
                
                update(distance)
            
            case .cancelled:
                
                interactionInProgress = false
                
                cancel()
            
            case .ended:
                
                interactionInProgress = false
                
                if pan.velocity(in: panView).x > 300 {
                    
                    finish()
                    
                    return
                    
                }
                
                distance > 0.5 ? finish() : cancel()
            
            // .failed
            default: break
            
        }
        
    }
    
}

extension OnboardingSecondFeatureToFirstFeatureEdgeSwipeFlowInteractor: UINavigationControllerDelegate {
        
    @objc(navigationController:animationControllerForOperation:fromViewController:toViewController:)
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        // Ensure transition conditions are correct
        guard operation == .pop,
              fromVC is OnboardingSecondFeature,
              toVC is OnboardingFirstFeature else { return nil }
        
        // Return a basic interactive cross fade animator
        return InteractiveCrossFadeAnimator(driver: self)
        
    }
    
    @objc(navigationController:interactionControllerForAnimationController:)
    public func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        
        // Ensure interaction has been triggered by the interactor
        guard interactionInProgress == true else { return nil }
        
        // Return the flow interaction - which conforms to UIViewControllerInteractiveTransitioning
        return self
        
    }
    
}
