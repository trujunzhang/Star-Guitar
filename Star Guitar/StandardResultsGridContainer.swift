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
        weak var delegate : StandardResultsGridProviderProtocol?
        
        
        var tuningsStandardSettingsUtils = TuningsStandardSettingsUtils()
        
        private var selectedRow:StandardResultsSharpActionRow?
        private var tableContents = [Section]()
        
        private var cells = [[UIView]]()
        
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
                tableContents.append(Section(title: nil, rows: rows))
            }
            
        }
        
        public func reloadData(){
            self.cells = [[UIView]]()
            var step = 0
            
            for section in self.tableContents{
                var sectionCells = [UIView]()
                for row in section.rows{
                    let cell = StandardResultsSharpActionCell()
                    self.addSubview(cell)
                    self.layoutCell(cell, row)
                    
                    cell.tag = step
                    
                    step += 1
                    
                    cell.setUpAppearance()
                    row.render(viewCell: cell)
                    
                    let gesture = UITapGestureRecognizer(target: self, action: #selector(StandardResultsGridContainer.handleTap))
                    gesture.numberOfTapsRequired = 1
                    cell.isUserInteractionEnabled = true
                    cell.addGestureRecognizer(gesture)
                    
                    sectionCells.append(cell)
                }
                
                self.cells.append(sectionCells)
            }
        }
        
        // ====================================
        // Tap Event
        // ====================================
        func handleTap(sender: UITapGestureRecognizer) {
            if let view = sender.view{
                let step = view.tag
                let section = step / 6
                let row = step % 6
                
                //print("section: \(section), row: \(row)")
                
                //
                //  1. In the standard tuning. I need the three middle turnings (drop d, dadgad, open c) to be highlighted when they are touched
                //
                if(section == 2 && TuningsStandardType.canMiddleHighLight(self.tuningsStandardSettingsUtils.currentStandardTuningsType)){
                    // Can not be selected and highlight.
                }else{
                    self.invokeEvent(section, row)
                }
            }
        }
        
        private func invokeEvent(_ section:Int,_ row:Int){
            if let lastRow = self.selectedRow{
                if let item = lastRow.item{
                    if let indexPath = item.indexPath{
                        lastRow.setSelectedRowAt(self.cells[indexPath.section][indexPath.row],didSelect: false)
                    }
                }
            }
            
            if let currentRow = self.tableContents[section].rows[row] as? StandardResultsSharpActionRow{
                currentRow.setSelectedRowAt(self.cells[section][row],didSelect: true)
                
                self.selectedRow = currentRow
                
                if let item = currentRow.item{
                    delegate?.toggleCell(item)
                }
            }
        }
        
        private func layoutCell(_ cell: StandardResultsSharpActionCell,_ row: Row){
            
            if let _row = row as? StandardResultsSharpActionRow{
                if let item = _row.item{
                    if let indexPath = item.indexPath{
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
            return StandardResultsSharpActionRow(item: item, action: nil)
        }
        
        public func updateCell(item:StandardResultItem){
            if let indexPath = item.indexPath{
                if var actionRow = tableContents[indexPath.section].rows[indexPath.row] as? StandardResultsSharpActionRow{
                    
                    actionRow.setItem(item)

                    self.reloadItem(at: indexPath)
                }
            }
        }
        
        private func reloadItem(at indexPath:IndexPath){
             if let updatedRow = self.tableContents[indexPath.section].rows[indexPath.row] as? StandardResultsSharpActionRow{
                let updatedCell = self.cells[indexPath.section][indexPath.row]
                updatedRow.render(viewCell: updatedCell)
            }
        }
        
        
    }
