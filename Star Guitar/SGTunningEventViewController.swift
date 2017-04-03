//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTunningEventViewController: QuickCollectionViewController {

    open override func configCollectionView(_ collectionView: UICollectionView, forLayout layout: UICollectionViewFlowLayout) {
        super.configCollectionView(collectionView, forLayout: layout)


        layout.sectionInset = EventsSchema.edgeInsets() // section與section之間的距離
        layout.itemSize = CGSize(width: EventsSchema.itemWidth(), height: EventsSchema.itemHeight()) // cell的寬、高
        layout.minimumLineSpacing = CGFloat(integerLiteral: EventsSchema.eventsLineSpacing()) // collectionView設定為縱向的話即「行」的間距、橫向則為「列」的間距

        collectionView.register(TunningEventsActionCell.self, forCellWithReuseIdentifier: String(describing: TunningEventsActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        TunningEventsActionRow(title: "Save", action: toggleNote),
                        TunningEventsActionRow(title: "Edit", action: toggleNote),
                        TunningEventsActionRow(title: "Restore", action: toggleNote),
                        TunningEventsActionRow(title: "Trash", action: toggleNote),
                ])

        ]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toggleNote(_ sender: Row) {
        let x = 0
    }


}
