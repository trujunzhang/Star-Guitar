//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGOneColumnViewController: QuickTableViewController {

    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)
        
        tableView.register(OneColumnActionCell.self, forCellReuseIdentifier: String(describing: OneColumnActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        OneColumnActionRow(title: "C", action: toggleNote),
                        OneColumnActionRow(title: "C", haveSharp: true, action: toggleNote),
                        OneColumnActionRow(title: "D", action: toggleNote),
                        OneColumnActionRow(title: "D", haveSharp: true, action: toggleNote),
                        OneColumnActionRow(title: "E", action: toggleNote),
                        OneColumnActionRow(title: "F", action: toggleNote),
                        OneColumnActionRow(title: "F", haveSharp: true, action: toggleNote),
                        OneColumnActionRow(title: "G", action: toggleNote),
                        OneColumnActionRow(title: "G", haveSharp: true, action: toggleNote),
                        OneColumnActionRow(title: "A", action: toggleNote),
                        OneColumnActionRow(title: "A", haveSharp: true, action: toggleNote),
                        OneColumnActionRow(title: "B", action: toggleNote),
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
