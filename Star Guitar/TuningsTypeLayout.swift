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
    
    public static func marginTop() -> Int {
        return 40 + SGScreenLayout.sharedInstance.deviceIndex * 16
    }

    public static func tuningsTypeMarginLeft() -> Int {
        return 70 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }

    public static func tuningsTypesColumnHeight() -> Int {
        return TuningTypeSchema.itemHeight() * 5
    }

}


class TuningsTypeLayout: BaseTuningsLayout {

    func layoutTuningTypeContainer(_ leftColumn: UIView, forView containerView: UIView,_ offLeading:CGFloat) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(TuningTypeSchema.marginTop() )
            make.leading.equalTo(leftColumn).offset(Int(offLeading) + TuningTypeSchema.tuningsTypeMarginLeft())
            make.width.equalTo(TuningTypeSchema.itemWidth())
            make.height.equalTo(TuningTypeSchema.tuningsTypesColumnHeight())
        }

    }

}
