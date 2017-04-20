//
//  SGStandardResultsViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation


extension SGStandardResultsViewController{
    
    public func getStandardResultsActionRow(_ item:StandardResultItem) ->Row{
        let canHighlight = item.canHighlight
        if(canHighlight){
            if(item.haveSharp){
                return StandardResultsSharpActionRow(item: item, action: toggleNote)
            }
            return StandardResultsActionRow(item: item, action: toggleNote)
        }else{
            if(item.haveSharp){
                return StandardResultsNoHighSharpActionRow(item: item, action: nil)
            }
            return StandardResultsNoHighActionRow(item: item, action: nil)
        }
    }
    
    public func toggleNote(_ sender: Row) {
        if let _row = sender as? StandardResultsBasicActionRow{
            delegate?.toggleCell(_row.item!)
        }
    }
    
}
