//
//  SGTuningsCustomSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit


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

}



class TuningsCustomSettingsUtils: TuningsBaseSettingsUtils {

    override init() {
        super.init()
    }

}
