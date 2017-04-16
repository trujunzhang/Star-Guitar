//
//  FretboardBoarderView.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import UIKit

protocol FretboardBoarderViewProviderProtocol : class {    // 'class' means only class types can implement it
    func onGreenButtonTapped(_ item: FretboardBorderGreenItem)
}

class FretboardBoarderView: UIView {
    
    weak var delegate : FretboardBoarderViewProviderProtocol?

    
    let horizonRectView = UIView()
    let verticalRectView = UIView()
    
    func drawBoarder(_ boarderType:FretboardBorderType,_ itemWidth:Int,_ itemHeight: Int)  {
        self.addSubview(horizonRectView)
        self.addSubview(verticalRectView)
        
        horizonRectView.backgroundColor = UIColor(named: .resultsBoarder)
        verticalRectView.backgroundColor = UIColor(named: .resultsBoarder)
        
        FretboardBorderLayout(self,withType: boarderType)
            .layoutBoarderView(horizonRectView,verticalRectView )
            .layoutHorizonCircles(itemWidth)
            .layoutVirticalCircles(itemHeight)
            .end()
    }
    
}
