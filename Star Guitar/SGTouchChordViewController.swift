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
    var twoColumnViewController: SGTwoColumnViewController!
    var threeChordColumnViewController: SGThreeChordColumnViewController!
    var fourColumnChordViewController: SGFouChordrColumnViewController!
    var fretboardViewController: SGFretboardViewController!
    var tuningsEventViewController: SGTuningsEventViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        self.titleViewController.setTitle(title: "1 Touch Chord")
        
        
        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoChordColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoChordColumnContainer)
        ThreeColumnLayout(self.view).layoutContainer(twoChordColumnContainer, forThirdColumnView: threeColumnContainer, 50,ThreeColumnSchema.threeChordColumnWidth())
        FourColumnLayout(self.view).layoutContainer(threeColumnContainer, forColumnView: fourColumnContainer)
        
        FretboardLayout(self.view).layoutFretboard(fourColumnContainer, forFretboardView: fretboardContainer,0,FretboardColumnSchema.touchChordLeading())
        
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
        else if (segue.identifier == "twoColumnContainer") {
            self.twoColumnViewController = segue.destination as! SGTwoColumnViewController
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
