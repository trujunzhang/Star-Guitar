//
//  SGTuningsCustomSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift



//
// ===
// Realm Object
//
class TuningsCustomSettings: Object {
    
    dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // 6X5
    dynamic var results: String = TuningsCustomSettingsModel.getDefaultResults()
    
}


class TuningsCustomSettingsModel {
    public static func getDefaultResults() -> String {
        return String(format: "%@;%@;%@;%@;%@",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1"
        )
    }
    var resultCells: [[ColumnResultItem]] = [[ColumnResultItem]]()
    
    init() {
    }
    
    init( _ results: String) {
        self.resultCells = TuningsStandardFactory.convert(results)
    }

    public static func convert(_ settings: TuningsStandardSettings,_ results: String) -> TuningsStandardSettingsModel {
        return TuningsStandardSettingsModel( results)
    }
    
    public func generate() -> TuningsStandardSettings {
        let settings = TuningsStandardSettings()
        return settings
    }
}



class TuningsCustomSettingsUtils: TuningsBaseSettingsUtils {

    override init() {
        super.init()
    }

}
