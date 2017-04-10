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
    public static func resultsMarginLeft() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func resultsItemEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    }
    
    public static func resultsItemWidth() -> Int {
        return 56 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(FretboardColumnSchema.resultsItemEdgeInsets().left) + Int(FretboardColumnSchema.resultsItemEdgeInsets().right))
    }
    
    public static func resultsItemHeight() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(FretboardColumnSchema.resultsItemEdgeInsets().top) + Int(FretboardColumnSchema.resultsItemEdgeInsets().bottom))
    }
    
    public static func resultsLineSpacing() -> Int {
        return 0
    }
    
    public static func resultsInteritemSpacing() -> Int {
        return 0
    }
    
    public static func resultsBoardWidth() -> Int {
        return 12
    }
    
    public static func resultsBoardHeight() -> Int {
        return 12
    }
    
    public static func resultsColumnWidth() -> CGFloat {
        let itemsWidth = (FretboardColumnSchema.resultsItemWidth() + FretboardColumnSchema.resultsLineSpacing()) * 6
        return CGFloat(integerLiteral: itemsWidth)
    }
    
    public static func resultsColumnHeight() -> CGFloat {
        let itemsHeight = (FretboardColumnSchema.resultsItemHeight() + FretboardColumnSchema.resultsInteritemSpacing()) * 14
        return CGFloat(integerLiteral: itemsHeight )
    }

    
    public static func touchChordLeading() -> Int {
        return 200 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
}


class FretboardLayout: BaseTuningsLayout {
    
    func layoutFretboard(_ leftColumn: UIView, forFretboardView fretboardView: UIView,_ offLeading:Int,_ leading: Int,_ type:FretboardBorderType) {
        fretboardView.backgroundColor = UIColor(named: .transparent)
        
        fretboardView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(FretboardBorderSchema.outBoardSize() + 4)
            make.leading.equalTo(leftColumn).offset(leading)
            make.width.equalTo(FretboardColumnSchema.resultsColumnWidth())
            make.height.equalTo(FretboardColumnSchema.resultsColumnHeight())
        }
        
        // Add boarder effect to the fretboard view.
        //let type = FretboardBorderType.top
        FretboardViewHelper().addAsBoarder(pageView!,fretboardView,type)
    }
    
}

