//
//  OnboardingFlowController.swift
//  OnboardingFlow
//
//  Created by Mark Jarecki on 26/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import FLXFlow

// Feature
import OnboardingFirstFeature
import OnboardingSecondFeature

final public class OnboardingFlowController: StackedFlowController, FlowActionDelegate {
    
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
    
    // MARK: - FlowActionDelegate conformance
    
    public func process(action: FlowAction) -> Bool {
        
        switch action {
            
        case OnboardingFlowAction.showSecond: showSecond()
        case OnboardingFlowAction.returnToFirst(let feature): returnToFirst(from: feature)
            
        // Propagate action - event not handled
        default: return true
            
        }
        
        // Stop propagation - event handled
        return false
        
    }
    
    // MARK: - Private helper methods
    
    private func showSecond() {
        
        // Initialise with the Home Flow Controller
        let secondFeature = OnboardingSecondViewController()
        
        // Assign flow interactors
        secondFeature.tapFlowInteractor = OnboardingSecondFeatureToCompletionTapFlowInteractor(viewController: secondFeature){ tap, viewController in
            
            if tap.state == .ended {
                
                guard let viewController = viewController as? OnboardingSecondViewController else { return }
                guard let flowController = viewController.flowController else { return }
                
                // Trigger a flow action on the flow controller
                flowController.flow(action: OnboardingFlowAction.onboardingCompleted(from: viewController))
                
            }
            
        }
        
        secondFeature.edgeSwipeFlowInteractor = OnboardingSecondFeatureToFirstFeatureEdgeSwipeFlowInteractor(viewController: secondFeature)
        
        // Add it to the view controller stack - with default animation
        stackedNavigationController?.pushViewController(secondFeature, animated: true)
        
    }
    
    private func returnToFirst(from: OnboardingSecondViewController) {
        
        // Assign as feature's edgeswipeFlowInteractor as the navigationController's transition delegate
        stackedNavigationController?.delegate = from.edgeSwipeFlowInteractor as? UINavigationControllerDelegate
        
        // Return to the Onboarding First Feature, by popping the Second Feature from the stack
        stackedNavigationController?.popViewController(animated: true)
        
    }
    
}
