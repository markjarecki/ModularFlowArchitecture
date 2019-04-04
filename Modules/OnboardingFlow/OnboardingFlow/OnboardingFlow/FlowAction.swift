//
//  FlowAction.swift
//  OnboardingFlow
//
//  Created by Mark Jarecki on 8/3/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import FLXFlow

// Features
import OnboardingFirstFeature
import OnboardingSecondFeature

public enum OnboardingFlowAction: FlowAction {
    
    // Locally handled onboarding flow actions
    case showSecond
    case returnToFirst(from: OnboardingSecondFeature)
    
    // App flow handled actions
    case onboardingCompleted(from: OnboardingSecondFeature)
    
}
