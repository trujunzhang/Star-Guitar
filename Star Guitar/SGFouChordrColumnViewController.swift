//
//  SGFourColumnChordViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGFouChordrColumnViewController: QuickTableViewController {
    
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)
        
        tableView.register(ThreeColumnActionCell.self, forCellReuseIdentifier: String(describing: ThreeColumnActionCell.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tableContents = [
            Section(title: nil, rows: [
                ThreeColumnActionRow(title: "Root", action: toggleNote),
                ThreeColumnActionRow(title: "1st", action: toggleNote),
                ThreeColumnActionRow(title: "2nd", action: toggleNote),
                ThreeColumnActionRow(title: "3rd", action: toggleNote),
                ])
            
        ]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func toggleNote(_ sender: Row) {

    }
    
    
}
