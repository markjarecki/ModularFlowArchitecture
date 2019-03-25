//
//  InteractiveCrossFadeAnimator.swift
//  Animators
//
//  Created by Mark Jarecki on 6/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class InteractiveCrossFadeAnimator: CrossFadeAnimator {
    
    // MARK: - Properties
    
    // MARK: Driver
    
    weak public var driver: UIViewControllerInteractiveTransitioning?
    
    // MARK: - Initialiser
    
    public init(driver: UIViewControllerInteractiveTransitioning, onCompletion: (() -> Void)? = nil) {
        
        self.driver = driver
        
        super.init(onCompletion: onCompletion)
        
    }
    
}
