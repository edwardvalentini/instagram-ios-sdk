//
//  NSURL.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

extension NSURL {
    
    internal var fragmentValues: [NSObject: AnyObject] {
        
        var dictionary = [NSObject: AnyObject]()

        if let fragment = self.fragment {
            let params = fragment.characters.split {
                $0 == "&"
            }.map { String($0) }.map { (entry) in
                return entry.characters.split {
                    $0 == "="
                }.map { String($0) }
            }.map { (entry) in
                return [entry[0]: entry[1]]
            }

            for value in params {
                for key in value.keys {
                    dictionary[key] = value[key]
                }
            }
        }
        
        return dictionary
    }
}