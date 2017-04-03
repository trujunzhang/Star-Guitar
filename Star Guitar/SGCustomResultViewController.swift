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
        
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // section與section之間的距離
        layout.itemSize = CGSize(width: CustomResultsColumnSchema.resultsItemWidth(), height: CustomResultsColumnSchema.resultsItemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: CustomResultsColumnSchema.resultsLineSpacing()) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: CustomResultsColumnSchema.resultsInteritemSpacing()) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距
        
        
        collectionView.register(TunningCustomResultsActionCell.self, forCellWithReuseIdentifier: String(describing: TunningCustomResultsActionCell.self))
    }
    
    func generateRows() -> Section {
        return Section(title: nil, rows: [
            TunningCustomResultsActionRow(title: "2", action: toggleNote),
            TunningCustomResultsActionRow(title: "3", action: toggleNote),
            TunningCustomResultsActionRow(title: "4", action: toggleNote),
            TunningCustomResultsActionRow(title: "5", action: toggleNote),
            TunningCustomResultsActionRow(title: "6", action: toggleNote),
            TunningCustomResultsActionRow(title: "7", action: toggleNote),
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
