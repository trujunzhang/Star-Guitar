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
    public static func marginTop() -> Int {
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func getHeight() -> Int{
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
}


class CustomResultsViewHelper{
    
    let titlesView =  UIView()
    
    let titles:[String] = ["6st","5nd","4rd","3th","2th","1th"]
    
    func addAsTitles(_ pageContainer:UIView,_ fretboardView:UIView)  {
        pageContainer.addSubview(titlesView)
        
        titlesView.backgroundColor  = UIColor(named: .transparent)
        
        titlesView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(fretboardView)
            make.trailing.equalTo(fretboardView)
            make.top.equalTo(fretboardView).offset(-CustomResultsHeaderTitlesSchema.getHeight() + 10)
            make.height.equalTo(CustomResultsHeaderTitlesSchema.getHeight())
        }
        
        pageContainer.sendSubview(toBack: titlesView)
        
        self.generateTitleViews()
    }
    
    func generateTitleViews()  {
        
        for (index,title) in self.titles.enumerated(){
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
                make.height.equalTo(CustomResultsHeaderTitlesSchema.getHeight())
            }
            
            textLabel.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview()
            }
        }
    }
}

