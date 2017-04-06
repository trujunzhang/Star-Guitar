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

    // ==== Tunings Types
    public static func itemWidth() -> Int {
         return 200 + SGScreenLayout.sharedInstance.deviceIndex * 60
    }
    
    public static func itemHeight() -> Int {
        return 90 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

    public static func tuningsTypeMarginLeft() -> Int {
        return 70 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }

    public static func tuningsTypesColumnHeight() -> Int {
        return TuningTypeSchema.itemHeight() * 5 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

}


class TuningsTypeLayout: BaseTuningsLayout {

    func layoutTuningTypeContainer(_ leftColumn: UIView, forView containerView: UIView,_ offLeading:CGFloat) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(30 + SGScreenLayout.sharedInstance.deviceIndex * 16 )
            make.leading.equalTo(leftColumn).offset(Int(offLeading) + TuningTypeSchema.tuningsTypeMarginLeft())
            make.width.equalTo(TuningTypeSchema.itemWidth())
            make.height.equalTo(TuningTypeSchema.tuningsTypesColumnHeight())
        }

    }

}
