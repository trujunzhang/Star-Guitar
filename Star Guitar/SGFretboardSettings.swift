//
//  SGFretboardSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift



class TuningsFretboardSettingsModel {
    // 6X12
    public static func getDefaultFretboard() -> String {
        return String(format: "%@;%@;%@;%@;%@;%@;%@;%@;%@;%@;%@;%@",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1"
        )
    }
    var resultCells: [[ColumnResultItem]] = [[ColumnResultItem]]()
    
    
    
    init() {
        // Empty here.
        //self.resultCells = TuningsFactory.convert(TuningsStandardSettingsModel.getDefaultResults())
        
        //self.resultCells = TuningsFretboardSettingsModel.getStandardResultsCells()
    }
    
    init( _ results: String) {
        //self.resultCells = TuningsFretboardSettingsModel.convert(results)
    }
    
    
    public static func convert(_ settings: TuningsStandardSettings) -> TuningsStandardSettingsModel {
        return TuningsStandardSettingsModel( settings.results)
    }
    
    public func generate() -> TuningsStandardSettings {
        let settings = TuningsStandardSettings()
        //settings.results = self.results
        return settings
    }
}
