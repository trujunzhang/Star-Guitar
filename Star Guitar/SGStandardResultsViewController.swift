//
//  SGStardardResultsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGStandardResultsViewController: QuickCollectionViewController {
    
    public override func setDefaultSelectedCells(_ collectionView: UICollectionView){
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }

    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)


        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // section與section之間的距離
        layout.itemSize = CGSize(width: StandResultsColumnSchema.resultsItemWidth(), height: StandResultsColumnSchema.resultsItemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: StandResultsColumnSchema.resultsLineSpacing()) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        layout.minimumInteritemSpacing = CGFloat(integerLiteral: StandResultsColumnSchema.resultsInteritemSpacing()) // collectionView設定為縱向的話即「列」的間距、橫向則為「行」的間距


        collectionView.register(TuningsStandardResultsActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsStandardResultsActionCell.self))
    }

    func generateRows() -> Section {
        var rows: [Row] = [Row]()
        for (_, title) in OneColumnLetterType.getTitles().enumerated(){
            let row = TuningsStandardResultsActionRow(letter: "D#",number:"2", action: toggleNote)
            rows.append(row)
        }
        return Section(title: nil, rows: rows)
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
        //sender.title = "12"
    }
    
    public func updateCell(letter:String,number:String,at index:Int){
        
    }


}
