//
//  SGScreenLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/25/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

class SGScreenLayout: AnyObject {
    static let sharedInstance = SGScreenLayout()

    let deviceIndex = DevicesManager.getDeviceIndex()

    // === Page's top title container contains backArrow,title,subtitle
    func PageTitleHeight() -> CGFloat {
        return CGFloat(100)
    }

}

struct SGSettingsScreen {

    // === Settings
    public static func settingsSectionHeaderHeight() -> CGFloat {
        return CGFloat(integerLiteral: 56 + SGScreenLayout.sharedInstance.deviceIndex * 20)
    }

    public static func settingsRowHeightInSection() -> CGFloat {
        return CGFloat(integerLiteral: 42 + SGScreenLayout.sharedInstance.deviceIndex * 20)
    }

    public static func settingsRowMarginTopInSection() -> CGFloat {
        return 3
    }

    // === Settings's Effect
    // *** Mute Settings
    public static func firstCellOffYInEffectSection() -> CGFloat {
        return SGSettingsScreen.settingsRowHeightInSection() + SGSettingsScreen.settingsRowMarginTopInSection()
    }
    // *** 6 mute buttons
    public static func secondButtonsWHInEffectSection() -> Int {
        return (40 + SGScreenLayout.sharedInstance.deviceIndex * 10)
    }

    // *** 6 mute buttons's marginTop and marginButton
    public static func secondButtonsMarginInEffectSection() -> Int {
        return 55 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }

    // *** 6 mute buttons's marginLeft
    public static func secondButtonsOffXInEffectSection() -> Int {
        return self.secondButtonsWHInEffectSection() + 12
    }

    // === Settings's slider
    public static func sliderMarginTop() -> Int {
        return -5
    }

}
