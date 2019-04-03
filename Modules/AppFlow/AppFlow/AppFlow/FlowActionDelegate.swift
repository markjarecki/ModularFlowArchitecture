//
//  FlowActionDelegate.swift
//  AppFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// CommmonCore
import FLXFlow
import SharedEntities
import UserPreferencesService

// FeatureCore
import OnboardingSecondFeature
import HomeFirstFeature
import HomeSecondFeature
import ModalFeature

// FlowCore
import OnboardingFlow
import HomeFlow
import ModalFlow

extension AppFlowController: FlowActionDelegate {
    
    // MARK: - FlowActionDelegate conformance
    
    public func process(action: FlowAction) -> Bool {
        
        switch action {
            
            case OnboardingFlowAction.onboardingCompleted(let feature):
                onboardingCompleted(from: feature)

            case HomeFlowAction.presentModalFeatureFromHomeFirstFeature(let feature, let content):
                presentModalFeature(from: feature, content: content)

            case HomeFlowAction.presentModalFeatureFromHomeSecondFeature(let feature, let content):
                presentModalFeature(from: feature, content: content)

            case ModalFlowAction.dismiss(let feature):
                dismissModalFeature(from: feature)
            
            // Stop propagation - as this is the root flow controller and has no parent
            default: return false
            
        }
        
        // Stop propagation - as this is the root flow controller and has no parent
        return false
        
    }
    
    // MARK: - Private helper methods
    
    private func onboardingCompleted(from: OnboardingSecondViewController) {
        
        // Initialise with the Home Flow Controller
        guard let homeFlowController = HomeFlowController() else { return }
        
        stackedNavigationController?.delegate = from.tapFlowInteractor as? UINavigationControllerDelegate
        
        // Make it a child flow controller
        addChildFlowController(homeFlowController)
        
        // Add it to the view controller stack
        stackedNavigationController?.setViewControllers([homeFlowController], animated: true)
                
        // Set onBoarding to `true`, so onBoarding flow is not shown next app launch
        UserPreferencesService.setOnboarding()
        
    }
    
    private func presentModalFeature(from: UIViewController, content: OriginEntity) {

        // Initialise the Modal feature
        let modalFeature = ModalFeatureViewController()
        
        // Set the destination view model content
        modalFeature.viewModel = content
        
        // Add flow interactor
        modalFeature.tapFlowInteractor = DismissTapFlowInteractor(viewController: modalFeature){ tap, viewController in
            
            guard let _viewController = viewController as? ModalFeatureViewController else { return }
            guard let flowController = _viewController.presentingFlowController else { return }

            // Trigger a flow action on the flow controller
            flowController.flow(action: ModalFlowAction.dismiss(from: _viewController))
            
        }
        
        // Typecast the from feature and assign the presented feature's transitioning delegate
        switch from {
            
            case let feature as HomeFirstViewController:
            
                // Set the presented modal's transitioning delegate
                modalFeature.transitioningDelegate = feature.tapFlowInteractor as? UIViewControllerTransitioningDelegate
            
            case let feature as HomeSecondViewController:
            
                // Set the presented modal's transitioning delegate
                modalFeature.transitioningDelegate = feature.tapFlowInteractor as? UIViewControllerTransitioningDelegate
        
            default: return
            
        }
        
        // Present the modal feature
        from.present(modalFeature, animated: true)

    }
    
    private func dismissModalFeature(from: ModalFeatureViewController) {
        
        // Set a dismissal method from presented modal's flow interactor's delegate extension
        from.transitioningDelegate = from.tapFlowInteractor as? UIViewControllerTransitioningDelegate
        
        // Dismiss the modal feature
        from.dismiss(animated: true)
    
    }
    
}
