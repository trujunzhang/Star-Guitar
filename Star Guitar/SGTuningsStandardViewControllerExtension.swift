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
    
    /**
     * (2017-04-19)
     * 2. with the standard tuning, the 3 middle turnings to not highlight the name when it is chosen
     *
     */
    func toggleCell(_ item: ColumnResultItem){
        let letterIndex = item.letterIndex
        let numberIndex = item.numberIndex
        
        let canClick = item.canClick
        
        oneColumnViewController.setupRows(enabledClick: canClick)
        twoColumnViewController.setupRows(enabledClick: canClick)
        
        oneColumnViewController.updateCell(rowIndex: letterIndex)
        twoColumnViewController.updateCell(rowIndex: numberIndex)
        
        tuningsTypeViewController.toggleCurrentTuningsType(item)
        
        tuningsStandardSettingsUtils.toggleCurrentColumnResultItem(item)
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
        // Step1: Toggle the current Standard Tunings Type
        tuningsStandardSettingsUtils.setCurrentStandardTuningsType(sender.title)
        //let type = tuningsStandardSettingsUtils.currentStandardTuningsType
        
        // Step2: Reload the Standard Results Grid.
        standardResultsViewController.generateResultsRows(tuningsStandardSettingsUtils)
    }
    
}

extension SGTuningsStandardViewController: TuningsEventProviderProtocol{
    
    func onTuningEventTapped(_ sender: Row) {
        
    }
    
}
