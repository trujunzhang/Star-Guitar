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
    @IBOutlet weak var tuningsResultContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        self.titleViewController.setTitle(title: "1 Touch Chord")
        
        
        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoChordColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoChordColumnContainer)
        ThreeColumnLayout(self.view).layoutContainer(twoChordColumnContainer, forThirdColumnView: threeColumnContainer, 50,ThreeColumnSchema.threeChordColumnWidth())
        FourColumnLayout(self.view).layoutContainer(threeColumnContainer, forColumnView: fourColumnContainer)
        
        CustomResultsLayout(self.view).layoutResultsContainer(fourColumnContainer, forResultView: tuningsResultContainer,0,CustomResultsColumnSchema.touchChordLeading())
        
        TuningsEventsLayout(self.view).layoutContainer(self.view, forView: eventsContainer)
        
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
