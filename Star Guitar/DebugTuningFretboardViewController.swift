//
//  DebugTuningFretboardViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

import UIKit

class DebugTuningFretboardViewController: UIViewController {
    
    @IBOutlet weak var tuningsResultContainer: UIView!
    
    let fretboardBoarderView =  FretboardBoarderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        let type = GuitarSettingsUtils.sharedInstance.getCurrentFretboardBorderType()
        FretboardLayout(self.view).layoutFretboard(self.view, forFretboardView: tuningsResultContainer, 0,0, type )

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
}
