//
//  HomeFlowController.swift
//  HomeFlow
//
//  Created by Mark Jarecki on 13/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// CommonCore
import FLXFlow
import SharedEntities

// FeatureCore
import HomeFirstFeature
import HomeSecondFeature

final public class HomeFlowController: TabbedFlowController, FlowActionDelegate {
    
    // MARK: - Initialisers
    
    public init?() {
        
        // Assign the flow controller's navigation controller
        let navigationController = HomeNavigationController()
        
        // Assign the UITabBarControllerDelegate
        navigationController.delegate = navigationController
        
        // Initialise the super class
        super.init(rootNavigationController: navigationController, nibName: nil, bundle: nil)
        
        // Assign the Flow Event Delegate
        self.flowActionDelegate = self
        
        let firstFeature = HomeFirstViewController()
        let secondFeature = HomeSecondViewController()
        
        // Initialise the tbar bar items
        let firstTabItem = UITabBarItem(title: "HomeFirst", image: nil, tag: 0)
        let secondTabItem = UITabBarItem(title: "HomeSecond", image: nil, tag: 0)
        
        // Adjust the font
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        firstTabItem.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        secondTabItem.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
        // Adjust the title position
        firstTabItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -14)
        secondTabItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -14)

        // Set the tab bar items
        firstFeature.tabBarItem = firstTabItem
        secondFeature.tabBarItem = secondTabItem
        
        // Add flow interactors
        firstFeature.tapFlowInteractor = PresentModalFeatureTapFlowInteractor(viewController: firstFeature){ tap, viewController in
            
            guard let viewController = viewController as? HomeFirstViewController else { return }
            guard let flowController = viewController.flowController else { return }
            
            let originEntity = OriginEntity(featureName: "Home First Feature")
            
            // Trigger a flow action on the flow controller
            flowController.flow(action: HomeFlowAction.presentModalFeatureFromHomeFirstFeature(from: viewController, content: originEntity))
            
        }
        
        secondFeature.tapFlowInteractor = PresentModalFeatureTapFlowInteractor(viewController: secondFeature){ tap, viewController in
            
            guard let viewController = viewController as? HomeSecondViewController else { return }
            guard let flowController = viewController.flowController else { return }

            let originEntity = OriginEntity(featureName: "Home Second Feature")
            
            // Trigger a flow action on the flow controller
            flowController.flow(action: HomeFlowAction.presentModalFeatureFromHomeSecondFeature(from: viewController, content: originEntity))
            
        }
        
        // Add the tab bar items
        navigationController.viewControllers = [firstFeature, secondFeature]
        
        // Set which tab is selected
        navigationController.selectedIndex = 0
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
    
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

