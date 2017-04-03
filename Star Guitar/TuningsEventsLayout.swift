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
    public static func eventsItemWidth() -> Int {
        return 90 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

    public static func eventsItemHeight() -> Int {
        return 20 + SGScreenLayout.sharedInstance.deviceIndex * 10
    }

    public static func eventsEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    public static func eventsLineSpacing() -> Int {
        return 10
    }

    public static func eventsColumnWidth() -> CGFloat {
        let itemsWidth = (EventsSchema.eventsItemWidth() * 4 + EventsSchema.eventsLineSpacing()) + 100
        let eventsWidth = CGFloat(integerLiteral: itemsWidth) + EventsSchema.eventsEdgeInsets().left + EventsSchema.eventsEdgeInsets().right
        return eventsWidth
    }

    public static func eventsColumnHeight() -> CGFloat {
        let itemsHeight = (EventsSchema.eventsItemHeight() + 10)
        return CGFloat(integerLiteral: itemsHeight + 20) + EventsSchema.eventsEdgeInsets().top + EventsSchema.eventsEdgeInsets().bottom
    }


}

class TuningsEventsLayout: BaseTunningLayout {

    override func layoutContainer(_ leftColumn: UIView, forView containerView: UIView) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.trailing.equalToSuperview().offset(-120)
            make.bottom.equalToSuperview().offset(-14)
            make.width.equalTo(EventsSchema.eventsColumnWidth())
            make.height.equalTo(EventsSchema.eventsColumnHeight())
        }

    }

}
