//
//  SGTuningsCustomViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTuningsCustomViewController: UIViewController {

    var titleViewController: TitleViewController!

    @IBOutlet weak var oneColumnContainer: UIView!
    @IBOutlet weak var twoColumnContainer: UIView!
    @IBOutlet weak var threeColumnContainer: UIView!
    @IBOutlet weak var fretboardContainer: UIView!
    @IBOutlet weak var eventsContainer: UIView!
    
    var oneColumnViewController: SGOneColumnViewController!
    var twoColumnViewController: SGTwoColumnViewController!
    var threeChordColumnViewController: SGThreeChordColumnViewController!
    var fretboardViewController: SGFretboardViewController!
    var tuningsEventViewController: SGTuningsEventViewController!
    
    var tuningsCustomSettingsUtils = TuningsCustomSettingsUtils()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        self.titleViewController.setTitleWithSubtitle(title: "Tuning", subtitle: "Custom")

        
        oneColumnViewController.delegate = self
        twoColumnViewController.delegate = self
        threeChordColumnViewController.delegate = self
        tuningsEventViewController.delegate = self
        
        fretboardViewController.delegate = self

        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoColumnContainer)
        ThreeColumnLayout(self.view).layoutContainer(twoColumnContainer, forThirdColumnView: threeColumnContainer,0,ThreeColumnSchema.threeColumnWidth())
        
        FretboardLayout(self.view).layoutFretboard(threeColumnContainer, forFretboardView: fretboardContainer,0,TuningTypeSchema.itemWidth() + FretboardColumnSchema.resultsMarginLeft() + FretboardBorderSchema.outBoardSize() + FretboardBorderSchema.marginLeft())
        
        TuningsEventsLayout(self.view).layoutContainer(self.view, forView: eventsContainer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "titleContainer") {
            self.titleViewController = segue.destination as! TitleViewController
        } else if (segue.identifier == "oneColumnContainer") {
            self.oneColumnViewController = segue.destination as! SGOneColumnViewController
        }
        else if (segue.identifier == "twoColumnContainer") {
            self.twoColumnViewController = segue.destination as! SGTwoColumnViewController
        }
        else if (segue.identifier == "threeChordColumnContainer") {
            self.threeChordColumnViewController = segue.destination as! SGThreeChordColumnViewController
        }
        else if (segue.identifier == "fretboardContainer") {
            self.fretboardViewController = segue.destination as! SGFretboardViewController
        }
        else if (segue.identifier == "eventsContainer") {
            self.tuningsEventViewController = segue.destination as! SGTuningsEventViewController
        }
    }

}
