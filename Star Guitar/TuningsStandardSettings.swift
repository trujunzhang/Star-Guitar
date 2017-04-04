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
    
    public static func getTitles() -> [String] {
        return ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    }
    
    public static func getGuitarType(_ title: String) -> Int {
        return OneColumnLetterType.getTitles().index(of: title)!
    }
    
}



class TuningsStandardSettings: Object {
    
    dynamic var id = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    dynamic var fretboardRows: String = "0,1,1"
    
    dynamic var muteArray: String = "0,0,1,1,0,0"
    
    dynamic var fingerSlider: Bool = true
}

class TuningsStandardSettingsModel {
    var guitarType = GuitarType.Electric.rawValue
    var fretboardRows: String = "0,1,1"
    var muteArray: String = "0,0,1,1,0,0"
    var fingerSlider: Bool = true
    
    init() {
        // Empty here.
    }
    
    init( _ fretboardRows: String, _ muteArray: String, _ fingerSlider: Bool) {
        self.fretboardRows = fretboardRows
        self.muteArray = muteArray
        self.fingerSlider = fingerSlider
    }
    
    public static func convert(_ settings: TuningsStandardSettings) -> TuningsStandardSettingsModel {
        return TuningsStandardSettingsModel( settings.fretboardRows, settings.muteArray, settings.fingerSlider)
    }
    
    public func generate() -> GuitarSettings {
        let settings = GuitarSettings()
        settings.guitarType = self.guitarType
        settings.fretboardRows = self.fretboardRows
        settings.muteArray = self.muteArray
        settings.fingerSlider = self.fingerSlider
        return settings
    }
}

struct ColumnResultItem {
    var letter: String = ""
    var number: String = ""
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
                lastSettings.fretboardRows = (self.settingsModel?.fretboardRows)!
                lastSettings.muteArray = (self.settingsModel?.muteArray)!
                lastSettings.fingerSlider = (self.settingsModel?.fingerSlider)!
            }
        } else {
            // No exist, create it.
            try! realm.write {
                realm.create(GuitarSettings.self, value:
                    [
                        "fretboardRows": (self.settingsModel?.fretboardRows)!,
                        "muteArray": (self.settingsModel?.muteArray)!,
                        "fingerSlider": (self.settingsModel?.fingerSlider)!
                    ]
                )
            }
            // Then, read it again.
            self.readSettings()
        }
    }
}
