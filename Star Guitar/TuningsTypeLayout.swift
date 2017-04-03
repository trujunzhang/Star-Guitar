//
//  TuningsTypeLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


struct TuningTypeSchema {

    // ==== Tunnnings Types
    public static func itemWidth() -> Int {
         return 200 + SGScreenLayout.sharedInstance.deviceIndex * 60
    }
    
    public static func itemHeight() -> Int {
        return 80 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    public static func tunningTypeMarginLeft() -> Int {
        return 70 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }

    public static func tunningTypesColumnHeight() -> Int {
        return TuningTypeSchema.itemHeight() * 5 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

}


class TuningsTypeLayout: BaseTuningsLayout {

    func layoutTuningTypeContainer(_ leftColumn: UIView, forView containerView: UIView,_ offLeading:CGFloat) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(Int(offLeading) + TuningTypeSchema.tunningTypeMarginLeft())
            make.width.equalTo(TuningTypeSchema.itemWidth())
            make.height.equalTo(TuningTypeSchema.tunningTypesColumnHeight())
        }

    }

}
