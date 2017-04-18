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
    
    func setupRows(enabledClick:Bool)  {
        var action: ((Row) -> Void)? = nil
        if(enabledClick){
            action = toggleNote
        }
        var rows: [Row] = [Row]()
        for (_, title) in TwoColumnNumberType.getTitles().enumerated(){
            let row = TwoColumnActionRow(title: title, action: action)
            rows.append(row)
        }
        
        tableContents = [Section(title: nil, rows: rows)]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setupRows(enabledClick: false)
    }
    
    public func updateCell(rowIndex:Int){
        if(rowIndex == -1){
            self.clearAllSelection()
        }else{
            tableView.selectRow(at: IndexPath(row: rowIndex, section: 0), animated: true, scrollPosition: .top)
        }
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
