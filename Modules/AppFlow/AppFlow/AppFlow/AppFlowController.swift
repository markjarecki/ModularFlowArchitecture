//
//  AppFlowController.swift
//  AppFlow
//
//  Created by Mark Jarecki on 25/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// CommonCore
import FLXFlow
import UserPreferencesService

// FlowCore
import OnboardingFlow
import HomeFlow

final public class AppFlowController: StackedFlowController {
    
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
        
        // Has user onBoarded?
        if UserPreferencesService.hasOnBoarded() {

            // Initialise with the Home Flow Controller
            guard let homeFlowController = HomeFlowController() else { return nil }
            
            // Make it a child flow controller
            addChildFlowController(homeFlowController)

            // Add it to the view controller stack
            rootNavigationController.show(homeFlowController, sender: nil)
            
        } else {

            // Initialise with the Onboarding Flow Controller
            guard let onBoardingFlowController = OnboardingFlowController() else { return nil }

            // Make it a child flow controller
            addChildFlowController(onBoardingFlowController)
            
            // Add it to the view controller stack
            rootNavigationController.show(onBoardingFlowController, sender: nil)
            
        }
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
