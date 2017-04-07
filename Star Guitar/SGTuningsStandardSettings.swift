//
//  TuningsStandardSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/3/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


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

//
// ===
// Realm Object
//
class TuningsStandardSettings: Object {
    
    dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    // 6X5
    dynamic var results: String = TuningsStandardSettingsModel.getDefaultResults()
    
}

class TuningsStandardFactory{
    
    public lazy var standardResultCells: [[ColumnResultItem]]  = {
        return [[ColumnResultItem]]()
    }()

    public static func getStandardResultsCells() -> [[ColumnResultItem]]{
        let standardResultString = String(format: "%@;%@;%@;%@;%@",
                                          "4-0,9-0,2-1,7-1,11-1,4-2",
                                          "2-0,9-0,2-1,7-1,11-1,4-2",
                                          "2-0,9-0,2-1,7-1,9-1,2-2",
                                          "0-0,7-0,0-1,7-1,0-2,4-2",
                                          "-1,-1,-1,-1,-1,-1"
        )

        return TuningsStandardFactory.convert(standardResultString)
    }
    
    public static func convert(_ results: String) -> [[ColumnResultItem]]{
        var resultCells: [[ColumnResultItem]] = [[ColumnResultItem]]()
        
        let oneColumns:[OneColumnLetterItem] = OneColumnLetterType.getOneColumnLetterItems()
        let twoColumns = TwoColumnLetterType.getTitles()
        let rows = (results.components(separatedBy: ";"))
        for row in rows{
            var resultColumn = [ColumnResultItem]()
            let columns = (row.components(separatedBy: ","))
            for column in columns{
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
    public static func getDefaultResults() -> String {
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
        // Empty here.
        //self.resultCells = TuningsFactory.convert(TuningsStandardSettingsModel.getDefaultResults())
        
        self.resultCells = TuningsStandardFactory.getStandardResultsCells()
    }
    
    init( _ results: String) {
        self.resultCells = TuningsStandardFactory.convert(results)
    }
    
    public func getResults() -> String{
        return ""
    }
    
    public static func convert(_ settings: TuningsStandardSettings) -> TuningsStandardSettingsModel {
        return TuningsStandardSettingsModel( settings.results)
    }
    
    public func generate() -> TuningsStandardSettings {
        let settings = TuningsStandardSettings()
        //settings.results = self.results
        return settings
    }
}



class TuningsStandardSettingsUtils: TuningsBaseSettingsUtils {
    
    private var settings: TuningsStandardSettings?
    private var settingsModel: TuningsStandardSettingsModel?
        
    public func toggleCurrentColumnResultItem(_ item: ColumnResultItem) {
        return self.currentColumnResultItem = item
    }
    
    public func getCurrentColumnResultItem() -> ColumnResultItem{
        return self.currentColumnResultItem
    }
    
    public func getResultCells() -> [[ColumnResultItem]]{
        return (self.settingsModel?.resultCells)!
    }
    
    override init() {
        super.init()
        self.readSettings()
    }
    
    public func readSettings() {
        if let existSetting = self.readStandardSettings() {
            self.settings = existSetting
            self.settingsModel = TuningsStandardSettingsModel.convert(existSetting)
        } else {
            self.settingsModel = TuningsStandardSettingsModel()
        }
    }
    
    private func readStandardSettings() ->TuningsStandardSettings? {
        let realm = try! Realm()
        
        let items = realm.objects(TuningsStandardSettings.self)
        if (items.count == 1) {
            return items[0]
        }
        
        return nil
    }
    
    public func writeSettings() {
        // Get the default Realm
        let realm = try! Realm()
        // You only need to do this once (per thread)
        
        // Add to the Realm inside a transaction
        if let lastSettings = self.settings {
            // Update an object with a transaction
            try! realm.write {
                lastSettings.results = (self.settingsModel?.getResults())!
            }
        } else {
            // No exist, create it.
            try! realm.write {
                realm.create(GuitarSettings.self, value:
                    [
                        "results": (self.settingsModel?.getResults())!
                    ]
                )
            }
            // Then, read it again.
            self.readSettings()
        }
    }
}
