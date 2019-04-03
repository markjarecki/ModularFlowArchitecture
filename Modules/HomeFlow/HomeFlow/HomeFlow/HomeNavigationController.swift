//
//  HomeNavigationController.swift
//  HomeFlow
//
//  Created by Mark Jarecki on 20/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import Animators
import FLXFlow

final public class HomeNavigationController: UITabBarController {}

// MARK: - UITabBarControllerDelegate conformance

extension HomeNavigationController: UITabBarControllerDelegate {

    @objc(tabBarController:didSelectViewController:)
    public func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        tabBarController.view?.layoutIfNeeded()
        
    }
    
    @objc(tabBarController:animationControllerForTransitionFromViewController:toViewController:)
    public func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        // Return a simple cross fade animator
        return CrossFadeAnimator{
            
            // Reset the origin view controller's view properties
            fromVC.view.alpha = 1
            
        }
        
    }
    
}
