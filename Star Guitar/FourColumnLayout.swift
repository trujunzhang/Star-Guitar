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
    public static func marginLeft() -> Int {
        return 72 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
    public static func width() -> Int {
        return 160 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
}


class FourColumnLayout: BaseTuningsLayout {
    
    override func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {
        
        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(FourColumnSchema.marginLeft() + 108)
            make.width.equalTo(FourColumnSchema.width())
            make.bottom.equalToSuperview()
        }
        
    }
    
}
