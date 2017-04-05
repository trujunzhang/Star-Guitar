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

public struct OneColumnLetterItem {
    var letter: String = ""
    var haveSharp: Bool = false
    var type:OneColumnLetterType
    
    init(_ type:OneColumnLetterType,letter: String, haveSharp: Bool) {
        self.type = type
        self.letter = letter
        self.haveSharp = haveSharp
    }
}

enum OneColumnLetterType: Int {
    case C = 0
    case CSharp = 1
    case D = 2
    case DSharp = 3
    case E = 4
    case F = 5
    case FSharp = 6
    case G = 7
    case GSharp = 8
    case A = 9
    case ASharp = 10
    case B = 11
    
    public static func getOneColumnLetterItems() -> [OneColumnLetterItem] {
        return [
            OneColumnLetterItem(OneColumnLetterType.C,letter: "C",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.CSharp,letter: "C",haveSharp: true),
            OneColumnLetterItem(OneColumnLetterType.D,letter: "D",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.DSharp,letter: "D",haveSharp: true),
            OneColumnLetterItem(OneColumnLetterType.E,letter: "E",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.F,letter: "F",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.FSharp,letter: "F",haveSharp: true),
            OneColumnLetterItem(OneColumnLetterType.G,letter: "G",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.GSharp,letter: "G",haveSharp: true),
            OneColumnLetterItem(OneColumnLetterType.A,letter: "A",haveSharp: false),
            OneColumnLetterItem(OneColumnLetterType.ASharp,letter: "A",haveSharp: true),
            OneColumnLetterItem(OneColumnLetterType.B,letter: "B",haveSharp: false),
        ]
    }
    
}


enum TwoColumnLetterType: Int {
    case N2 = 0
    case N3 = 1
    case N4 = 2
    case N5 = 3
    case N6 = 4
    
    public static func getTitles() -> [String] {
        return [
            "2","3","4","5","6"
        ]
    }
    
    public static func getTypeIndex(_ title: String) -> Int {
        return TwoColumnLetterType.getTitles().index(of: title)!
    }
    
}

public class ColumnResultItem {
    var letter: String = ""
    var haveSharp: Bool = false
    var number: String = ""
    
     var letterIndex = -1
     var numberIndex = -1
    
    init(){
        
    }
 
    func updateLetter(letterIndex:Int,oneColumnLetterItem: OneColumnLetterItem) {
        self.letterIndex = letterIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
    }
    
    func updateNumber(number:String) {
        self.number = number
        self.numberIndex = TwoColumnLetterType.getTypeIndex(number)
    }

    init(letterIndex:Int,numberIndex :Int,oneColumnLetterItem: OneColumnLetterItem,number: String) {
        self.letterIndex = letterIndex
        self.numberIndex = numberIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
        self.number = number
    }
}


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
        self.convert(TuningsStandardSettingsModel.getDefaultResults())
    }
    
    init( _ results: String) {
        self.convert(results)
    }
    
    private func convert(_ results: String){
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
            self.resultCells.append(resultColumn)
        }
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



class TuningsStandardSettingsUtils: AnyObject {
    
    private var settings: TuningsStandardSettings?
    private var settingsModel: TuningsStandardSettingsModel?
    
    private var currentColumnResultItem = ColumnResultItem()
    
    public func updateOneColumnLetter(_ letterIndex:Int){
        let oneColumns:[OneColumnLetterItem] = OneColumnLetterType.getOneColumnLetterItems()
        let oneColumnLetterItem = oneColumns[letterIndex]
        
        currentColumnResultItem.updateLetter ( letterIndex: letterIndex, oneColumnLetterItem: oneColumnLetterItem)
    }
    
    public func updateTwoColumnNumber(_ number:String){
        currentColumnResultItem.updateNumber(number: number)
    }
    
    public func toggleCurrentColumnResultItem(_ item: ColumnResultItem) {
        return self.currentColumnResultItem = item
    }
    
    public func getCurrentColumnResultItem() -> ColumnResultItem{
        return self.currentColumnResultItem
    }
    
    public func getResultCells() -> [[ColumnResultItem]]{
        return (self.settingsModel?.resultCells)!
    }
    
    init() {
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
