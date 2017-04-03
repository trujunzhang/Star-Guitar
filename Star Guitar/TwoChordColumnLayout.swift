//
//  TwoChordColumnLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

import Foundation
import UIKit


struct TwoChordColumnSchema {
    
    // ==== Two Column
    public static func twoColumbMarginLeft() -> Int {
        return 72 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
    public static func twoColumnHeight() -> Int {
        return 280 + SGScreenLayout.sharedInstance.deviceIndex * 120
    }
    
    public static func twoChordColumnWidth() -> Int {
        return 112 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
}


class TwoChordColumnLayout: BaseTunningLayout {
    
    override func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {
        
        columnView.backgroundColor = UIColor(named: .tableRowBG)
        
        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(TwoChordColumnSchema.twoColumbMarginLeft())
            make.width.equalTo(TwoChordColumnSchema.twoChordColumnWidth())
        }
        
        
    }
    
}
