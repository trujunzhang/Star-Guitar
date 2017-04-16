//
//  FretboardLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//



import Foundation
import UIKit


/**
 * 6X14
 */
struct FretboardColumnSchema {
   
    // ==== Results
    public static func marginLeft() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func edgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    }
    
    public static func itemWidth() -> Int {
        return 56 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(FretboardColumnSchema.edgeInsets().left) + Int(FretboardColumnSchema.edgeInsets().right))
    }
    
    public static func itemHeight() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(FretboardColumnSchema.edgeInsets().top) + Int(FretboardColumnSchema.edgeInsets().bottom))
    }
    
    public static func resultsColumnWidth() -> CGFloat {
        let itemsWidth = (FretboardColumnSchema.itemWidth() ) * (6 + 1)
        return CGFloat(integerLiteral: itemsWidth)
    }
    
    public static func resultsColumnHeight() -> CGFloat {
        let itemsHeight = (FretboardColumnSchema.itemHeight() ) * (14 + 1)
        return CGFloat(integerLiteral: itemsHeight )
    }

    
    public static func touchChordLeading(_ type:FretboardBorderType) -> Int {
        if(type == FretboardBorderType.left || type == FretboardBorderType.top){
            return 320 + SGScreenLayout.sharedInstance.deviceIndex * 60
        }
        return 380 + SGScreenLayout.sharedInstance.deviceIndex * 60
    }
    
}


class FretboardLayout: BaseTuningsLayout {
    
    func layoutFretboard(_ leftColumn: UIView,_ fretboardView: UIView,_ leading: Int,_ type:FretboardBorderType) {
        fretboardView.backgroundColor = .clear
                
        fretboardView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(FretboardBorderSchema.marginTop(type))
            make.leading.equalTo(leftColumn).offset(leading)
            make.width.equalTo(FretboardColumnSchema.resultsColumnWidth())
            make.height.equalTo(FretboardColumnSchema.resultsColumnHeight())
        }                
    }
    
}

