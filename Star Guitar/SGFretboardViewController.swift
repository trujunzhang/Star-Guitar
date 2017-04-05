//
//  SGFretboardViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGFretboardViewController: QuickCollectionViewController {
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        // Debug
        //collectionView.backgroundColor = .red
        
        layout.itemSize = CGSize(width: FretboardColumnSchema.resultsItemWidth(), height: FretboardColumnSchema.resultsItemHeight()) // cell的寬、高
        
        collectionView.register(TuningsFretboardActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsFretboardActionCell.self))
    }
    
    func generateRows() -> Section {
        return Section(title: nil, rows: [
            TuningsFretboardActionRow(title: "2", action: toggleNote),
            TuningsFretboardActionRow(title: "3", action: toggleNote),
            TuningsFretboardActionRow(title: "4", action: toggleNote),
            TuningsFretboardActionRow(title: "5", action: toggleNote),
            TuningsFretboardActionRow(title: "6", action: toggleNote),
            TuningsFretboardActionRow(title: "7", action: toggleNote),
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
