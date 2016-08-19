//
//  IGSession.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

private var _activeSession: IGSession!

open class IGSession: NSObject {
    
    open var accessToken: String
    open var lastUpdated: Date
    
    public init(accessToken: String) {
        self.accessToken = accessToken
        self.lastUpdated = Date()
    }
    
    /**
        Call this method when a new session should be set. This must be called before any calls to `activeSession()` is made.
    
        - parameter accessToken: The access token from Instagram authorization API.
        - returns: The active Instagram session. Returns `nil` when the user is not authenticated.
    */
    internal static func session(_ accessToken: String) -> IGSession {
        _activeSession = IGSession(accessToken: accessToken)
        return _activeSession
    }
    
    
    /**
        A convenience method to get the active Instagram session without setting the access token.
    
        - returns: The active Instagram session. Returns `nil` when the user is not authenticated.
    */
    
    open static func activeSession() -> IGSession? {
        return _activeSession
    }
    
}
