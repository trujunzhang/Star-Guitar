//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol TuningsTypeProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleTuningType(_ sender: Row)
}

class SGTuningsTypeViewController: QuickCollectionViewController {
    weak var delegate : TuningsTypeProviderProtocol?

    public override func setDefaultSelectedCells(_ collectionView: UICollectionView){
        //collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        //collectionView.backgroundColor = .red
        
        layout.itemSize = CGSize(width: TuningTypeSchema.itemWidth(), height: TuningTypeSchema.itemHeight()) // cell的寬、高
        
        collectionView.register(TuningsTypeActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsTypeActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        var rows: [Row] = [Row]()
        for (_, title) in TuningsStandardType.getTitles().enumerated(){
            let row = TuningsTypeActionRow(title: title, action: tuningsTypeTapped)
            rows.append(row)
        }
        
        tableContents = [Section(title: nil, rows: rows)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toggleCurrentTuningsType(_ item: ColumnResultItem)  {
        let index = TuningsStandardType.getTypeIndex(item)
        var needSelectCell = true
        if let selectedItems = self.collectionView?.indexPathsForSelectedItems{
            if selectedItems.count == 1{
                let indexPath = selectedItems[0]
                let rowIndex = indexPath.row
                if(index == rowIndex){
                    needSelectCell = false
                }
            }
        }
        if(needSelectCell){
            self.collectionView?.selectItem(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .top)
        }
        
    }

    private func tuningsTypeTapped(_ sender: Row) {
        self.delegate?.toggleTuningType(sender)
    }


}
