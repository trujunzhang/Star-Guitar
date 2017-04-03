//
//  SGStardardResultsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGStardardResultsViewController: QuickCollectionViewController {

    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)


        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // section與section之間的距離
        layout.itemSize = CGSize(width: StandResultsColumnSchema.resultsItemWidth(), height: StandResultsColumnSchema.resultsItemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: StandResultsColumnSchema.resultsLineSpacing()) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: StandResultsColumnSchema.resultsInteritemSpacing()) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距


        collectionView.register(TunningStandardResultsActionCell.self, forCellWithReuseIdentifier: String(describing: TunningStandardResultsActionCell.self))
    }

    func generateRows() -> Section {
        return Section(title: nil, rows: [
                TunningStandardResultsActionRow(title: "D#2", action: toggleNote),
                TunningStandardResultsActionRow(title: "D#3", action: toggleNote),
                TunningStandardResultsActionRow(title: "D#4", action: toggleNote),
                TunningStandardResultsActionRow(title: "D#5", action: toggleNote),
                TunningStandardResultsActionRow(title: "D#6", action: toggleNote),
                TunningStandardResultsActionRow(title: "D#7", action: toggleNote),
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // 6X5
        let sections = [self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows(), self.generateRows()]
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
