//
//  SGTouchChordViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation


extension SGTouchChordViewController{
    
    
}


extension SGTouchChordViewController: FretboardProviderProtocol{
    
    func toggleCell(_ row: TuningsFretboardActionRow){
        
    }
    
    func toggleHorizonCell(_ row: FretboardBorderGreenItem){
        
    }
    
    func toggleVerticalCell(_ row: FretboardBorderGreenItem){
        
    }
    
}
extension SGTouchChordViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        
        let letterIndex = (row.item?.type.rawValue)!
        tuningsChordSettingsUtils.updateOneColumnLetter(letterIndex)
        
        //self.updateSelectedNoteCell()
    }
    
}
