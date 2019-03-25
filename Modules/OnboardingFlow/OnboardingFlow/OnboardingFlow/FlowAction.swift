//
//  FlowAction.swift
//  OnboardingFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FLXFlow
import OnboardingFirstFeature
import OnboardingSecondFeature

public enum OnboardingFlowAction: FlowAction {
    
    // Local
    case showSecond
    case returnToFirst(from: OnboardingSecondViewController)
    
    // App
    case onboardingCompleted(from: OnboardingSecondViewController)
    
}
