//
//  NSURL.swift
//  IGSDKLoginKit
//
//  Created by Jaune Sarmiento on 5/29/15.
//  Copyright (c) 2015 Jaune Sarmiento. All rights reserved.
//

import Foundation

extension URL {
    
    internal var fragmentValues: [AnyHashable: Any] {
        
        var dictionary = [AnyHashable: Any]()

        if let fragment = self.fragment {
            let params = fragment.characters.split {
                $0 == "&"
            }
                
            let params2 = params.map { String($0) }.map { (entry) in
                return entry.characters.split {
                    $0 == "="
                }.map { String($0) }
            }
                
            let params3 = params2.map { (entry) in
                return [entry[0]: entry[1]]
            }

            for value in params3 {
                for key in value.keys {
                    dictionary[key] = value[key]
                }
            }
        }
        
        return dictionary
    }
}
