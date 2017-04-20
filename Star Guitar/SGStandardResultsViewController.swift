//
//  SGStardardResultsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol StandardResultsProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleCell(_ columnResultItem: StandardResultItem)
}

class SGStandardResultsViewController: QuickCollectionViewController {
    weak var delegate : StandardResultsProviderProtocol?
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        layout.itemSize = CGSize(width: StandResultsColumnSchema.itemWidth(), height: StandResultsColumnSchema.itemHeight()) // cell的寬、高
        
        collectionView.register(StandardResultsActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsActionCell.self))
        collectionView.register(StandardResultsSharpActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsSharpActionCell.self))
        
        
        collectionView.register(StandardResultsNoHighActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsNoHighActionCell.self))
        collectionView.register(StandardResultsNoHighSharpActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsNoHighSharpActionCell.self))
        
    }
    
    // 6X5
    func generateResultsRows(_ tuningsStandardSettingsUtils:TuningsStandardSettingsUtils) {
        var sections = [Section]()
        
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
        
        tableContents = sections
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func updateCell(item:StandardResultItem){
        if let selectedItems = self.collectionView?.indexPathsForSelectedItems{
            if selectedItems.count == 1{
                let indexPath = selectedItems[0]
                let section = indexPath.section
                let rowIndex = indexPath.row
                tableContents[section].rows[rowIndex] = self.getStandardResultsActionRow(item)
                self.collectionView?.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            }
        }
    }
    
    public func updateMiddleSectionHighLighter(_ tuningsStandardSettingsUtils:TuningsStandardSettingsUtils){
        let currentStandardTuningsType:Int = tuningsStandardSettingsUtils.currentStandardTuningsType
        
        let canMiddleHighLight = TuningsStandardType.canMiddleHighLight(currentStandardTuningsType)
        
        var newRow = [Row]()
        for row in tableContents[2].rows{
            if let currentRow = row as? StandardResultsBasicActionRow{
                if let item = currentRow.item{
                    item.canHighlight = canMiddleHighLight
                    newRow.append(self.getStandardResultsActionRow(item))
                }
            }
        }

        tableContents[2].rows = newRow
        
        // http://stackoverflow.com/questions/14212744/uicollectionview-select-an-item-immediately-after-reloaddata

        if let _collectionView = self.collectionView {
            if let selectedItems = self.getSelectedItems(){
                
                _collectionView.performBatchUpdates({ 
                    _collectionView.reloadSections(IndexSet(integer: 2))
                }, completion: { (completed) in
                    for indexPath in selectedItems{
                        _collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
                    }
                })

            }
        }

    }
    
    
}
