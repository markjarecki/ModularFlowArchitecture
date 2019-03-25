//
//  CrossFadeAnimator.swift
//  Animators
//
//  Created by Mark Jarecki on 6/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class CrossFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    // MARK: - Properties
    
    // MARK: Duration
    
    public var animatorDuration: TimeInterval = 0.3
    
    // MARK: On completion
    internal var onCompletion: (() -> Void)?
    
    // MARK: - Initialisers
    
    public init(onCompletion: (() -> Void)? = nil) {
        
        self.onCompletion = onCompletion
        
        super.init()
        
    }
    
    
    // MARK: - UIViewControllerAnimatedTransitioning conformance
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return animatorDuration
        
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // References to: from and to views
        let container = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)!
        let toView = transitionContext.view(forKey: .to)!

        // Add the active views to the container
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // Animation properties
        let animations: (() -> Void) = {
            
            fromView.alpha = 0
            
        }
        
        let completion: ((Bool) -> Void) = { [weak self] _ in
            
            // Retain self reference to anable calling onCompletion after completeTransition()
            guard let _self = self else { return }
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
            if let completion = _self.onCompletion {
                
                // Call the onCompletion closure
                completion()
                
            }
            
        }
        
        // Linear animation
        // Do no use UIViewPropertyAnimator
        UIView.animate(withDuration: animatorDuration,
                       delay: 0,
                       options: [.allowUserInteraction, .curveLinear],
                       animations: animations,
                       completion: completion)
        
    }
    
}
