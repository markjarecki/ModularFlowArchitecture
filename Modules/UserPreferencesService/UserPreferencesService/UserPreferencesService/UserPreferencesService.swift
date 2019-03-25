//
//  UserPreferencesService.swift
//  UserPreferencesService
//
//  Created by Mark Jarecki on 26/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import Foundation

internal struct internalSwiftStruct3{}

public struct publicSwiftStruct3 {
    
    public var w: Int?
    
    public init() {}
    
}

enum UserPreferences: String {

    case onBoarded = "onBoarded"

}

public enum UserPreferencesService {

    static public func setOnboarding() {
    
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: UserPreferences.onBoarded.rawValue)
    
    }
    
    static public func removeOnboarding() {
    
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserPreferences.onBoarded.rawValue)
    
    }
    
    static public func hasOnBoarded() -> Bool {
        
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: UserPreferences.onBoarded.rawValue)
    
    }

}
