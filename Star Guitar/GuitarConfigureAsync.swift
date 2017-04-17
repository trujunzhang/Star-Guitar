//
//  GuitarConfigureAsync.swift
//  Star Guitar
//
//  Created by djzhang on 4/18/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit
import SwiftyUserDefaults

class GuitarConfigureAsync{
    static let sharedInstance = GuitarConfigureAsync()
    
    // ======================
    // guitarType
    // ======================
    
    private let keyGuitarType = "guitarType"
    
    private func getGuitarType() -> Int{
        if let _type = Defaults[keyGuitarType].int{
            return _type
        }
        
        return GuitarType.Electric.rawValue
    }
    
    public func getGuitarTypeRowType(_ index: Int) -> UIImage? {
        if (self.getGuitarType() == index) {
            return Asset.selected.image
        }
        
        return nil
    }
    
    public func setGuitarType(_ title: String) {
        let guitarType = GuitarType.getGuitarType(title)
        Defaults[keyGuitarType] = guitarType
    }
    
    
    // ======================
    // fretboardType
    // ======================
    private let keyFretboardType = "fretboardType"
    
    private func getFretboardType() -> String{
        if let _type = Defaults[keyFretboardType].string{
            return _type
        }
        
        return "0,1,1"
    }
    
    /**
     *
     *        fretboardRows.components(separatedBy: ",").flatMap({ Int($0) }) // [Int]
     */
    public func parseFretBoardRows() -> [String] {
        return (self.getFretboardType().components(separatedBy: ","))
    }
    
    
    private func getNewFretboardType(_ title: String) -> String{
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
        
        let newFretBoard = arrToSave.map {String(describing: $0)}.joined(separator: ",")
        
        return newFretBoard
    }
    
    public func setFretboardType(_ title: String) {
        Defaults[keyFretboardType] = self.getNewFretboardType(title)
    }
    
    
    // ======================
    // fingerSlide
    // ======================
    private let keyFingerSlide = "fingerSlide"
    public func getFingerSlide() -> Bool{
        if let _type = Defaults[keyFingerSlide].bool{
            return _type
        }
        
        return true
    }
    
    public func setFingerSlide(_ newValue: Bool) {
        Defaults[keyFingerSlide] = newValue
    }
    
    // ======================
    // muteArray
    // ======================
    private let keyMuteArray = "muteArray"
    private func getMuteArray() -> String{
        if let _type = Defaults[keyMuteArray].string{
            return _type
        }
        
        return "0,0,1,1,0,0"
    }

    public func parseMuteArray() -> [String] {
        return (self.getMuteArray().components(separatedBy: ","))
    }
    
    private func getNewMuteArray(_ index: Int) -> String{
        var arrToSave = self.parseMuteArray()
        var newValue = "1"
        if (arrToSave[index] == "1") {
            newValue = "0"
        }
        arrToSave[index] = newValue
        let newMuteArray = arrToSave.map {String(describing: $0)}.joined(separator: ",")
        
        return newMuteArray
    }
    
    public func setMuteArray(_ index: Int) {
        Defaults[keyMuteArray] = self.getNewMuteArray(index)
    }
    
    
}
