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
        
        collectionView.register(StandardResultsSharpActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsSharpActionCell.self))
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
        
        self.deselectAllCells()
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
        if let indexPath = item.indexPath{
            if var actionRow = tableContents[indexPath.section].rows[indexPath.row] as? StandardResultsSharpActionRow{
                
                actionRow.setItem(item)
                
                if let _collectionView = self.collectionView{
                    
                    let indexPaths = self.getSelectedItems()
                    let selectedCount = indexPaths?.count
                    
                    _collectionView.performBatchUpdates({
                            _collectionView.reloadItems(at: [indexPath])
                        //_collectionView.reloadData()
                    }, completion: { (success) in
                        if let _indexPath = item.indexPath{
                            //_collectionView.selectItem(at: _indexPath, animated: false, scrollPosition: .top)
                        }
                    })
                }
            }
        }
    }
    
    public func updateMiddleSectionHighLighter(_ tuningsStandardSettingsUtils:TuningsStandardSettingsUtils){
        //let currentStandardTuningsType:Int = tuningsStandardSettingsUtils.currentStandardTuningsType
        
    }
    
    
}
