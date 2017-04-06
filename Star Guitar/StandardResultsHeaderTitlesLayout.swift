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
        return 80  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func getHeight() -> Int{
        return 40  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
}


class StandardResultsViewHelper{
    
    let titlesView =  UIView()
    
    func addAsTitles(_ pageContainer:UIView,_ tuningsResultContainer:UIView)  {
        pageContainer.addSubview(titlesView)
        
        titlesView.backgroundColor  = .red

        titlesView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(tuningsResultContainer)
            make.trailing.equalTo(tuningsResultContainer)
            make.top.equalTo(tuningsResultContainer).offset(-StandardResultsHeaderTitlesSchema.getHeight())
            make.height.equalTo(StandardResultsHeaderTitlesSchema.getHeight())
        }
        
        pageContainer.sendSubview(toBack: titlesView)
    }
}


