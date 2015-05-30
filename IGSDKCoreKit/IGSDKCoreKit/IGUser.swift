//
//  IGUser.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

public class IGUser {
    
    public var id: String!
    public var username: String!
    public var fullName: String!
    public var profilePicture: String!
    public var bio: String!
    public var website: String!
    public var mediaCount: Int = 0
    public var followsCount: Int = 0
    public var followedByCount: Int = 0
    
}