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
        
        var rows: [Row] = [Row]()
        for (_, title) in TwoColumnLetterType.getTitles().enumerated(){
            let row = TwoColumnActionRow(title: title, action: toggleNote)
            rows.append(row)
        }
        
        tableContents = [Section(title: nil, rows: rows)]
    }
    
    public func updateCell(rowIndex:Int){
        tableView.selectRow(at: IndexPath(row: rowIndex, section: 0), animated: true, scrollPosition: .top)
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toggleNote(_ sender: Row) {
        self.delegate?.toggleTwoColumnNumber(sender)
    }


}
