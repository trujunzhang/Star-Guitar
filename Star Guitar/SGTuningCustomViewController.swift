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
    @IBOutlet weak var eventsContainer: UIView!
    @IBOutlet weak var tuningsResultContainer: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
        self.titleViewController.setTitleWithSubtitle(title: "Tuning", subtitle: "Custom")


        OneColumnLayout(self.view).layoutContainer(self.view, forColumnView: oneColumnContainer)
        TwoColumnLayout(self.view).layoutContainer(oneColumnContainer, forColumnView: twoColumnContainer)
        ThreeColumnLayout(self.view).layoutContainer(twoColumnContainer, forThirdColumnView: threeColumnContainer,0,ThreeColumnSchema.threeColumnWidth())
        
        CustomResultsLayout(self.view).layoutResultsContainer(threeColumnContainer, forResultView: tuningsResultContainer,0,TuningTypeSchema.itemWidth() + CustomResultsColumnSchema.resultsMarginLeft() + ResultsBoarderSchema.outBoardSize())
        
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
