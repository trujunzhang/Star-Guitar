//
//  SGStardardResultsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGStandardResultsViewController: QuickCollectionViewController {
    
    private var selectedRow: Row?
    
    public override func setDefaultSelectedCells(_ collectionView: UICollectionView){
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }

    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)

        layout.itemSize = CGSize(width: StandResultsColumnSchema.resultsItemWidth(), height: StandResultsColumnSchema.resultsItemHeight()) // cell的寬、高

        collectionView.register(StandardResultsActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsActionCell.self))
        collectionView.register(StandardResultsSharpActionCell.self, forCellWithReuseIdentifier: String(describing: StandardResultsSharpActionCell.self))
    }
    
    // 6X5
    func generateResultsRows(_ tuningsStandardSettingsUtils:TuningsStandardSettingsUtils) {
        var sections = [Section]()
        
        let resultCells = tuningsStandardSettingsUtils.getResultCells()
        for resultRow in resultCells{
            var rows: [Row] = [Row]()
            for item in resultRow{
                if(item.haveSharp){
                    rows.append(StandardResultsSharpActionRow(letter: "D",number:"2", action: toggleNote))
                }else{
                    rows.append(StandardResultsActionRow(letter: "D",number:"2", action: toggleNote))
                }
            }
            let section = Section(title: nil, rows: rows)
            sections.append(section)
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

    private func toggleNote(_ sender: Row) {
        //sender.title = "12"
    }
    
    public func updateCell(letter:String,number:String){
        if let selectedItems = self.collectionView?.indexPathsForSelectedItems{
            if selectedItems.count == 1{
                let indexPath = selectedItems[0]
                let section = indexPath.section
                let rowIndex = indexPath.row
                tableContents[section].rows[rowIndex] = StandardResultsActionRow(letter: letter,number:number, action: toggleNote)
                self.collectionView?.reloadItems(at: selectedItems)
                self.collectionView?.selectItem(at: indexPath, animated: true, scrollPosition: .top)
            }
        }
        
        
    }


}
