//
//  TwoColumnLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


struct TwoColumnSchema {

    // ==== Two Column
    public static func twoColumbMarginLeft() -> Int {
        return 72 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }

    public static func twoColumnHeight() -> Int {
        return 280 + SGScreenLayout.sharedInstance.deviceIndex * 120
    }


}


class TwoColumnLayout: BaseTunningLayout {

    override func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {

        columnView.backgroundColor = UIColor(named: .tableRowBG)

        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalTo(leftColumn).offset(TwoColumnSchema.twoColumbMarginLeft())
            make.width.equalTo(OneColumnSchema.oneTwoColumnWidth())
            make.height.equalTo(TwoColumnSchema.twoColumnHeight())
        }


    }

}

