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
struct CustomResultsColumnSchema {
   
    // ==== Results
    public static func resultsMarginLeft() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func resultsItemEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4)
    }
    
    public static func resultsItemWidth() -> Int {
        return 56 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(CustomResultsColumnSchema.resultsItemEdgeInsets().left) + Int(CustomResultsColumnSchema.resultsItemEdgeInsets().right))
    }
    
    public static func resultsItemHeight() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(CustomResultsColumnSchema.resultsItemEdgeInsets().top) + Int(CustomResultsColumnSchema.resultsItemEdgeInsets().bottom))
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
        let itemsWidth = (CustomResultsColumnSchema.resultsItemWidth() + CustomResultsColumnSchema.resultsLineSpacing()) * 6
        return CGFloat(integerLiteral: itemsWidth)
    }
    
    public static func resultsColumnHeight() -> CGFloat {
        let itemsHeight = (CustomResultsColumnSchema.resultsItemHeight() + CustomResultsColumnSchema.resultsInteritemSpacing()) * 14
        return CGFloat(integerLiteral: itemsHeight )
    }

    
    public static func touchChordLeading() -> Int {
        return 200 + SGScreenLayout.sharedInstance.deviceIndex * 40
    }
    
}


class FretboardLayout: BaseTuningsLayout {
    
    func layoutFretboard(_ leftColumn: UIView, forResultView resultView: UIView,_ offLeading:Int,_ leading: Int) {
        resultView.backgroundColor = UIColor(named: .transparent)
        
        resultView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(ResultsBoarderSchema.outBoardSize() + 4)
            make.leading.equalTo(leftColumn).offset(leading)
            make.width.equalTo(CustomResultsColumnSchema.resultsColumnWidth())
            make.height.equalTo(CustomResultsColumnSchema.resultsColumnHeight())
        }
        
        // Add boarder effect to the tuning results view.
        let type = ResultsBoarderType.top
        ResultsBoarderHelper().addAsBoarder(pageView!,resultView,type)
        
    }
    
}

