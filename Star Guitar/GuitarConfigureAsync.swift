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



class GuitarConfigureAsync{
    static let sharedInstance = GuitarConfigureAsync()

    // ======================
    // Status
    // ======================
    public func isLeftHanded() -> Bool {
        return self.parseFretBoardRows()[0] == "1"
    }
    
    public func isUpsideDown() -> Bool {
        return self.parseFretBoardRows()[2] == "1"
    }

    
    /**
     * 1. FretboardBorderType.top
     *  this one is the default position of the app when it is in its right hand mode
     * 2. FretboardBorderType.right
     *  the left hand setting reverses the settings and makes everything go from right to left instead of left to right
     * 3. FretboardBorderType.left
     *  when the upside down setting is on the buttons go from bottom to top
     * 4. FretboardBorderType.bottom
     *  the left hand upside down setting takes the left hand setting and flips it upside down
     */
    public func getCurrentFretboardBorderType() -> FretboardBorderType{
        if self.isLeftHanded() && self.isUpsideDown() {
            return FretboardBorderType.bottom  // the left hand upside down setting
        }
        else if self.isLeftHanded(){
            return FretboardBorderType.right // the left hand setting
        }
        else if self.isUpsideDown(){
            return FretboardBorderType.left //  when the upside down setting is on
        }
        return FretboardBorderType.top // when it is in its right hand mode
    }
    
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
