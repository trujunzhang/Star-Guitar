//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTwoColumnViewController: QuickTableViewController {

    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)

        tableView.register(OneColumnActionCell.self, forCellReuseIdentifier: String(describing: OneColumnActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        OneColumnActionRow(title: "2", action: toggleNote),
                        OneColumnActionRow(title: "3", action: toggleNote),
                        OneColumnActionRow(title: "4", action: toggleNote),
                        OneColumnActionRow(title: "5", action: toggleNote),
                        OneColumnActionRow(title: "6", action: toggleNote),
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
