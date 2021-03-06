//
//  FontExtensions.swift
//  Star Guitar
//
//  Created by djzhang on 3/24/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import FontBlaster

extension UIFont {
    static func list() {
        for fontFamilyName in UIFont.familyNames {
            print("--- %@ ---", fontFamilyName)

            for fontName in UIFont.fontNames(forFamilyName: fontFamilyName) {
                print("--- %@ ---", fontName)
            }

            print("")
        }

    }

    static func loadFonts() {
        //FontBlaster.debugEnabled = true
        FontBlaster.blast { (fonts) -> Void in
            //print("Loaded Fonts", fonts)
        }
    }

    private static func adustFontSize(_ value: Int) -> CGFloat {
        return CGFloat(SGScreenLayout.sharedInstance.deviceIndex * 4 + value)
    }

    static func tableRowFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(22))
    }

    static func tableTitleFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(32))
    }

    static func pageTitleFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(56))
    }

    static func pageSubtitleFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(42))
    }

    static func oneColumnFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(32))
    }

    static func oneColumnSharpFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(24))
    }

    static func TunningTypesFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(36))
    }
    
    static func TunningThreeColumnFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(26))
    }

    static func TunningEventsFont() -> UIFont {
        return UIFont(font: FontFamily.ErasDemiITC.regular, size: UIFont.adustFontSize(36))
    }

}
