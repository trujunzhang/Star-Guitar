//
//  StandardResultsGridContainer.swift
//  Star Guitar
//
//  Created by djzhang on 4/22/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

protocol StandardResultsGridProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleCell(_ columnResultItem: StandardResultItem)
}

class StandardResultsGridContainer: UIView{
    
    private var selectedRow:StandardResultsSharpActionRow?
    private var sections = [Section]()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    
    // 6X5
    func generateResultsRows(_ tuningsStandardSettingsUtils:TuningsStandardSettingsUtils) {
        
        // ============================
        // Get the Current Result Cells
        // ============================
        let currentCells = tuningsStandardSettingsUtils.getCurrentResultCells()
        for cellsRow in currentCells{
            var rows: [Row] = [Row]()
            for item in cellsRow{
                rows.append(self.getStandardResultsActionRow(item))
            }
            sections.append(Section(title: nil, rows: rows))
        }
        
    }
    
    public func reloadData(){
        for section in self.sections{
                for row in section.rows{
                    let cell = StandardResultsSharpActionCell()
                    self.addSubview(cell)
                    self.layoutCell(cell, row)
                    
                    cell.setUpAppearance()
                    row.render(viewCell: cell)
                    
            }
        }
    }
    
    private func layoutCell(_ cell: StandardResultsSharpActionCell,_ row: Row){
        if let _row = row as? StandardResultsSharpActionRow{
            if let item = _row.item{
                if let indexPath = item.indexPath{
                    //StandResultsColumnSchema.itemWidth(), height: StandResultsColumnSchema.itemHeight()
                    
                    cell.snp.makeConstraints { (make) -> Void in
                        make.top.equalToSuperview().offset(indexPath.section * StandResultsColumnSchema.itemHeight())
                        make.leading.equalToSuperview().offset(indexPath.row * StandResultsColumnSchema.itemWidth())
                        make.width.equalTo(StandResultsColumnSchema.itemWidth())
                        make.height.equalTo(StandResultsColumnSchema.itemHeight())
                    }
                }
            }
        }
    }
    
    public func getStandardResultsActionRow(_ item:StandardResultItem) ->Row{
        return StandardResultsSharpActionRow(item: item, action: toggleNote)
    }
    
    public func toggleNote(_ sender: Row) {
        //if let _row = sender as? StandardResultsSharpActionRow{
        //            delegate?.toggleCell(_row.item!)
        //        }
    }
    
    
}
