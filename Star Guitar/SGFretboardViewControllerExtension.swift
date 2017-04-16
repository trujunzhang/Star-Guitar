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
            TuningsFretboardActionRow(title: "", action: toggleNote),
            TuningsFretboardActionRow(title: "", action: toggleNote),
            TuningsFretboardActionRow(title: "", action: toggleNote),
            TuningsFretboardActionRow(title: "", action: toggleNote),
            TuningsFretboardActionRow(title: "", action: toggleNote),
            TuningsFretboardActionRow(title: "", action: toggleNote),
            ]
        
        let item = FretboardBorderGreenItem(isLeft:isLeft,position)
        var rowsWithBoarder = [Row]()
        if(isLeft){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(item: item, action: verticalActionNote))
        }
        for row in rows{
            rowsWithBoarder.append(row)
        }
        if(!isLeft){
            rowsWithBoarder.append(VerticalTuningsFretboardActionRow(item: item, action: verticalActionNote))
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
    }
    
    private func generateTopBottomRow() -> Section {

        let isTop =  fretboardViewBoarderTypeHelper.isTop()
        let isLeft =  fretboardViewBoarderTypeHelper.isLeft()
        var rowsWithBoarder = [Row]()
        if(isLeft){
            rowsWithBoarder.append(TuningsFretboardEmptyRow())
        }
        let offIndex = (fretboardViewBoarderTypeHelper.isLeft() ? 1 : 0)
        for index in 0...5{
            rowsWithBoarder.append(HorizonTuningsFretboardActionRow(item: FretboardBorderGreenItem(isTop:isTop,index + offIndex), action: horizonActionNote))
        }
        if(!isLeft){
            rowsWithBoarder.append(TuningsFretboardEmptyRow())
        }
        
        return Section(title: nil, rows: rowsWithBoarder)
    }
    
    private func generateSections(_ offIndex: Int) -> [Section]{
        // 6X13
        var sections = [Section]()
        for index in 0...13{
            sections.append(self.generateRows(index + offIndex))
        }
        return sections
    }
    
    func generateFretboardSections() -> [Section]{
        let isTop =  fretboardViewBoarderTypeHelper.isTop()
        
        var sectionsWithBoarder = [Section]()
        var offIndex = 0
        if(isTop){
            offIndex = 1
            sectionsWithBoarder.append(self.generateTopBottomRow())
        }
        for section in self.generateSections(offIndex){
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
    
    private func horizonActionNote(_ sender: Row) {
        let item: FretboardBorderGreenItem = (sender as! HorizonTuningsFretboardActionRow).item!
        delegate?.toggleHorizonCell(item)
    }
    
    private func verticalActionNote(_ sender: Row) {
        let item: FretboardBorderGreenItem = (sender as! VerticalTuningsFretboardActionRow).item!
         delegate?.toggleVerticalCell(item)
    }
}
