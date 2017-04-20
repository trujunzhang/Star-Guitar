//
//  SGStandardTuningsResultItem.swift
//  Star Guitar
//
//  Created by djzhang on 4/21/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

public class StandardResultItem {
    var letter: String = ""
    var haveSharp: Bool = false
    var number: String = ""
    
    var letterIndex = -1
    var numberIndex = -1
    
    var canClick = false
    var canHighlight = true
    
    
    init(){
        self.canClick = true
        self.canHighlight = true
    }
    
    init(letterIndex:Int,numberIndex :Int,oneColumnLetterItem: OneColumnLetterItem,number: String,canHighlight:Bool) {
        self.letterIndex = letterIndex
        self.numberIndex = numberIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
        self.number = number
        
        self.canHighlight = canHighlight
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


