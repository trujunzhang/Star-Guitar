//
//  OneColumnLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit

struct OneColumnSchema {

    // ==== One Column
    public static func oneColumbMarginLeft() -> Int {
        return 24 + SGScreenLayout.sharedInstance.deviceIndex * 10
    }

    public static func oneTwoColumnWidth() -> Int {
        return 60 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

    public static func oneColumnItemHeight() -> CGFloat {
        return CGFloat(integerLiteral: 56 + SGScreenLayout.sharedInstance.deviceIndex * 20)
    }

}


class OneColumnLayout: BaseTunningLayout {

    override func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {

        columnView.backgroundColor = UIColor(named: .tableRowBG)

        columnView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(OneColumnSchema.oneColumbMarginLeft())
            make.bottom.equalToSuperview()
            make.width.equalTo(OneColumnSchema.oneTwoColumnWidth())
        }

    }

}
