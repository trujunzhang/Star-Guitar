//
//  ThreeColumnSchema.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//



import Foundation
import UIKit


struct ThreeColumnSchema {
    
    // ==== Three Column
    public static func threeColumbMarginLeft() -> Int {
        return 72 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
    public static func threeColumnWidth() -> Int {
        return 260 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func threeChordColumnWidth() -> Int {
        return 170 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

    public static func threeColumnItemHeight() -> Int {
        return 40 + SGScreenLayout.sharedInstance.deviceIndex * 18
    }
    
    public static func threeColumnTableViewHeightForFooterInFirstSection() -> CGFloat {
        return CGFloat(10 + SGScreenLayout.sharedInstance.deviceIndex * 10)
    }
    
}


class ThreeColumnLayout: BaseTunningLayout {
    
    func layoutContainer(_ leftColumn: UIView, forThirdColumnView columnView: UIView,_ offX: Int,_ width:Int) {
        
        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(ThreeColumnSchema.threeColumbMarginLeft() + offX)
            make.width.equalTo(width)
            make.bottom.equalToSuperview()
        }
        
    }
    
}

