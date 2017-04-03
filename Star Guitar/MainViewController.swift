//
//  ViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/18/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!

    @IBOutlet weak var string1View: UIView!
    @IBOutlet weak var string2View: UIView!
    @IBOutlet weak var string3View: UIView!
    @IBOutlet weak var string4View: UIView!
    @IBOutlet weak var string5View: UIView!
    @IBOutlet weak var string6View: UIView!

    var backgroundIndex = 0

    let soundPlayerManager: SoundPlayerManager = SoundPlayerManager()


    @IBAction func settingsButtonTaped(_ sender: Any) {
        let viewController: SGSettingsViewController = StoryboardScene.Main.instantiateSgSettingsViewController()

        //menu is only an example
        viewController.modalTransitionStyle = .crossDissolve
        self.present(viewController, animated: true, completion: nil)
    }

    @IBAction func strings1Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 0)
    }

    @IBAction func strings2Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 1)
    }

    @IBAction func strings3Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 2)
    }

    @IBAction func strings4Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 3)
    }

    @IBAction func strings5Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 4)
    }

    @IBAction func strings6Touched(_ sender: Any) {
        self.soundPlayerManager.resetAndPlay(index: 5)
    }


    @IBAction func upSwiped(_ sender: UISwipeGestureRecognizer) {
        if let tag = sender.view?.tag {
            self.soundPlayerManager.resetAndPlay(index: tag)
        }
    }

    @IBAction func downSwiped(_ sender: UISwipeGestureRecognizer) {
        if let tag = sender.view?.tag {
            self.soundPlayerManager.resetAndPlay(index: tag)
        }
    }

    override func viewWillAppear(_ animated: Bool) {

    }

    override func viewDidAppear(_ animated: Bool) {

    }


    // Also, i was messing with the strings and realized that the strings had sounds, I didn't realize this because it is really hard to get the string to sound. The strings need to  be activated by swiping across the screen and when I swipe over them they are activated . Right now it only activates when I directly touch the strings
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let stringsView: [UIView] = [
                string1View, string2View, string3View,
                string4View, string5View, string6View
        ]

        self.soundPlayerManager.prepareSounds(count: stringsView.count, withFormat: "4%d", withType: "wav")

        StringsLayoutSchema().layout(bgImageView, stringsView, backgroundIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

