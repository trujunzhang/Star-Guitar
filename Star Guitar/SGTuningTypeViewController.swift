//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol TuningTypeProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleTuningType(_ sender: Row)
}

class SGTuningTypeViewController: QuickCollectionViewController {
    weak var delegate : TuningTypeProviderProtocol?

    public override func setDefaultSelectedCells(_ collectionView: UICollectionView){
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
    }
    
    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        
        layout.sectionInset = TuningTypeSchema.edgeInsets() // section與section之間的距離
        layout.itemSize = CGSize(width: TuningTypeSchema.itemWidth(), height: TuningTypeSchema.itemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(0) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        
        collectionView.register(TuningsTypeActionCell.self, forCellWithReuseIdentifier: String(describing: TuningsTypeActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        TuningsTypeActionRow(title: "Stardand", action: tuningsTypeTapped),
                        TuningsTypeActionRow(title: "Drop D", action: tuningsTypeTapped),
                        TuningsTypeActionRow(title: "Dadgad", action: tuningsTypeTapped),
                        TuningsTypeActionRow(title: "Open C", action: tuningsTypeTapped),
                        TuningsTypeActionRow(title: "Custom", action: tuningsTypeTapped),
                ])

        ]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func tuningsTypeTapped(_ sender: Row) {
        self.delegate?.toggleTuningType(sender)
    }


}
