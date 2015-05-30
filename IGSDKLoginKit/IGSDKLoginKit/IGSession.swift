//
//  IGSession.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

private var _activeSession: IGSession!

public class IGSession: NSObject {
    
    public var accessToken: String
    public var lastUpdated: NSDate
    
    public init(accessToken: String) {
        self.accessToken = accessToken
        self.lastUpdated = NSDate()
    }
    
    /**
        Call this method when a new session should be set. This must be called before any calls to `activeSession()` is made.
    
        :param: accessToken The access token from Instagram authorization API.
        :returns: The active Instagram session. Returns `nil` when the user is not authenticated.
    */
    internal static func session(accessToken: String) -> IGSession {
        _activeSession = IGSession(accessToken: accessToken)
        return _activeSession
    }
    
    
    /**
        A convenience method to get the active Instagram session without setting the access token.
    
        :returns: The active Instagram session. Returns `nil` when the user is not authenticated.
    */
    
    public static func activeSession() -> IGSession? {
        return _activeSession
    }
    
}