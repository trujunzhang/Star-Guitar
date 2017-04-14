//
//  CustomResultsHeaderTitlesLayout.swift
//  Star Guitar
//
//  Created by djzhang on 4/11/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit

struct CustomResultsHeaderTitlesSchema {
    
    // ==== ResultsBoarder
    public static func getHeight() -> Int{
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func marginTop(_ type:FretboardBorderType) -> Int {
        let off = (type == FretboardBorderType.left || type == FretboardBorderType.bottom) ? -4 : -28
        return -CustomResultsHeaderTitlesSchema.getHeight() + 10 + off
    }
    
}


class CustomResultsViewHelper{
    
    let titlesView =  UIView()
    
    func getTitles() -> [String] {
        /**
         * On the custom tuning in the right hand mode,  the numbers need to be 6th 5th 4th 3rd 2nd 1st
         * And the left hand tuning needs to be 1st 2nd 3rd 4th 5th 6th
         * And this also need to be for the one touch tuning
         */
        if(GuitarSettingsUtils.sharedInstance.isLeftHanded()){
            return ["1st","2nd","3rd","4th","5th","6th"] // And the left hand tuning needs to be 1st 2nd 3rd 4th 5th 6th
        }
        
        return ["6st","5nd","4rd","3th","2th","1th"] // On the custom tuning in the right hand mode,  the numbers need to be 6th 5th 4th 3rd 2nd 1st
    }
    
    func addAsTitles(_ pageContainer:UIView,_ fretboardView:UIView, _ type:FretboardBorderType)  {
        pageContainer.addSubview(titlesView)
        
        titlesView.backgroundColor  = .clear
        
        titlesView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(fretboardView)
            make.trailing.equalTo(fretboardView)
            make.top.equalTo(fretboardView).offset(CustomResultsHeaderTitlesSchema.marginTop(type))
            make.height.equalTo(CustomResultsHeaderTitlesSchema.getHeight())
        }
        
        pageContainer.sendSubview(toBack: titlesView)
        
        self.generateTitleViews()
    }
    
    func generateTitleViews()  {
        
        for (index,title) in self.getTitles().enumerated(){
            let itemView = UIView()
            
            let textLabel = UILabel()
            textLabel.text = title
            textLabel.font = UIFont.resultsCustomTitleFont()
            textLabel.textAlignment = .center
            textLabel.textColor = .black
            itemView.addSubview(textLabel)
            
            titlesView.addSubview(itemView)
            
            itemView.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(StandResultsColumnSchema.itemWidth() * index)
                make.bottom.equalToSuperview()
                make.width.equalTo(StandResultsColumnSchema.itemWidth())
                make.height.equalTo(CustomResultsHeaderTitlesSchema.getHeight())
            }
            
            textLabel.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }
}

