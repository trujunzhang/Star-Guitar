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
        //collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .top)
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

    
    func toggleCurrentTuningsType(_ tuningsStandardType:TuningsStandardType)  {
        self.collectionView?.selectItem(at: IndexPath(row: tuningsStandardType.rawValue, section: 0), animated: false, scrollPosition: .top)
    }

    private func tuningsTypeTapped(_ sender: Row) {
        self.delegate?.toggleTuningType(sender)
    }


}
