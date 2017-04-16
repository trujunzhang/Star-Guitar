//
//  SGFretboardViewControllerExtension.swift
//  Star Guitar
//
//  Created by djzhang on 4/16/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation


extension SGFretboardViewController{
    
    
    private func generateRows(_ position:Int) -> Section {
        let isLeft =  fretboardViewBoarderTypeHelper.isLeft()
        
        let rows = [
            TuningsFretboardActionRow(title: "1", action: toggleNote),
            TuningsFretboardActionRow(title: "2", action: toggleNote),
            TuningsFretboardActionRow(title: "3", action: toggleNote),
            TuningsFretboardActionRow(title: "4", action: toggleNote),
            TuningsFretboardActionRow(title: "5", action: toggleNote),
            TuningsFretboardActionRow(title: "6", action: toggleNote),
            ]
        
        let item = FretboardBorderGreenItem(isLeft:isLeft,position)
        var rowsWithBoarder = [Row]()
        if(isLeft){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(item: item, action: toggleNote))
        }
        for row in rows{
            rowsWithBoarder.append(row)
        }
        if(!isLeft){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(item: item, action: toggleNote))
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
    }
    
    private func generateTopBottomRow() -> Section {

        let isTop =  fretboardViewBoarderTypeHelper.isTop()
        
        let rows = [
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,0), action: toggleNote),
            ]
        
        let isLeft =  fretboardViewBoarderTypeHelper.isLeft()
        var rowsWithBoarder = [Row]()
        if(isLeft){
            rowsWithBoarder.append(TuningsFretboardEmptyRow())
        }
        for row in rows{
            rowsWithBoarder.append(row)
        }
        if(!isLeft){
            rowsWithBoarder.append(TuningsFretboardEmptyRow())
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
    }
    
    private func generateSections() -> [Section]{
        // 6X13
        var sections = [Section]()
        for index in 0...13{
            sections.append(self.generateRows(index))
        }
        return sections
    }
    
    func generateFretboardSections() -> [Section]{
        let isTop =  fretboardViewBoarderTypeHelper.isTop()
        
        var sectionsWithBoarder = [Section]()
        
        if(isTop){
            sectionsWithBoarder.append(self.generateTopBottomRow())
        }
        for section in self.generateSections(){
            sectionsWithBoarder.append(section)
        }
        if(!isTop){
            sectionsWithBoarder.append(self.generateTopBottomRow())
        }
        return sectionsWithBoarder
    }
    
    private func toggleNote(_ sender: Row) {
        delegate?.toggleCell(sender as! TuningsFretboardActionRow)
    }
}
