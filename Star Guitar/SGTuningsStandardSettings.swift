//
//  TuningsStandardSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/3/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit



/**
 *
 * The first thing that must be clicked is the
 tuning type(standard, drop d, ect) then the
 place where the note will go, and then the
 letter  and number of the note. everything
 grey and transparent until the tuning type
 clicked on
 *
 */

class TuningsStandardFactory{
    public static func convert(_ results: String) -> [[StandardResultItem]]{
        var rows = [[String]]()
        let lines = (results.components(separatedBy: ";"))
        
        for oneLine in lines{
            var resultColumn = [String]()
            let columns = (oneLine.components(separatedBy: ","))
            for column in columns{
                resultColumn.append(column)
            }
            rows.append(resultColumn)
        }
        
        return TuningsStandardFactory.convert(rows:rows)
    }
    
    public static func convert(rows: [[String]]) -> [[StandardResultItem]]{
        var resultCells: [[StandardResultItem]] = [[StandardResultItem]]()
        
        let oneColumns:[OneColumnLetterItem] = OneColumnLetterType.getOneColumnLetterItems()
        let twoColumns = TwoColumnNumberType.getTitles()
        
        for (section,oneLine) in rows.enumerated(){
            var resultColumn = [StandardResultItem]()
            
            for (row,column) in oneLine.enumerated(){
                let indexPath: IndexPath = IndexPath(row: row, section: section)
                var item = StandardResultItem(indexPath:indexPath)
                if(column != "-1"){
                    let array = (column.components(separatedBy: "-")).flatMap({ Int($0) })
                    if(array.count == 3){
                        let letterIndex = array[0]
                        let numberIndex = array[1]

                        let oneColumnLetterItem = oneColumns[letterIndex]
                        item = StandardResultItem(indexPath:indexPath,letterIndex: letterIndex,numberIndex: numberIndex,oneColumnLetterItem: oneColumnLetterItem,number: twoColumns[numberIndex])
                    }
                }
                resultColumn.append(item)
            }
            resultCells.append(resultColumn)
        }
        
        return resultCells
    }
    
    
}

class TuningsStandardSettingsUtils: TuningsBaseSettingsUtils {
    
    var currentStandardTuningsType: Int = TuningsStandardType.Stardand.rawValue
    
    public func setCurrentStandardResultItem(_ item: StandardResultItem) {
         self.currentStandardResultItem = item
    }
    
    public func getCurrentStandardResultItem() -> StandardResultItem{
        return (self.currentStandardResultItem)!
    }
    
    public func getCurrentResultCells() -> [[StandardResultItem]]{
        if(GuitarConfigureAsync.sharedInstance.isLeftHanded()){
            return TuningsStandardFactory.convert(rows:GuitarPlist.guitarPlistDict.standardLeftHandResultString)
        }
        
        return TuningsStandardFactory.convert(rows:GuitarPlist.guitarPlistDict.standardRightHandResultString)
    }
    
    public func setCurrentStandardTuningsType(_ title: String){
        self.currentStandardTuningsType = TuningsStandardType.getTypeIndex(title)
    }
    
    public func setCurrentStandardTuningsType(_ type: TuningsStandardType){
        self.currentStandardTuningsType = type.rawValue
    }
    
    override init() {
        super.init()
    }
}
