//
//  SGConfiguration.swift
//  IEATTA
//
//  Created by djzhang on 4/14/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import SwiftyConfiguration

extension Keys {
    static let parseServer  = Key<[String : String]>("Parse-Server")
    
    static let SERVER_URL_DEV = Key<String>("Parse-Server.SERVER_URL_DEV")
    static let SERVER_URL = Key<String>("Parse-Server.SERVER_URL")
    static let APP_ID = Key<String>("Parse-Server.APP_ID")
    static let MASTER_KEY = Key<String>("Parse-Server.MASTER_KEY")
    
    static let CLIENT_KEY = Key<String>("Parse-Server.CLIENT_KEY")
    static let REST_API_KEY = Key<String>("Parse-Server.REST_API_KEY")
    
}

class SGConfiguration{
    
    fileprivate class var starGuitarDict:ParseServerDict {
        struct ClassConstantWrapper {
            static let instance = StarGuitarDict()
        }
        return ClassConstantWrapper.instance
    }
    
    
    
    fileprivate struct StarGuitarDict {
        
        var SERVER_URL_DEV: String
        var SERVER_URL: String
        var APP_ID: String
        var MASTER_KEY: String
        var CLIENT_KEY: String
        var REST_API_KEY: String
        
        init () {
            
            let plistPath = Bundle.main.path(forResource: "Star-guitar", ofType: "plist")!
            let config = Configuration(plistPath: plistPath)!
            
            SERVER_URL_DEV   = config.get(.SERVER_URL_DEV)!
            SERVER_URL       = config.get(.SERVER_URL)!
            APP_ID           = config.get(.APP_ID)!
            MASTER_KEY       = config.get(.MASTER_KEY)!
            CLIENT_KEY       = config.get(.CLIENT_KEY)!
            REST_API_KEY     = config.get(.REST_API_KEY)!
        }
    }
    
    
    public static func config(){
        
    }
}
