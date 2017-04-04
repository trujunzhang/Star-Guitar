//
//  SGOneColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol OneColumnProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleOneColumnLetter(_ sender: Row)
}

class SGOneColumnViewController: QuickTableViewController {
    weak var delegate : OneColumnProviderProtocol?
    
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)
        
        tableView.register(OneColumnActionCell.self, forCellReuseIdentifier: String(describing: OneColumnActionCell.self))
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        var rows: [Row] = [Row]()
        for (_, item) in OneColumnLetterType.getOneColumnLetterItems().enumerated(){
            let row = OneColumnActionRow(item: item, action: toggleNote)
            rows.append(row)
        }

        tableContents = [
            Section(title: nil, rows: rows)
        ]

    }
    
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .top)
        self.delegate?.toggleOneColumnLetter(tableContents[0].rows[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toggleNote(_ sender: Row) {
        self.delegate?.toggleOneColumnLetter(sender)
    }


}
