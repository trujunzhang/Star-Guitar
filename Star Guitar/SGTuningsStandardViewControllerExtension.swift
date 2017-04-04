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
        
        standardResultsViewController.updateCell(letter: item.letter, number: item.number)
    }
    
}

extension SGTuningsStandardViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        tuningsStandardSettingsUtils.updateOneColumnLetter(row.getRowData())
        
        self.updateSelectedNoteCell()
    }
    
}


extension SGTuningsStandardViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        tuningsStandardSettingsUtils.updateTwoColumnNumber(row.getRowData())
        
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
