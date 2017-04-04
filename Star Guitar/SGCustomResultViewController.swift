//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGCustomResultViewController: QuickCollectionViewController {
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        // Debug
        //collectionView.backgroundColor = .red
        
        layout.itemSize = CGSize(width: CustomResultsColumnSchema.resultsItemWidth(), height: CustomResultsColumnSchema.resultsItemHeight()) // cell的寬、高
        
        collectionView.register(TuningsCustomResultsActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsCustomResultsActionCell.self))
    }
    
    func generateRows() -> Section {
        return Section(title: nil, rows: [
            TuningsCustomResultsActionRow(title: "2", action: toggleNote),
            TuningsCustomResultsActionRow(title: "3", action: toggleNote),
            TuningsCustomResultsActionRow(title: "4", action: toggleNote),
            TuningsCustomResultsActionRow(title: "5", action: toggleNote),
            TuningsCustomResultsActionRow(title: "6", action: toggleNote),
            TuningsCustomResultsActionRow(title: "7", action: toggleNote),
            ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // 6X5
        let sections = [
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(),
            self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows()
        ]
        tableContents = sections
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func toggleNote(_ sender: Row) {
        let x = 0
    }
    
    
}
