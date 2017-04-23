//
//  StandardResultsHeaderTitlesLayoutLayout.swift
//  Star Guitar
//
//  Created by djzhang on 4/6/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

struct StandardResultsHeaderTitlesSchema {
    
    // ==== ResultsBoarder
    public static func marginTop() -> Int {
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func getHeight() -> Int{
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
}


class StandardResultsViewHelper{
    
    let titlesView =  UIView()
    
    func getTitles() -> [String] {
        /*
         * the standard tuning still need to be reversed in the left handed setting
         *
         */
        if(GuitarConfigureAsync.sharedInstance.isLeftHanded()){
           return GuitarPlist.guitarPlistDict.Title1To6 //["1st","2nd","3rd","4th","5th","6th"]
        }
        
         return GuitarPlist.guitarPlistDict.Title6To1 // ["6st","5nd","4rd","3th","2th","1th"] // the standard tuning still need to be reversed in the left handed setting
    }
    
    func addAsTitles(_ pageContainer:UIView,_ tuningsResultContainer:UIView)  {
        pageContainer.addSubview(titlesView)
        
        titlesView.backgroundColor  = .clear
        
        titlesView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(tuningsResultContainer)
            make.trailing.equalTo(tuningsResultContainer)
            make.top.equalTo(tuningsResultContainer).offset(-StandardResultsHeaderTitlesSchema.getHeight() + 10)
            make.height.equalTo(StandardResultsHeaderTitlesSchema.getHeight())
        }
        
        pageContainer.sendSubview(toBack: titlesView)
        
        self.generateTitleViews()
    }
    
    func generateTitleViews()  {
        
        for (index,title) in self.getTitles().enumerated(){
            let itemView = UIView()
            
            let textLabel = UILabel()
            textLabel.text = title
            textLabel.font = UIFont.resultsTitleFont()
            textLabel.textAlignment = .center
            textLabel.textColor = .black
            itemView.addSubview(textLabel)
            
            titlesView.addSubview(itemView)
            
            itemView.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(StandResultsColumnSchema.itemWidth() * index)
                make.bottom.equalToSuperview()
                make.width.equalTo(StandResultsColumnSchema.itemWidth())
                make.height.equalTo(StandardResultsHeaderTitlesSchema.getHeight())
            }
            
            textLabel.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }
}


