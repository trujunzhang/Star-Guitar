//
//  SGFretboardSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

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
    }

}
