//
//  CustomResultsBoarderView.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

class CustomResultsBoarderView: UIView {
    
    let horizonRectView = UIView()
    let verticalRectView = UIView()
    
    func drawBoarder(_ boarderType:ResultsBoarderType,_ itemWidth:Int,_ itemHeight: Int)  {
        self.addSubview(horizonRectView)
        self.addSubview(verticalRectView)
        
        horizonRectView.backgroundColor = UIColor(named: .resultsBoarder)
        verticalRectView.backgroundColor = UIColor(named: .resultsBoarder)
        
        ResultsBoarderLayout(self,withType: boarderType)
            .layoutBoarderView(horizonRectView,verticalRectView )
            .layoutHorizonCircles(itemWidth)
            .layoutVirticalCircles(itemHeight)
    }
    
}
