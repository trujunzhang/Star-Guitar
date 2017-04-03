//
//  SettingsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class SGTuningStandardViewController: UIViewController {

    var titleViewController: TitleViewController!

    @IBOutlet weak var oneColumnContainer: UIView!
    @IBOutlet weak var twoColumnContainer: UIView!
    @IBOutlet weak var tunningTypesContainer: UIView!
    @IBOutlet weak var eventsContainer: UIView!
    @IBOutlet weak var tuningResultContainer: UIView!
    
    var oneColumnViewController: SGOneColumnViewController!
    var twoColumnViewController: SGTwoColumnViewController!
    var tuningTypeViewController: SGTuningTypeViewController!
    var standardResultsViewController: SGStandardResultsViewController!
    var tuningEventViewController: SGTuningEventViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleViewController.setTitleWithSubtitle(title: "Tuning", subtitle: "Standard")
        
        oneColumnViewController.delegate = self
        twoColumnViewController.delegate = self
        tuningTypeViewController.delegate = self
        tuningEventViewController.delegate = self

        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoColumnContainer)
        TuningsEventsLayout(self.view).layoutContainer(self.view, forView: eventsContainer)
        
        // Left hand and Right hand
        // 1: Left handed: [Results,TuningsType]
        // 2: Right handed: [TuningsType,Results]
        if(GuitarSettingsUtils.sharedInstance.isLeftHanded()){
            StandardResultsLayout(self.view).layoutResultsContainer(twoColumnContainer, forResultView: tuningResultContainer,80)
            TuningsTypeLayout(self.view).layoutTuningTypeContainer(tuningResultContainer, forView: tunningTypesContainer,StandResultsColumnSchema.resultsColumnWidth())
        }else{
            TuningsTypeLayout(self.view).layoutTuningTypeContainer(twoColumnContainer, forView: tunningTypesContainer,24)
            StandardResultsLayout(self.view).layoutResultsContainer(tunningTypesContainer, forResultView: tuningResultContainer,TuningTypeSchema.itemWidth())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "titleContainer") {
            self.titleViewController = segue.destination as! TitleViewController
        }
        else if (segue.identifier == "oneColumnContainer") {
            self.oneColumnViewController = segue.destination as! SGOneColumnViewController
        }
        else if (segue.identifier == "twoColumnContainer") {
            self.twoColumnViewController = segue.destination as! SGTwoColumnViewController
        }
        else if (segue.identifier == "typesContainer") {
            self.tuningTypeViewController = segue.destination as! SGTuningTypeViewController
        }
        else if (segue.identifier == "standardResultContainer") {
            self.standardResultsViewController = segue.destination as! SGStandardResultsViewController
        }
        else if (segue.identifier == "eventsContainer") {
            self.tuningEventViewController = segue.destination as! SGTuningEventViewController
        }
    }

}
