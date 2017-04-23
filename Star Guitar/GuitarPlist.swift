//
//  GuitarPlist.swift
//  Star Guitar
//
//  Created by djzhang on 4/18/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import SwiftyConfiguration


extension Keys {
    static let Title1To6 = Key<[String]>("Title1To6")
    static let Title6To1 = Key<[String]>("Title6To1")
    static let TwoColumnNumber = Key<[String]>("TwoColumnNumber")
    static let TuningsStandardType = Key<[String]>("TuningsStandardType")
    static let standardLeftHandResultString = Key<[[String]]>("standardLeftHandResultString")
    static let standardRightHandResultString = Key<[[String]]>("standardRightHandResultString")
}

/*
 * GuitarPlist.guitarPlistDict.TwoColumnNumber
 *
 */
class GuitarPlist{
    public class var guitarPlistDict:GuitarPlistDict {
        struct ClassConstantWrapper {
            static let instance = GuitarPlistDict()
        }
        return ClassConstantWrapper.instance
    }
    
    struct GuitarPlistDict {
        
        var Title1To6: [String]
        var Title6To1: [String]
        var TwoColumnNumber: [String]
        var TuningsStandardType: [String]
        var standardLeftHandResultString: [[String]]
        var standardRightHandResultString: [[String]]
        
        init () {
            let plistPath = Bundle.main.path(forResource: "Star-guitar", ofType: "plist")!
            let config = Configuration(plistPath: plistPath)!
            
            Title1To6   = config.get(.Title1To6)!
            Title6To1   = config.get(.Title6To1)!
            TwoColumnNumber   = config.get(.TwoColumnNumber)!
            TuningsStandardType   = config.get(.TuningsStandardType)!
            standardLeftHandResultString   = config.get(.standardLeftHandResultString)!
            standardRightHandResultString   = config.get(.standardRightHandResultString)!
        }

    }
}
