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
        
        let rows = [
            TuningsFretboardActionRow(title: "1", action: toggleNote),
            TuningsFretboardActionRow(title: "2", action: toggleNote),
            TuningsFretboardActionRow(title: "3", action: toggleNote),
            TuningsFretboardActionRow(title: "4", action: toggleNote),
            TuningsFretboardActionRow(title: "5", action: toggleNote),
            TuningsFretboardActionRow(title: "6", action: toggleNote),
            ]
        
        var rowsWithBoarder = [Row]()
        if(verticalBoarderType == FretboardBorderType.left){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(title: "y", action: toggleNote))
        }
        for row in rows{
            rowsWithBoarder.append(row)
        }
        if(verticalBoarderType == FretboardBorderType.right){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(title: "y", action: toggleNote))
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
    }
    
    private func generateHorizonBoarderRow() -> Section {
        let verticalBoarderType:FretboardBorderType =  fretboardViewBoarderTypeHelper.verticalBoarderType
        
        let rows = [
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            HorizonTuningsFretboardActionRow(title: "x", action: toggleNote),
            ]
        
        var rowsWithBoarder = [Row]()
        if(verticalBoarderType == FretboardBorderType.left){
            rowsWithBoarder.append(TuningsFretboardActionRow(title: "-", action: toggleNote))
        }
        for row in rows{
            rowsWithBoarder.append(row)
        }
        if(verticalBoarderType == FretboardBorderType.right){
            rowsWithBoarder.append(TuningsFretboardActionRow(title: "-", action: toggleNote))
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
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
    
    
    
    
    private func toggleNote(_ sender: Row) {
        delegate?.toggleCell(sender as! TuningsFretboardActionRow)
    }
}
