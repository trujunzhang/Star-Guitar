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
    public static func tunningTypeMarginLeft() -> Int {
        return 70 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }

    public static func tunningTypesColumnWidth() -> Int {
        return 280 + SGScreenLayout.sharedInstance.deviceIndex * 60
    }

    public static func tunningTypesItemHeight() -> Int {
        return 80 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

    public static func tunningTypesColumnHeight() -> Int {
        return TuningTypeSchema.tunningTypesItemHeight() * 5 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

}


class TuningsTypeLayout: BaseTunningLayout {

    func layoutTuningTypeContainer(_ leftColumn: UIView, forView containerView: UIView,_ offLeading:CGFloat) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(leftColumn).offset(Int(offLeading) + TuningTypeSchema.tunningTypeMarginLeft())
            make.width.equalTo(TuningTypeSchema.tunningTypesColumnWidth())
            make.height.equalTo(TuningTypeSchema.tunningTypesColumnHeight())
        }

    }

}
