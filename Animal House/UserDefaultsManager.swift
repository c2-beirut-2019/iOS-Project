//
//  UserDefaultsManager.swift
//  Animal House
//
//  Created by Roy Geagea on 8/29/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

class UserDefaultsManager: NSObject {
    
    private let isLoggedIn = "userIsLoggedIn"
    private let authToken = "userTokenAuth"
    private let refreshToken = "userTokenAuth"
    private let refreshTokenHeader = "userRefreshTokenHeader"
    private let isFirstAppLaunch = "OSFirstTimeLaunch"
    
    private let userDefaults = UserDefaults.standard
    
    class var shared: UserDefaultsManager {
        struct Singleton {
            static let instance = UserDefaultsManager()
        }
        return Singleton.instance
    }
    
    func setUserLoggedIn(isLogged: Bool) {
        userDefaults.set(isLogged, forKey: isLoggedIn)
        userDefaults.synchronize()
    }
    
    func isUserLoggedIn() -> Bool {
        return userDefaults.object(forKey: isLoggedIn) as? Bool ?? false
    }
    
    func setAuthToken(token: String) {
        userDefaults.set(token, forKey: authToken)
        userDefaults.synchronize()
    }
    
    func getAuthToken() -> String {
        return userDefaults.object(forKey: authToken) as? String ?? ""
    }
    
    func setRefreshToken(token: String) {
        userDefaults.set("Bearer" + " " + token, forKey: refreshToken)
        userDefaults.synchronize()
    }
    
    func getRefreshToken() -> String {
        return userDefaults.object(forKey: refreshToken) as? String ?? ""
    }
    
    func setRefreshTokenHeader(token: String) {
        userDefaults.set(token, forKey: refreshTokenHeader)
        userDefaults.synchronize()
    }
    
    func getRefreshTokenHeader() -> String {
        return userDefaults.object(forKey: refreshTokenHeader) as? String ?? ""
    }
    
    func isFirstTime() -> Bool {
        if userDefaults.object(forKey: isFirstAppLaunch) == nil {
            userDefaults.set("1", forKey: isFirstAppLaunch)
            userDefaults.synchronize()
            return true
        }
        else {
            return false
        }
    }
}
