//
//  FourColumnLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


struct FourColumnSchema {
    
    // ==== Three Column
    public static func fourColumbMarginLeft() -> Int {
        return 72 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
    public static func fourColumnWidth() -> Int {
        return 160 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func fourColumnItemHeight() -> Int {
        return 40 + SGScreenLayout.sharedInstance.deviceIndex * 18
    }
    
    public static func threeColumnTableViewHeightForFooterInFirstSection() -> CGFloat {
        return CGFloat(10 + SGScreenLayout.sharedInstance.deviceIndex * 10)
    }
    
}


class FourColumnLayout: BaseTuningsLayout {
    
    override func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {
        
        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(FourColumnSchema.fourColumbMarginLeft() + 104)
            make.width.equalTo(FourColumnSchema.fourColumnWidth())
            make.bottom.equalToSuperview()
        }
        
    }
    
}
