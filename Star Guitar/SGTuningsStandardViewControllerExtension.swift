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
        
    }
    
}

extension SGTuningsStandardViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        tuningsStandardSettingsUtils.updateOneColumnLetter(row.getRowData())
    }
    
}


extension SGTuningsStandardViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        tuningsStandardSettingsUtils.updateTwoColumnNumber(row.getRowData())
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
