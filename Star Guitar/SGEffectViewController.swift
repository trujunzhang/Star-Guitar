//
//  SGEffectViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/25/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGEffectViewController: UIViewController {

    // First Line
    @IBOutlet weak var muteStringsCell: UIView!
    @IBOutlet weak var muteStringsLabel: UILabel!

    // Second buttons Line

    @IBOutlet weak var mute1Button: UIButton!
    @IBOutlet weak var mute2Button: UIButton!
    @IBOutlet weak var mute3Button: UIButton!
    @IBOutlet weak var mute4Button: UIButton!
    @IBOutlet weak var mute5Button: UIButton!
    @IBOutlet weak var mute6Button: UIButton!

    var muteButtons: [UIButton] = [UIButton]()

    // Third Line
    @IBOutlet weak var fingerSlideCell: UIView!
    @IBOutlet weak var fingerSlideLabel: UILabel!
    @IBOutlet weak var rightSwitchPanel: UIView!

    @IBOutlet weak var fingerSlideSwich: UISwitch!

    @IBAction func switchValueChanged(_ sender: Any) {
        let isOn = self.fingerSlideSwich.isOn

        GuitarSettingsUtils.sharedInstance.setFingerSlide(isOn)
    }

    @IBAction func mute1Tapped(_ sender: Any) {
        self.updateMuteButtons(0)
    }

    @IBAction func mute2Tapped(_ sender: Any) {
        self.updateMuteButtons(1)
    }

    @IBAction func mute3Tapped(_ sender: Any) {
        self.updateMuteButtons(2)
    }

    @IBAction func mute4Tapped(_ sender: Any) {
        self.updateMuteButtons(3)
    }

    @IBAction func mute5Tapped(_ sender: Any) {
        self.updateMuteButtons(4)
    }

    @IBAction func mute6Tapped(_ sender: Any) {
        self.updateMuteButtons(5)
    }

    private func updateMuteButtons(_ index: Int) {
        let button = self.muteButtons[index]
        let isSelected = button.isSelected
        button.isSelected = !isSelected

        GuitarSettingsUtils.sharedInstance.setMuteArray(index)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fingerSlideSwich.onTintColor = UIColor(named: .mutes)
        fingerSlideSwich.tintColor = UIColor(named: .vcbg)

        self.muteButtons = [
                mute1Button, mute2Button, mute3Button,
                mute4Button, mute5Button, mute6Button
        ]

        SGEffectLayout(self.view)
                .layoutMuteStrings(muteStringsCell, muteStringsLabel)
                .layoutButtons(muteButtons, topCell: muteStringsCell)
                .layoutFingerSlide(fingerSlideCell, fingerSlideLabel, rightSwitchPanel, topCell: mute1Button)

        self.fingerSlideSwich.setOn(GuitarSettingsUtils.sharedInstance.getFingerSlide(), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
