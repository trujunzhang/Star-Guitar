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

        tableView.register(TapActionCell.self, forCellReuseIdentifier: String(describing: TapActionCell.self))
    }

    func getGuitarTypesSection() -> Section {
        var guitarTypes: [Row] = [Row]()
        for (index, title) in GuitarType.getGuitarTypeTitles().enumerated(){
            let row = TapActionRow(title: title, action: switchGuitarType, tableRowType: GuitarSettingsUtils.sharedInstance.getGuitarTypeRowType(index))
            guitarTypes.append(row)
        }
        return Section(title: "GuitarTypes", rows: guitarTypes)
    }

    func getFretboardSection() -> Section {
        var fretBoards: [Row] = [Row]()
        for (index, title) in FretboardType.getFretboardTitles().enumerated(){
            let row = TapActionRow(title: title, action: switchFretboard, tableRowType: GuitarSettingsUtils.sharedInstance.getFretboardTypeRowType(index))
            fretBoards.append(row)
        }
        return Section(title: "Fretboard", rows: fretBoards)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let tunningsSection = Section(title: "Tunings", rows: [
                TapActionRow(title: "Standard", action: showDetail),
                TapActionRow(title: "Custom", action: showDetail),
                TapActionRow(title: "1 Touch Chords", action: showDetail)
        ]
        )

        tableContents = [
                self.getGuitarTypesSection(),
                tunningsSection,
                self.getFretboardSection()
        ]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions

    private func switchGuitarType(_ sender: Row) {
        GuitarSettingsUtils.sharedInstance.setGuitarType(sender.title)

        tableContents[0] = self.getGuitarTypesSection()
    }

    private func switchFretboard(_ sender: Row) {
        GuitarSettingsUtils.sharedInstance.setFretboardType(sender.title)

        tableContents[2] = self.getFretboardSection()
    }

    private func showDetail(_ sender: Row) {
        let title = sender.title
        
        var viewController: UIViewController? = nil
        if (title  == "Standard"){
            viewController = StoryboardScene.Main.instantiateTuningStandardViewController()
        }else  if (title  == "Custom"){
            viewController = StoryboardScene.Main.instantiateTuningCustomViewController()
        }else  if (title  == "1 Touch Chords"){
            viewController = StoryboardScene.Main.instantiateTouchChordViewController()
        }

        //menu is only an example
        viewController?.modalTransitionStyle = .crossDissolve
        self.present(viewController!, animated: true, completion: nil)
    }


}
