//
//  StandardResultsLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


struct StandResultsColumnSchema {


    // ==== Results
    public static func resultsMarginLeft() -> Int {
        return 32 + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func resultsItemEdgeInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 5, bottom: 6, right: 5)
    }

    public static func resultsItemWidth() -> Int {
        return 55 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(StandResultsColumnSchema.resultsItemEdgeInsets().left) + Int(StandResultsColumnSchema.resultsItemEdgeInsets().right))
    }

    public static func resultsItemHeight() -> Int {
        return 80 + SGScreenLayout.sharedInstance.deviceIndex * 20 + (Int(StandResultsColumnSchema.resultsItemEdgeInsets().top) + Int(StandResultsColumnSchema.resultsItemEdgeInsets().bottom))
    }

    public static func resultsLineSpacing() -> Int {
        return 0
    }

    public static func resultsInteritemSpacing() -> Int {
        return 0
    }

    public static func resultsColumnWidth() -> CGFloat {
        let itemsWidth = (StandResultsColumnSchema.resultsItemWidth() + StandResultsColumnSchema.resultsLineSpacing()) * 6
        return CGFloat(integerLiteral: itemsWidth)
    }

    public static func resultsColumnHeight() -> CGFloat {
        let itemsHeight = (StandResultsColumnSchema.resultsItemHeight() + StandResultsColumnSchema.resultsInteritemSpacing()) * 5
        return CGFloat(integerLiteral: itemsHeight )
    }

}


class StandardResultsLayout: BaseTuningsLayout {

    override func layoutResultsContainer(_ leftColumn: UIView, forResultView resultView: UIView,_ offLeading:Int) {
        resultView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(StandardResultsHeaderTitlesSchema.marginTop())
            make.leading.equalTo(leftColumn).offset(offLeading + StandResultsColumnSchema.resultsMarginLeft())
            make.width.equalTo(StandResultsColumnSchema.resultsColumnWidth())
            make.height.equalTo(StandResultsColumnSchema.resultsColumnHeight())
        }

        // Add titles to the tuning results view.
        StandardResultsViewHelper().addAsTitles(pageView!,resultView)
    }

}

