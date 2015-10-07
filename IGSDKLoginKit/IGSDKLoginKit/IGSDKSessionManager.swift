//
//  IGSDKLoginManager.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation
import IGSDKCoreKit

public typealias IGSDKLoginResponseHandler = (session: IGSession?, error: NSError?) -> Void

public class IGSDKSessionManager {
    
    
    // MARK: Private Variables
    
    // The closure executed when `loginWithCompletionHandler(_:)` is completed
    private var loginHandler: IGSDKLoginResponseHandler?
    
    
    // MARK: - Private Methods
    
    /**
        Builds and returns the authorization URL.
    
        - returns: An `NSURL` used to request an access token from the Instagram API.
    */
    
    private func authorizationURL() -> NSURL {
        var urlString = "\(IGSDKAuthorizationURL)?client_id=\(IGSDKClientId)&redirect_uri=\(IGSDKRedirectURI)&response_type=token"
        
        if let scope = IGSDKScope {
            urlString += "&scope=\(scope)"
        }
        
        return NSURL(string: urlString)!
    }
    
    
    public init() { }
    
    /**
        Opens a new session with Instagram. Then method tries to request for permission (scope) to access the user's photos, likes, followers, then redirects back to the calling appication to verify.
    
        The redirect is handled via URL Schemes (https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Inter-AppCommunication/Inter-AppCommunication.html) and is using the scheme `ig<InstagramClientID>`. For example, IGSDKLoginKitDemo uses `ig3de9578df0a54593bd41dd402db9b8d9` as its URL scheme.
    
        The application can request extended permissions by setting the needed scopes in the calling application's `Info.plist`. Read https://instagram.com/developer/authentication/#scope for more information about Instagram scopes.
    
        - parameter completionHandler: The closure executed when this method is completed.
    */
    
    public func loginWithCompletionHandler(completionHandler: IGSDKLoginResponseHandler) {
        loginHandler = completionHandler
        UIApplication.sharedApplication().openURL(authorizationURL())
    }
    
    
    /**
        Call this method from `application(_:openURL:sourceApplication:annotation:)` method of your application's `AppDelegate`. This should be called to ensure proper handling of the authentication process (e.g. when `loginWithCompletionHandler(_:)` is called).
    
        - parameter url: The URL as passed to `application(_:openURL:sourceApplication:annotation:)`.
        - parameter sourceApplication: The source application as passed to `application(_:openURL:sourceApplication:annotation:)`.
        - returns: `true` if the URL is intended for `IGSDKLoginKit`, `false` if not.
    */
    
    public func handleOpenURL(url: NSURL, sourceApplication: String?) -> Bool {
        let redirectURL = NSURL(string: IGSDKRedirectURI)!
        var session: IGSession?
        
        // When we won't be handling this URL, return `false`. There is no need to call the login handler here since this is not an auth flow URL.
        if redirectURL.scheme != url.scheme || redirectURL.host != url.host {
            return false
        }
        
        // Try to get an access token from the URL's fragment
        if let accessToken = url.fragmentValues[IGSDKAccessTokenKey] as? String! {
            // session = IGSession(accessToken: accessToken)
            session = IGSession.session(accessToken)
        }
        
        if let loginHandler = loginHandler {
            if let session = session {
                loginHandler(session: session, error: nil)
            } else {
                // Return an error if we didn't get an access token and a valid session
                loginHandler(session: session, error: nil) // TODO: Pass error message here
            }
        }
        
        return true
    }
}

