//
//  SGTuningsBaseSettings.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

public struct FretboardBorderGreenItem {
    var isLeft: Bool = false
    var isTop: Bool = false
    var position:Int = 0
    
    init(isLeft: Bool,_ position:Int) {
        self.isLeft = isLeft
        self.position = position
    }
    
    init(isTop: Bool,_ position:Int) {
        self.isTop = isTop
        self.position = position
    }
}


public enum FretboardBorderType: Int {
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}

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

enum TuningsStandardType: Int {
    case Stardand = 0
    case DropD = 1
    case Dadgad = 2
    case OpenC = 3
    case Custom = 4
    
    public static func getTitles() -> [String] {
        // "Stardand","Drop D","Dadgad","Open C","Custom"
        return GuitarPlist.guitarPlistDict.TuningsStandardType
    }
    
    public static func getTypeIndex(_ title: String) -> Int {
        return TuningsStandardType.getTitles().index(of: title)!
    }
    
    public static func getTypeIndex(_ item: ColumnResultItem) -> Int{
        if(item.letterIndex == -1 && item.numberIndex == -1){
            return TuningsStandardType.Custom.rawValue
        }else if(item.letterIndex == 7 && item.numberIndex == 0){
            return TuningsStandardType.OpenC.rawValue
        }
        
        return TuningsStandardType.Stardand.rawValue
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


enum TwoColumnNumberType: Int {
    case N2 = 0
    case N3 = 1
    case N4 = 2
    case N5 = 3
    case N6 = 4
    
    public static func getTitles() -> [String] {
        // "2","3","4","5","6"
        return GuitarPlist.guitarPlistDict.TwoColumnNumber
    }
    
    public static func getTypeIndex(_ title: String) -> Int {
        return TwoColumnNumberType.getTitles().index(of: title)!
    }
    
}


public class ColumnResultItem {
    var letter: String = ""
    var haveSharp: Bool = false
    var number: String = ""
    
    var letterIndex = -1
    var numberIndex = -1
    
    var canClick = false
    var canHighlight = true
    
    
    init(){
        self.canClick = true
    }
    
    init(letterIndex:Int,numberIndex :Int,oneColumnLetterItem: OneColumnLetterItem,number: String) {
        self.letterIndex = letterIndex
        self.numberIndex = numberIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
        self.number = number
    }
    
    func isOpenC() -> Bool {
        return (letterIndex == 7) && (numberIndex == 0)
    }
    
    func updateLetter(letterIndex:Int,oneColumnLetterItem: OneColumnLetterItem) {
        self.letterIndex = letterIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
    }
    
    func updateNumber(number:String) {
        self.number = number
        self.numberIndex = TwoColumnNumberType.getTypeIndex(number)
    }
}

class TuningsBaseSettingsUtils: AnyObject {
    var currentColumnResultItem = ColumnResultItem()
    
    init() {
    }
    
    public func updateOneColumnLetter(_ letterIndex:Int){
        let oneColumns:[OneColumnLetterItem] = OneColumnLetterType.getOneColumnLetterItems()
        let oneColumnLetterItem = oneColumns[letterIndex]
        
        currentColumnResultItem.updateLetter ( letterIndex: letterIndex, oneColumnLetterItem: oneColumnLetterItem)
    }
    
    public func updateTwoColumnNumber(_ number:String){
        currentColumnResultItem.updateNumber(number: number)
    }
}


