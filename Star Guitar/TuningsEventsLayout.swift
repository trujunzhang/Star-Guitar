//
//  TuningsEventsLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


struct EventsSchema {

    // ==== Events
    public static func itemWidth() -> Int {
        return 112 + SGScreenLayout.sharedInstance.deviceIndex * 10
    }

    public static func itemHeight() -> Int {
        return 20 + SGScreenLayout.sharedInstance.deviceIndex * 10
    }

    public static func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    public static func eventsLineSpacing() -> Int {
        return 10
    }

    public static func columnWidth() -> CGFloat {
        let itemsWidth = (EventsSchema.itemWidth() * 4 + EventsSchema.eventsLineSpacing()) + 100
        let eventsWidth = CGFloat(integerLiteral: itemsWidth) + EventsSchema.edgeInsets().left + EventsSchema.edgeInsets().right
        return eventsWidth
    }

    public static func columnHeight() -> CGFloat {
        let itemsHeight = (EventsSchema.itemHeight() + 10)
        return CGFloat(integerLiteral: itemsHeight + 20) + EventsSchema.edgeInsets().top + EventsSchema.edgeInsets().bottom
    }

    public static func marginBottom() -> Int{
        return -4 - SGScreenLayout.sharedInstance.deviceIndex * 10
    }

}

class TuningsEventsLayout: BaseTuningsLayout {

    override func layoutContainer(_ leftColumn: UIView, forView containerView: UIView) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.trailing.equalToSuperview().offset(-120)
            make.bottom.equalToSuperview().offset(EventsSchema.marginBottom())
            make.width.equalTo(EventsSchema.columnWidth())
            make.height.equalTo(EventsSchema.columnHeight())
        }

    }

}
