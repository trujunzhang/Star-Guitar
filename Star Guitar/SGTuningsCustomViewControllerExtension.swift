//
//  SGTuningsCustomViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/7/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

extension SGTuningsCustomViewController{
    
}

extension SGTuningsCustomViewController: FretboardProviderProtocol{
    
    func toggleCell(_ row: TuningsFretboardActionRow){
        //let letterIndex = columnResultItem.letterIndex
        //let numberIndex = columnResultItem.numberIndex
        
        //oneColumnViewController.updateCell(rowIndex: letterIndex)
        //twoColumnViewController.updateCell(rowIndex: numberIndex)
    }
    
}

extension SGTuningsCustomViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        
        let letterIndex = (row.item?.type.rawValue)!
        tuningsCustomSettingsUtils.updateOneColumnLetter(letterIndex)
        
        //self.updateSelectedNoteCell()
    }
    
}


extension SGTuningsCustomViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! TwoColumnActionRow
        
        tuningsCustomSettingsUtils.updateTwoColumnNumber(row.title)
        
        //self.updateSelectedNoteCell()
    }
    
}


extension SGTuningsCustomViewController: ThreeChordColumnProviderProtocol{
    
    func toggleThreeTopColumnNumber(_ sender: Row) {
        let row = sender as! ThreeColumnActionRow
        
    }
    
    func toggleThreeBottomColumnNumber(_ sender: Row) {
        let row = sender as! ThreeColumnActionRow
        
    }
    
}


extension SGTuningsCustomViewController: FretboardBoarderViewProviderProtocol{
    func onGreenButtonTapped(_ item: FretboardBorderGreenItem){
        
    }
}


extension SGTuningsCustomViewController: TuningsEventProviderProtocol{
    
    func onTuningEventTapped(_ sender: Row) {
        
    }
    
}
