//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTunningTypeViewController: QuickTableViewController {

    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)

        tableView.register(TunningTypeActionCell.self, forCellReuseIdentifier: String(describing: TunningTypeActionCell.self))
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
        let x = 0
    }


}
