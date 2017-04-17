//
//  SGGuitarTypesViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/25/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGGuitarTypesViewController: QuickTableViewController {
    open override func configTableView(_ tableView: UITableView) {
        super.configTableView(tableView)

        tableView.register(TuningsSelectionActionCell.self, forCellReuseIdentifier: String(describing: TuningsSelectionActionCell.self))
        tableView.register(TuningsActionCell.self, forCellReuseIdentifier: String(describing: TuningsActionCell.self))
    }

    func getGuitarTypesSection() -> Section {
        var guitarTypes: [Row] = [Row]()
        for (index, title) in GuitarType.getGuitarTypeTitles().enumerated(){
            let row = TuningsSelectionActionRow(title: title, action: switchGuitarType, tableRowImage: GuitarConfigureAsync.sharedInstance.getGuitarTypeRowType(index))
            guitarTypes.append(row)
        }
        return Section(title: "GuitarTypes", rows: guitarTypes)
    }

    func getFretboardSection() -> Section {
        var fretBoards: [Row] = [Row]()
        let fretboardTypeArray:[String] =  GuitarConfigureAsync.sharedInstance.parseFretBoardRows()
        for (index, title) in FretboardType.getFretboardTitles().enumerated(){
            var tableRowImage:UIImage? = nil
            if(fretboardTypeArray[index] == "1"){
                tableRowImage = Asset.selected.image
            }
            let row = TuningsSelectionActionRow(title: title, action: switchFretboard, tableRowImage: tableRowImage)
            fretBoards.append(row)
        }
        return Section(title: "Fretboard", rows: fretBoards)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let tuningsSection = Section(title: "Tunings", rows: [
                TuningsActionRow(title: "Standard", action: showDetail),
                TuningsActionRow(title: "Custom", action: showDetail),
                TuningsActionRow(title: "1 Touch Chords", action: showDetail)
        ]
        )

        tableContents = [
                self.getGuitarTypesSection(),
                tuningsSection,
                self.getFretboardSection()
        ]

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.clearAllSelection()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions

    private func switchGuitarType(_ sender: Row) {
        GuitarConfigureAsync.sharedInstance.setGuitarType(sender.title)

        tableContents[0] = self.getGuitarTypesSection()
    }

    private func switchFretboard(_ sender: Row) {
        GuitarConfigureAsync.sharedInstance.setFretboardType(sender.title)

        tableContents[2] = self.getFretboardSection()
    }

    private func showDetail(_ sender: Row) {
        let title = sender.title
        
        var viewController: UIViewController? = nil
        if (title  == "Standard"){
            viewController = StoryboardScene.Main.instantiateTuningsStandardViewController()
        }else  if (title  == "Custom"){
            viewController = StoryboardScene.Main.instantiateTuningsCustomViewController()
        }else  if (title  == "1 Touch Chords"){
            viewController = StoryboardScene.Main.instantiateTouchChordViewController()
        }

        //menu is only an example
        viewController?.modalTransitionStyle = .crossDissolve
        self.present(viewController!, animated: true, completion: nil)
    }


}
