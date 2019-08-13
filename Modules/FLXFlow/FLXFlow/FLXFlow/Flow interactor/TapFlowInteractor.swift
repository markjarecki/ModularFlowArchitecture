//
//  TapFlowInteractor.swift
//  FLXFlow
//
//  Created by Mark Jarecki on 21/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import UIKit

open class TapFlowInteractor: FlowInteractor {
    
    // MARK: Gesture recognizer
    
    private let tapGesture = UITapGestureRecognizer()
    
    // MARK: Tap handling closure
    
    private var _handler: ( (UITapGestureRecognizer, UIViewController?) -> Void )?
    
    // MARK: - Initialisers
    
    public init(viewController: UIViewController, handler: @escaping (UITapGestureRecognizer, UIViewController?) -> Void) {
        
        self._handler = handler
        
        super.init(viewController: viewController)
        
        prepareGestureRecogniser(in: viewController.view)
        
    }
    
    // MARK: - Private helper methods
    
    private func prepareGestureRecogniser(in view: UIView) {
        
        // Set up gesture recognizer
        tapGesture.addTarget(self, action: #selector(handler(tap:)))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    // MARK: - Gesture handler
    
    @objc private func handler(tap: UITapGestureRecognizer) {
        
        self._handler?(tap, viewController)
        
    }
    
}
