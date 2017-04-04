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
 * the first thing that must be clicked is the
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
    
    init(letter: String, haveSharp: Bool) {
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
            OneColumnLetterItem(letter: "C",haveSharp: false),
            OneColumnLetterItem(letter: "C",haveSharp: true),
            OneColumnLetterItem(letter: "D",haveSharp: false),
            OneColumnLetterItem(letter: "D",haveSharp: true),
            OneColumnLetterItem(letter: "E",haveSharp: false),
            OneColumnLetterItem(letter: "F",haveSharp: false),
            OneColumnLetterItem(letter: "F",haveSharp: true),
            OneColumnLetterItem(letter: "G",haveSharp: false),
            OneColumnLetterItem(letter: "G",haveSharp: true),
            OneColumnLetterItem(letter: "A",haveSharp: false),
            OneColumnLetterItem(letter: "A",haveSharp: true),
            OneColumnLetterItem(letter: "B",haveSharp: false),
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
    
}

struct ColumnResultItem {
    var letter: String = ""
    var haveSharp: Bool = false
    var number: String = ""
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
    dynamic var results: String = String(format: "%@%@%@%@%@", "","","","","")
}

class TuningsStandardSettingsModel {
    var results: String = "0,1,1"
    
    init() {
        // Empty here.
    }
    
    init( _ results: String) {
        self.results = results
    }
    
    public static func convert(_ settings: TuningsStandardSettings) -> TuningsStandardSettingsModel {
        return TuningsStandardSettingsModel( settings.results)
    }
    
    public func generate() -> TuningsStandardSettings {
        let settings = TuningsStandardSettings()
        settings.results = self.results
        return settings
    }
}



class TuningsStandardSettingsUtils: AnyObject {

    private var settings: TuningsStandardSettings?
    private var settingsModel: TuningsStandardSettingsModel?
    
    private var currentColumnResultItem = ColumnResultItem()
    
    public func updateOneColumnLetter(_ letter:String){
        currentColumnResultItem.letter = letter
    }
    
    public func updateTwoColumnNumber(_ number:String){
        currentColumnResultItem.number = number
    }
    
    public func getCurrentColumnResultItem() -> ColumnResultItem{
        return self.currentColumnResultItem
    }
    
    
    public func readSettings() {
        if let existSetting = self.readGuitarSettings() {
            self.settings = existSetting
            self.settingsModel = TuningsStandardSettingsModel.convert(existSetting)
        } else {
            self.settingsModel = TuningsStandardSettingsModel()
        }
    }
    
    private func readGuitarSettings() ->TuningsStandardSettings? {
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
                lastSettings.results = (self.settingsModel?.results)!
            }
        } else {
            // No exist, create it.
            try! realm.write {
                realm.create(GuitarSettings.self, value:
                    [
                        "results": (self.settingsModel?.results)!
                    ]
                )
            }
            // Then, read it again.
            self.readSettings()
        }
    }
}
