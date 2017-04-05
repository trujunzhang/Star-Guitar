//
//  DebugTuningCustomResultsViewController.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

import UIKit

class DebugTuningCustomResultsViewController: UIViewController {
    
    
    @IBOutlet weak var resultsBoarderContaier: UIView!
    
    @IBOutlet weak var tuningsResultContainer: UIView!
    
    let customResultsBoarderView =  CustomResultsBoarderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        FretboardLayout(self.view).layoutFretboard(self.view, forResultView: tuningsResultContainer, 0,0 )

        let type = ResultsBoarderType.left
        ResultsBoarderHelper().addAsBoarder(self.view,tuningsResultContainer,type)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
}
