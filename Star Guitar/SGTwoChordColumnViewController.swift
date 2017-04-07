//
//  SGTwoChordColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTwoChordColumnViewController: QuickTableViewController {
    
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)
        
        tableView.register(ThreeColumnActionCell.self, forCellReuseIdentifier: String(describing: ThreeColumnActionCell.self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        tableContents = [
            Section(title: nil, rows: [
                ThreeColumnActionRow(title: "Maj", action: toggleNote),
                ThreeColumnActionRow(title: "min", action: toggleNote),
                ThreeColumnActionRow(title: "Aug", action: toggleNote),
                ThreeColumnActionRow(title: "Dim", action: toggleNote),
                ThreeColumnActionRow(title: "Sus2", action: toggleNote),
                

                ThreeColumnActionRow(title: "Sus4", action: toggleNote),
                ThreeColumnActionRow(title: "5th", action: toggleNote),
                ThreeColumnActionRow(title: "6th", action: toggleNote),
                ThreeColumnActionRow(title: "7th", action: toggleNote),
                ThreeColumnActionRow(title: "9", action: toggleNote),
                
                
                ThreeColumnActionRow(title: "dom7", action: toggleNote),
                ThreeColumnActionRow(title: "11", action: toggleNote),
                ThreeColumnActionRow(title: "13", action: toggleNote),
                ThreeColumnActionRow(title: "add9", action: toggleNote),
                ThreeColumnActionRow(title: "add11", action: toggleNote),
                ThreeColumnActionRow(title: "add13", action: toggleNote),
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
