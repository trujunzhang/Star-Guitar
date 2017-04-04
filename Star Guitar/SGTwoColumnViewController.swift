//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol TwoColumnProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleTwoColumnNumber(_ sender: Row)
}

class SGTwoColumnViewController: QuickTableViewController {
    weak var delegate : TwoColumnProviderProtocol?
    
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)

        tableView.register(TwoColumnActionCell.self, forCellReuseIdentifier: String(describing: TwoColumnActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableContents = [
                Section(title: nil, rows: [
                        TwoColumnActionRow(title: "2", action: toggleNote),
                        TwoColumnActionRow(title: "3", action: toggleNote),
                        TwoColumnActionRow(title: "4", action: toggleNote),
                        TwoColumnActionRow(title: "5", action: toggleNote),
                        TwoColumnActionRow(title: "6", action: toggleNote),
                ])

        ]

    }
    
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
        self.delegate?.toggleTwoColumnNumber(tableContents[0].rows[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toggleNote(_ sender: Row) {
        self.delegate?.toggleTwoColumnNumber(sender)
    }


}
