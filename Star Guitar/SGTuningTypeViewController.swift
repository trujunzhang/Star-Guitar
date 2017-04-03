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

    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)
        
        
        layout.sectionInset = TuningTypeSchema.edgeInsets() // section與section之間的距離
        layout.itemSize = CGSize(width: TuningTypeSchema.itemWidth(), height: TuningTypeSchema.itemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(0) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距
        
        collectionView.register(TunningTypeActionCell.self, forCellWithReuseIdentifier: String(describing: TunningTypeActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        TunningTypeActionRow(title: "Stardand", action: tunningTypeTapped),
                        TunningTypeActionRow(title: "Drop D", action: tunningTypeTapped),
                        TunningTypeActionRow(title: "Dadgad", action: tunningTypeTapped),
                        TunningTypeActionRow(title: "Open C", action: tunningTypeTapped),
                        TunningTypeActionRow(title: "Custom", action: tunningTypeTapped),
                ])

        ]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func tunningTypeTapped(_ sender: Row) {
        self.delegate?.toggleTuningType(sender)
    }


}
