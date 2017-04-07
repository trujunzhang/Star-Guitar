//
//  SGThreeColumnViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/27/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit


protocol ThreeColumnProviderProtocol : class {    // 'class' means only class types can implement it
    func toggleThreeTopColumnNumber(_ sender: Row)
    func toggleThreeBottonColumnNumber(_ sender: Row)
}

class SGThreeColumnViewController: QuickTableViewController {
    weak var delegate : ThreeColumnProviderProtocol?
    
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)

        tableView.register(ThreeColumnActionCell.self, forCellReuseIdentifier: String(describing: ThreeColumnActionCell.self))
    }
    
    open override func getTableViewHeightForFooterInSection(section: Int)  -> CGFloat  {
        if(section == 0){
            return ThreeColumnSchema.threeColumnTableViewHeightForFooterInFirstSection()
        }
        return super.getTableViewHeightForFooterInSection(section:section)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        tableContents = [
                Section(title: nil, rows: [
                        ThreeColumnActionRow(title: "Major", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "minor", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "H.minor", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "M.minor", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "Pentatonic", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "Blues", action: toggleThreeColumnTopRow),
                        ThreeColumnActionRow(title: "Chromatic", action: toggleThreeColumnTopRow),
                ]),
                
                Section(title: nil, rows: [
                    ThreeColumnActionRow(title: "Dorian", action: toggleThreeColumnBottomRow),
                    ThreeColumnActionRow(title: "Phyridan", action: toggleThreeColumnBottomRow),
                    ThreeColumnActionRow(title: "Lydian", action: toggleThreeColumnBottomRow),
                    ThreeColumnActionRow(title: "Mixolydian", action: toggleThreeColumnBottomRow),
                    ThreeColumnActionRow(title: "Aeolian", action: toggleThreeColumnBottomRow),
                    ThreeColumnActionRow(title: "Locrean", action: toggleThreeColumnBottomRow),
                    ])


        ]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func toggleThreeColumnTopRow(_ sender: Row) {
         self.delegate?.toggleThreeTopColumnNumber(sender)
    }

    private func toggleThreeColumnBottomRow(_ sender: Row) {
         self.delegate?.toggleThreeBottonColumnNumber(sender)
    }

}
