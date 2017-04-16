//
//  SGTouchChordViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import UIKit

class SGTouchChordViewController: UIViewController {
    
    var titleViewController: TitleViewController!
    
    @IBOutlet weak var oneColumnContainer: UIView!
    @IBOutlet weak var twoChordColumnContainer: UIView!
    @IBOutlet weak var threeColumnContainer: UIView!
    @IBOutlet weak var fourColumnContainer: UIView!
    @IBOutlet weak var eventsContainer: UIView!
    @IBOutlet weak var fretboardContainer: UIView!
    
    
    var oneColumnViewController: SGOneColumnViewController!
    var twoChordColumnViewController: SGTwoChordColumnViewController!
    var threeChordColumnViewController: SGThreeChordColumnViewController!
    var fourColumnChordViewController: SGFouChordrColumnViewController!
    var fretboardViewController: SGFretboardViewController!
    var tuningsEventViewController: SGTuningsEventViewController!
    
    var tuningsChordSettingsUtils = TuningsChordSettingsUtils()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        self.titleViewController.setTitle(title: "1 Touch Chord")
        
        oneColumnViewController.delegate = self
        //twoChordColumnViewController.delegate = self
        //threeColumnViewController.delegate = self
        //tuningsEventViewController.delegate = self
        
        //fretboardViewController.delegate = self
        
        
        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoChordColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoChordColumnContainer)
        ThreeColumnLayout(self.view).layoutContainer(twoChordColumnContainer, forThirdColumnView: threeColumnContainer, 50,ThreeColumnSchema.threeChordColumnWidth())
        FourColumnLayout(self.view).layoutContainer(threeColumnContainer, forColumnView: fourColumnContainer)
        
        /**
         * On the custom tuning in the right hand mode,  the numbers need to be 6th 5th 4th 3rd 2nd 1st
         * And the left hand tuning needs to be 1st 2nd 3rd 4th 5th 6th
         * And this also need to be for the one touch tuning
         */
        let type = GuitarSettingsUtils.sharedInstance.getCurrentFretboardBorderType()
        let leading = FretboardColumnSchema.touchChordLeading(type)
        FretboardLayout(self.view)
            .layoutFretboard(threeColumnContainer,fretboardContainer, leading, type)

        // Add titles to the fretboard view
        CustomResultsViewHelper().addAsTitles(self.view,fretboardContainer,type)
        
        TuningsEventsLayout(self.view).layoutContainer(self.view, forView: eventsContainer)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "titleContainer") {
            self.titleViewController = segue.destination as! TitleViewController
        }else if (segue.identifier == "oneColumnContainer") {
            self.oneColumnViewController = segue.destination as! SGOneColumnViewController
        }
        else if (segue.identifier == "twoChordColumnContainer") {
            self.twoChordColumnViewController = segue.destination as! SGTwoChordColumnViewController
        }
        else if (segue.identifier == "threeChordColumnContainer") {
            self.threeChordColumnViewController = segue.destination as! SGThreeChordColumnViewController
        }
        else if (segue.identifier == "fourChordColumnContainer") {
            self.fourColumnChordViewController = segue.destination as! SGFouChordrColumnViewController
        }
        else if (segue.identifier == "fretboardContainer") {
            self.fretboardViewController = segue.destination as! SGFretboardViewController
        }
        else if (segue.identifier == "eventsContainer") {
            self.tuningsEventViewController = segue.destination as! SGTuningsEventViewController
        }
    }
    
}
