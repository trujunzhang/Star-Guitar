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
    
    var indexPath: IndexPath?
    
    init(indexPath: IndexPath){
        self.indexPath = indexPath
        
        self.canClick = true
    }
    
    init(indexPath: IndexPath,letterIndex:Int,numberIndex :Int,oneColumnLetterItem: OneColumnLetterItem,number: String) {
        self.indexPath = indexPath
        
        self.letterIndex = letterIndex
        self.numberIndex = numberIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
        self.number = number
    }
    
    func copy(_ newItem:StandardResultItem) {
        self.indexPath = newItem.indexPath
        
        self.letterIndex = newItem.letterIndex
        self.numberIndex = newItem.numberIndex
        
        self.letter = newItem.letter
        self.haveSharp = newItem.haveSharp
        self.number = newItem.number
        
        self.canClick = newItem.canClick
    }
    
    func isOpenC() -> Bool {
        return (letterIndex == 7) && (numberIndex == 0)
    }
    
    func updateLetter(letterIndex:Int,oneColumnLetterItem: OneColumnLetterItem) {
        self.letterIndex = letterIndex
        
        self.letter = oneColumnLetterItem.letter
        self.haveSharp = oneColumnLetterItem.haveSharp
    }
    
    func updateNumber(_ numberIndex: Int,_ number:String) {
        self.numberIndex = numberIndex
        
        self.number = number
    }
  
}


