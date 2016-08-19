//
//  IGUser.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

open class IGUser {
    
    open var id: String!
    open var username: String!
    open var fullName: String!
    open var profilePicture: String!
    open var bio: String!
    open var website: String!
    open var mediaCount: Int = 0
    open var followsCount: Int = 0
    open var followedByCount: Int = 0
    
}
