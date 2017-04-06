//
//  SGTuningStandardViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/3/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation



extension SGTuningsStandardViewController{
    
    func updateSelectedNoteCell() {
        let item = tuningsStandardSettingsUtils.getCurrentColumnResultItem()
        
        standardResultsViewController.updateCell(item: item)
    }
    
}

extension SGTuningsStandardViewController: StandardResultsProviderProtocol{
    
    func toggleCell(_ columnResultItem: ColumnResultItem){
        let letterIndex = columnResultItem.letterIndex
        let numberIndex = columnResultItem.numberIndex

        oneColumnViewController.updateCell(rowIndex: letterIndex)
        twoColumnViewController.updateCell(rowIndex: numberIndex)
        
        tuningsStandardSettingsUtils.toggleCurrentColumnResultItem(columnResultItem)
    }
    
}


extension SGTuningsStandardViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        
        let letterIndex = (row.item?.type.rawValue)!
        tuningsStandardSettingsUtils.updateOneColumnLetter(letterIndex)
        
        self.updateSelectedNoteCell()
    }
    
}


extension SGTuningsStandardViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! TwoColumnActionRow
        
        tuningsStandardSettingsUtils.updateTwoColumnNumber(row.title)
        
        self.updateSelectedNoteCell()
    }
    
}

extension SGTuningsStandardViewController: TuningsTypeProviderProtocol{
    
    func toggleTuningType(_ sender: Row) {
        
    }
    
}

extension SGTuningsStandardViewController: TuningsEventProviderProtocol{
    
    func onTuningEventTapped(_ sender: Row) {
        
    }
    
}
