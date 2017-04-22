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
        let item = tuningsStandardSettingsUtils.getCurrentStandardResultItem()
        
        //standardResultsViewController.updateCell(item: item)
    }
    
}

extension SGTuningsStandardViewController{
    
    /**
     * (2017-04-19)
     * 2. with the standard tuning, the 3 middle turnings to not highlight the name when it is chosen
     *
     */
    func toggleCell(_ item: StandardResultItem){
        let letterIndex = item.letterIndex
        let numberIndex = item.numberIndex
        
        let canClick = item.canClick
        
        // Step1: Toggle oneColumnLetter and twoColumnNumber's click.
        oneColumnViewController.setupRows(enabledClick: canClick)
        twoColumnViewController.setupRows(enabledClick: canClick)
        
        // Step2: Update oneColumnLetter and twoColumnNumber's selected cell.
        oneColumnViewController.updateCell(rowIndex: letterIndex)
        twoColumnViewController.updateCell(rowIndex: numberIndex)
        
        // Step3: Save the selected Result item.
        tuningsStandardSettingsUtils.setCurrentStandardResultItem(item)
        
        
        if let selectedItems = tuningsTypeViewController.getSelectedItems(){
            if let tuningsStandardType:TuningsStandardType = TuningsStandardType.needSelectCellType(item,selectedItems){
                
                // Step4: Save tunings tpye.
                tuningsStandardSettingsUtils.setCurrentStandardTuningsType(tuningsStandardType)
                
                
                // Step5: Check and update the Standard tunings type's selected cell.
                tuningsTypeViewController.toggleCurrentTuningsType(tuningsStandardType)
                
                
                // Step6: Check and update the result's middle section's highlighter.
                //standardResultsViewController.updateMiddleSectionHighLighter(tuningsStandardSettingsUtils)
            }
        }
    }
}


extension SGTuningsStandardViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        if let row = sender as? OneColumnActionRow{
            if let oneColumnLetterItem = row.item{
                
                // Save new Letter Index and check whether need to update the Result Grid.
                let needUpdate = tuningsStandardSettingsUtils.updateOneColumnLetter(oneColumnLetterItem.type.rawValue)

                if(needUpdate){
                    self.updateSelectedNoteCell()
                }
            }
        }
    }
    
}


extension SGTuningsStandardViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! TwoColumnActionRow
        
        let needUpdate = tuningsStandardSettingsUtils.updateTwoColumnNumber(row.title)
        
        if(needUpdate){
            self.updateSelectedNoteCell()
        }
    }
    
}

extension SGTuningsStandardViewController: TuningsTypeProviderProtocol{
    
    func toggleTuningType(_ sender: Row) {
        // Step1: Toggle the current Standard Tunings Type
        tuningsStandardSettingsUtils.setCurrentStandardTuningsType(sender.title)
        
        //let type = tuningsStandardSettingsUtils.currentStandardTuningsType
        
        // Step2: Reload the Standard Results Grid.
        //standardResultsViewController.generateResultsRows(tuningsStandardSettingsUtils)
    }
    
}

extension SGTuningsStandardViewController: TuningsEventProviderProtocol{
    
    func onTuningEventTapped(_ sender: Row) {
        
    }
    
}
