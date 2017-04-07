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



extension SGTuningsCustomViewController: OneColumnProviderProtocol{
    
    func toggleOneColumnLetter(_ sender: Row) {
        let row = sender as! OneColumnActionRow
        
        let letterIndex = (row.item?.type.rawValue)!
        //tuningsCustomSettingsUtils.updateOneColumnLetter(letterIndex)
        
        //self.updateSelectedNoteCell()
    }
    
}


extension SGTuningsCustomViewController: TwoColumnProviderProtocol{
    
    func toggleTwoColumnNumber(_ sender: Row) {
        let row = sender as! TwoColumnActionRow
        
        //tuningsCustomSettingsUtils.updateTwoColumnNumber(row.title)
        
        //self.updateSelectedNoteCell()
    }
    
}
