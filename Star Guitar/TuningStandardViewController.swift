//
//  SettingsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class TuningStandardViewController: UIViewController {

    var titleViewController: TitleViewController!

    @IBOutlet weak var oneColumnContainer: UIView!
    @IBOutlet weak var twoColumnContainer: UIView!
    @IBOutlet weak var tunningTypesContainer: UIView!
    @IBOutlet weak var eventsContainer: UIView!
    @IBOutlet weak var tuningResultContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleViewController.setTitleWithSubtitle(title: "Tuning", subtitle: "Standard")


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
            TuningsTypeLayout(self.view).layoutTuningTypeContainer(twoColumnContainer, forView: tunningTypesContainer,0)
            StandardResultsLayout(self.view).layoutResultsContainer(tunningTypesContainer, forResultView: tuningResultContainer,TuningTypeSchema.tunningTypesColumnWidth())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "titleContainer") {
            self.titleViewController = segue.destination as! TitleViewController
        }
    }

}
