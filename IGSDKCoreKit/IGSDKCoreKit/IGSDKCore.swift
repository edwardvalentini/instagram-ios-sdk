//
//  IGSDKCore.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

private let AppMainBundle = NSBundle.mainBundle().infoDictionary!

public let IGSDKBaseURL = "https://instagram.com"
public let IGSDKAuthorizationURL = "https://instagram.com/oauth/authorize/"
public let IGSDKClientIdKey = "InstagramClientID"
public let IGSDKClientSecretKey = "InstagramClientSecret"
public let IGSDKScopeKey = "InstagramScope"

public let IGSDKAccessTokenKey = "access_token"
public let IGSDKErrorDomain = "com.jaunesarmiento.IGSDKLoginKit"

public let IGSDKClientId = AppMainBundle[IGSDKClientIdKey] as! String
public let IGSDKRedirectURI = "ig\(IGSDKClientId)://authorize"

public var IGSDKScope: String? {
    get {
        if let scope = AppMainBundle[IGSDKScopeKey] as? [String] {
            return (scope).map({ "\($0)" }).joinWithSeparator("+")
        } else {
            return nil
        }
    }
}

public let IGSDKMissingAccessTokenCode = 10001

public let IGSDKErrorMessages: [NSObject: (NSString, NSString)] = [
    IGSDKMissingAccessTokenCode: ("An access token could not be found.", "The Instagram API probably did not finish or did not return an access token.")
]