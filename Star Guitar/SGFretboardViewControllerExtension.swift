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
        let verticalBoarderType:FretboardBorderType =  FretboardBorderType.left
        
        return Section(title: nil, rows: [
            TuningsFretboardActionRow(title: "1", action: toggleNote),
            TuningsFretboardActionRow(title: "2", action: toggleNote),
            TuningsFretboardActionRow(title: "3", action: toggleNote),
            TuningsFretboardActionRow(title: "4", action: toggleNote),
            TuningsFretboardActionRow(title: "5", action: toggleNote),
            TuningsFretboardActionRow(title: "6", action: toggleNote),
            ])
    }
    
    func generateFretboardSections() -> [Section]{
        let horizonBoarderType:FretboardBorderType =  fretboardViewBoarderTypeHelper.horizonBoarderType
        
        // 6X5
        let sections = [
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows()
        ]
        
        var sectionsWithBoarder = [Section]()
        
        if(horizonBoarderType == FretboardBorderType.top){
            sectionsWithBoarder.append(self.generateHorizonBoarderRow())
        }
        for section in sections{
            sectionsWithBoarder.append(section)
        }
        if(horizonBoarderType == FretboardBorderType.bottom){
            sectionsWithBoarder.append(self.generateHorizonBoarderRow())
        }
        return sections
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
