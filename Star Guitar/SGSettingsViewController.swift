//
//  SGSettingsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/25/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGSettingsViewController: UIViewController {

    var titleViewController: TitleViewController!

    @IBOutlet weak var firstColumnWidthConstraint: NSLayoutConstraint!

    @IBOutlet weak var secondColumnWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var secondColumnHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleViewController.setTitle(title: "Settings")

        self.layout()
    }

    private func layout() {
        let width = CGFloat(integerLiteral: 450 + DevicesManager.getDeviceIndex() * 150)
        firstColumnWidthConstraint.constant = width
        secondColumnWidthConstraint.constant = width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "titleContainer") {
            self.titleViewController = segue.destination as! TitleViewController
        }
    }


}
