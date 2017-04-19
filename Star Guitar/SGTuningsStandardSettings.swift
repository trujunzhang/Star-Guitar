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
    
    public lazy var standardResultCells: [[ColumnResultItem]]  = {
        return [[ColumnResultItem]]()
    }()
    
    public static func getStandardRightHandResultsCellsx() -> [[ColumnResultItem]]{
        let standardResultString = String(format: "%@;%@;%@;%@;%@",
                                          "4-0,9-0,2-1,7-1,11-1,4-2",
                                          "2-0,9-0,2-1,7-1,11-1,4-2",
                                          "2-0,9-0,2-1,7-1,9-1,2-2",
                                          "0-0,7-0,0-1,7-1,0-2,4-2",
                                          "-1,-1,-1,-1,-1,-1"
        )
        
        return TuningsStandardFactory.convert(standardResultString)
    }
    
    public static func getStandardLeftHandResultsCellsx() -> [[ColumnResultItem]]{
        let standardLeftHandResultString = String(format: "%@;%@;%@;%@;%@",
                                                  "4-2,11-1,7-1,2-1,9-0,4-2",
                                                  "4-2,11-1,7-1,2-1,9-0,2-0",
                                                  "2-2,9-1,7-1,2-1,9-0,2-0",
                                                  "4-2,0-2,7-1,0-1,7-0,0-0",
                                                  "-1,-1,-1,-1,-1,-1"
        )
        
        return TuningsStandardFactory.convert(standardLeftHandResultString)
    }
    
    public static func getTypeCResultsCells() -> [[ColumnResultItem]]{
        let typeCResultString = String(format: "%@;%@;%@;%@;%@",
                                       "4-2,11-1,7-1,2-1,9-0,4-2",
                                       "4-2,11-1,7-1,2-1,9-0,2-0",
                                       "2-2,9-1,7-1,2-1,9-0,2-0",
                                       "4-2,0-2,7-1,0-1,7-0,0-0",
                                       "-1,-1,-1,-1,-1,-1"
        )
        
        return TuningsStandardFactory.convert(typeCResultString)
    }
    
    public static func getCurrentResultsCell() -> [[ColumnResultItem]] {
        return TuningsStandardFactory.getStandardLeftHandResultsCellsx()
    }
    
    public static func convert(_ results: String) -> [[ColumnResultItem]]{
        let rows = (results.components(separatedBy: ";"))
        //let columns = (row.components(separatedBy: ","))
        //return TuningsStandardFactory.convert(rows:rows)
        
        return [[ColumnResultItem]]()
    }
    
    public static func convert(rows: [[String]]) -> [[ColumnResultItem]]{
        var resultCells: [[ColumnResultItem]] = [[ColumnResultItem]]()
        
        let oneColumns:[OneColumnLetterItem] = OneColumnLetterType.getOneColumnLetterItems()
        let twoColumns = TwoColumnNumberType.getTitles()
        
        for oneLine in rows{
            var resultColumn = [ColumnResultItem]()

            for column in oneLine{
                var item = ColumnResultItem()
                if(column != "-1"){
                    let array = (column.components(separatedBy: "-")).flatMap({ Int($0) })
                    if(array.count == 2){
                        let letterIndex = array[0]
                        let numberIndex = array[1]
                        let oneColumnLetterItem = oneColumns[letterIndex]
                        item = ColumnResultItem(letterIndex: letterIndex,numberIndex: numberIndex,oneColumnLetterItem: oneColumnLetterItem,number: twoColumns[numberIndex])
                    }
                }
                resultColumn.append(item)
            }
            resultCells.append(resultColumn)
        }
        
        return resultCells
    }
    
    
}

class TuningsStandardSettingsModel {
    public static func getStandardTypeResults() -> String {
        return String(format: "%@;%@;%@;%@;%@",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1",
                      "-1,-1,-1,-1,-1,-1"
        )
    }
    
    var resultCells: [[ColumnResultItem]] = [[ColumnResultItem]]()
    
    init() {
    }
    
    init( _ results: String) {
        self.resultCells = TuningsStandardFactory.convert(results)
    }
}



class TuningsStandardSettingsUtils: TuningsBaseSettingsUtils {
    
    var currentStandardTuningsType: Int = TuningsStandardType.Stardand.rawValue
    
    private var settingsModel: TuningsStandardSettingsModel?
    
    public func toggleCurrentColumnResultItem(_ item: ColumnResultItem) {
        return self.currentColumnResultItem = item
    }
    
    public func getCurrentColumnResultItem() -> ColumnResultItem{
        return self.currentColumnResultItem
    }
    
    public func getCurrentResultCells() -> [[ColumnResultItem]]{
        return TuningsStandardFactory.convert(rows:GuitarPlist.guitarPlistDict.standardLeftHandResultString)
    }
    
    public func setCurrentStandardTuningsType(_ title: String){
        self.currentStandardTuningsType = TuningsStandardType.getTypeIndex(title)
    }
    
    override init() {
        super.init()
    }
}
