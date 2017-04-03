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
        return 90 + SGScreenLayout.sharedInstance.deviceIndex * 20
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

    public static func eventsColumnWidth() -> CGFloat {
        let itemsWidth = (EventsSchema.itemWidth() * 4 + EventsSchema.eventsLineSpacing()) + 100
        let eventsWidth = CGFloat(integerLiteral: itemsWidth) + EventsSchema.edgeInsets().left + EventsSchema.edgeInsets().right
        return eventsWidth
    }

    public static func eventsColumnHeight() -> CGFloat {
        let itemsHeight = (EventsSchema.itemHeight() + 10)
        return CGFloat(integerLiteral: itemsHeight + 20) + EventsSchema.edgeInsets().top + EventsSchema.edgeInsets().bottom
    }


}

class TuningsEventsLayout: BaseTuningsLayout {

    override func layoutContainer(_ leftColumn: UIView, forView containerView: UIView) {
        containerView.snp.makeConstraints { (make) -> Void in
            make.trailing.equalToSuperview().offset(-120)
            make.bottom.equalToSuperview().offset(-14)
            make.width.equalTo(EventsSchema.eventsColumnWidth())
            make.height.equalTo(EventsSchema.eventsColumnHeight())
        }

    }

}
