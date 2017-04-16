//
//  SGFretboardViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/16/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation


extension SGFretboardViewController{
    
    
    private func generateRows() -> Section {
        let verticalBoarderType:FretboardBorderType =  fretboardViewBoarderTypeHelper.verticalBoarderType
        
        return Section(title: nil, rows: [
            TuningsFretboardActionRow(title: "1", action: toggleNote),
            TuningsFretboardActionRow(title: "2", action: toggleNote),
            TuningsFretboardActionRow(title: "3", action: toggleNote),
            TuningsFretboardActionRow(title: "4", action: toggleNote),
            TuningsFretboardActionRow(title: "5", action: toggleNote),
            TuningsFretboardActionRow(title: "6", action: toggleNote),
            ])
    }
    
    private func generateSections() -> [Section]{
        // 6X5
        let sections = [
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows()
        ]
        return sections
    }
    
    func generateFretboardSections() -> [Section]{
        let horizonBoarderType:FretboardBorderType =  fretboardViewBoarderTypeHelper.horizonBoarderType
        
        var sectionsWithBoarder = [Section]()
        
        if(horizonBoarderType == FretboardBorderType.top){
            sectionsWithBoarder.append(self.generateHorizonBoarderRow())
        }
        for section in self.generateSections(){
            sectionsWithBoarder.append(section)
        }
        if(horizonBoarderType == FretboardBorderType.bottom){
            sectionsWithBoarder.append(self.generateHorizonBoarderRow())
        }
        return sectionsWithBoarder
    }
    
    private func generateHorizonBoarderRow() -> Section {
        return Section(title: nil, rows: [
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            TuningsFretboardActionRow(title: "x", action: toggleNote),
            ])
    }
    
    
    private func toggleNote(_ sender: Row) {
        delegate?.toggleCell(sender as! TuningsFretboardActionRow)
    }
}
