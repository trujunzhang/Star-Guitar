//
//  GuitarSettings.swift
//  Star Guitar
//
//  Created by djzhang on 3/24/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

public enum TableRowType: Int {
    case Selected = 0
    case RightArrow = 1
    case Empty = 2

    func getImage() -> UIImage? {
        switch self {
        case .Selected:
            return Asset.selected.image
        case .RightArrow:
            return Asset.rightArrow.image
        case .Empty:
            return nil
        }
    }
}


enum GuitarType: Int {
    case Acoustic = 0
    case Electric = 1
    case Bass = 2
    case Classical = 3
    case Ukulele = 4

    public static func getGuitarTypeTitles() -> [String] {
        return ["Acoustic", "Electric", "Bass(6 strng)", "Spanish", "Harp(6 string)"]
    }

    public static func getGuitarType(_ title: String) -> Int {
        return GuitarType.getGuitarTypeTitles().index(of: title)!
    }

}


enum FretboardType: Int {
    case LeftHanded = 0
    case RightHanded = 1
    case UpsideDown = 2

    public static func getFretboardTitles() -> [String] {
        return ["Left Handed", "Right Handed", "Upside Down"]
    }

    public static func getFretboardType(_ title: String) -> Int {
        return FretboardType.getFretboardTitles().index(of: title)!
    }

}


class GuitarSettings: Object {

    dynamic var id = 0

    override static func primaryKey() -> String? {
        return "id"
    }

    dynamic var guitarType = GuitarType.Electric.rawValue
    
    dynamic var fretboardRows: String = "0,1,1"

    dynamic var muteArray: String = "0,0,1,1,0,0"

    dynamic var fingerSlider: Bool = true
}

class GuilarSettingsModel {
    var guitarType = GuitarType.Electric.rawValue
    var fretboardRows: String = "0,1,1"
    var muteArray: String = "0,0,1,1,0,0"
    var fingerSlider: Bool = true

    init() {
        // Empty here.
    }

    init(_ guitarType: Int, _ fretboardRows: String, _ muteArray: String, _ fingerSlider: Bool) {
        self.guitarType = guitarType
        self.fretboardRows = fretboardRows
        self.muteArray = muteArray
        self.fingerSlider = fingerSlider
    }

    public static func convert(_ settings: GuitarSettings) -> GuilarSettingsModel {
        return GuilarSettingsModel(settings.guitarType, settings.fretboardRows, settings.muteArray, settings.fingerSlider)
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

class GuitarSettingsUtils: AnyObject {
    static let sharedInstance = GuitarSettingsUtils()

    private var settings: GuitarSettings?
    private var settingsModel: GuilarSettingsModel?

    init() {
        self.readSettings()
    }
    
    public func isLeftHanded() -> Bool {
        return self.parseFretBoardRows()[0] == "1"
    }


    public func getGuitarTypeRowType(_ index: Int) -> TableRowType {
        if (settingsModel?.guitarType == index) {
            return TableRowType.Selected
        }

        return TableRowType.Empty
    }

    private func parseFretBoardRows() -> [String] {
        //settingsModel.fretboardRows.components(separatedBy: ",").flatMap({ Int($0) }) // [Int]
        return (settingsModel?.fretboardRows.components(separatedBy: ","))!
    }

    public func getFretboardTypeRowType(_ index: Int) -> TableRowType {
        if (self.parseFretBoardRows()[index] == "1") {
            return TableRowType.Selected
        }

        return TableRowType.Empty
    }

    public func setGuitarType(_ title: String) {
        settingsModel?.guitarType = GuitarType.getGuitarType(title)
    }

    public func setFretboardType(_ title: String) {
        var arrToSave = self.parseFretBoardRows()

        let fretboardType = FretboardType.getFretboardType(title)
        switch fretboardType {
        case FretboardType.LeftHanded.rawValue:
            arrToSave = ["1", "0", arrToSave[2]]
            break
        case FretboardType.RightHanded.rawValue:
            arrToSave = ["0", "1", arrToSave[2]]
            break
        case FretboardType.UpsideDown.rawValue:
            var newValue = "1"
            if (arrToSave[fretboardType] == "1") {
                newValue = "0"
            }
            arrToSave[fretboardType] = newValue
            break
        default: break
        }

        let newFretBoard = arrToSave.map {
            String(describing: $0)
        }.joined(separator: ",")
        self.settingsModel?.fretboardRows = newFretBoard
    }

    public func getMuteArray() -> [String] {
        return (settingsModel?.muteArray.components(separatedBy: ","))!
    }

    public func setMuteArray(_ index: Int) {
        var arrToSave = self.getMuteArray()
        var newValue = "1"
        if (arrToSave[index] == "1") {
            newValue = "0"
        }
        arrToSave[index] = newValue
        let newFretBoard = arrToSave.map {
            String(describing: $0)
        }.joined(separator: ",")
        self.settingsModel?.muteArray = newFretBoard

    }

    public func getFingerSlider() -> Bool {
        return (settingsModel?.fingerSlider)!
    }

    public func setFingerSlider(_ newValue: Bool) {
        settingsModel?.fingerSlider = newValue
    }

    public func readSettings() {
        if let existSetting = self.readGuitarSettings() {
            self.settings = existSetting
            self.settingsModel = GuilarSettingsModel.convert(existSetting)
        } else {
            self.settingsModel = GuilarSettingsModel()
        }
    }

    private func readGuitarSettings() -> GuitarSettings? {
        let realm = try! Realm()

        let items = realm.objects(GuitarSettings.self)
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
                lastSettings.guitarType = (self.settingsModel?.guitarType)!
                lastSettings.fretboardRows = (self.settingsModel?.fretboardRows)!
                lastSettings.muteArray = (self.settingsModel?.muteArray)!
                lastSettings.fingerSlider = (self.settingsModel?.fingerSlider)!
            }
        } else {
            // No exist, create it.
            try! realm.write {
                realm.create(GuitarSettings.self, value:
                [
                        "guitarType": (self.settingsModel?.guitarType)!,
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
