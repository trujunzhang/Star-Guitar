//
//  SGStandardResultsViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation


extension SGStandardResultsViewController{
    
    public  func getStandardResultsActionRow(_ item:ColumnResultItem) ->Row{
        var action: ((Row) -> Void)? = toggleNote
        if(item.haveSharp){
            return StandardResultsSharpActionRow(item: item, action: action)
        }
        return StandardResultsActionRow(item: item, action: action)
    }
    
    private func toggleNote(_ sender: Row) {
        if let _row = sender as? StandardResultsActionRow{
            delegate?.toggleCell(_row.item!)
        }else if let _row = sender as? StandardResultsSharpActionRow{
            delegate?.toggleCell(_row.item!)
        }
    }
    
}
