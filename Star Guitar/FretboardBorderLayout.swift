//
//  FretboardBorderLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit



struct FretboardBorderSchema {
    
    // ==== ResultsBoarder
    public static func outBoardSize() -> Int {
        return 40
    }
    
    public static func marginLeft() -> Int {
        return 60  + SGScreenLayout.sharedInstance.deviceIndex * 20
    }
    
    public static func getDefaultTopOff(_ type:FretboardBorderType) -> Int {
        var topOff = FretboardBorderSchema.outBoardSize() + 4
        if(type == FretboardBorderType.left || type == FretboardBorderType.bottom){
            topOff = 20
        }
        return topOff
    }
    
    public static func getTopOffOnCustom(_ type:FretboardBorderType) -> Int {
        let defaultTopOff = FretboardBorderSchema.getDefaultTopOff(type)
        let off = (type == FretboardBorderType.left || type == FretboardBorderType.bottom) ? 14 : 14
        return defaultTopOff + off
    }
    
}

class FretboardViewHelper{
    
    let fretboardBoarderView =  FretboardBoarderView()
    
    func addAsBoarder(_ pageContainer:UIView,_ fretboardView:UIView, _ boarderType:FretboardBorderType)  {
        
        pageContainer.addSubview(fretboardBoarderView)
        
        
        fretboardBoarderView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(fretboardView).offset(-FretboardBorderSchema.outBoardSize())
            make.trailing.equalTo(fretboardView).offset(FretboardBorderSchema.outBoardSize())
            make.top.equalTo(fretboardView).offset(-FretboardBorderSchema.outBoardSize())
            make.bottom.equalTo(fretboardView).offset(FretboardBorderSchema.outBoardSize())
        }
        
        pageContainer.sendSubview(toBack: fretboardBoarderView)
        
        //let type = FretboardBorderType.left
        
        //fretboardBoarderView.backgroundColor = .blue
        
        // 6X14
        // 6 * 70(w), 14 * 40(h)
        fretboardBoarderView.drawBoarder(boarderType,FretboardColumnSchema.resultsItemWidth(),FretboardColumnSchema.resultsItemHeight())
    }
    
}



class FretboardBorderLayout: BaseTuningsLayout {
    
    var horizonBoarderType:FretboardBorderType =  FretboardBorderType.left
    var verticalBoarderType:FretboardBorderType =  FretboardBorderType.left
    
    let horizonCirclesContainer = UIView()
    let verticalCirclesContainer = UIView()
    
    var centerVerticleOff = 5
    var centerHorizonOff = 5
    
    init(_ pageView: UIView,withType boarderType:FretboardBorderType) {
        super.init(pageView)
        
        horizonCirclesContainer.backgroundColor = .clear
        verticalCirclesContainer.backgroundColor = .clear
        
        pageView.addSubview(horizonCirclesContainer)
        pageView.addSubview(verticalCirclesContainer)
        
        self.convertBoarderType(boarderType)
        
        self.centerVerticleOff = (self.verticalBoarderType == FretboardBorderType.left) ? 8 : -4
        self.centerHorizonOff = (self.horizonBoarderType == FretboardBorderType.top) ? 5 : -5
    }
    
    func layoutBoarderView(_ horizonRectView: UIView,_ verticalRectView: UIView) -> FretboardBorderLayout {
        self.layoutReactView(horizonRectView,horizonCirclesContainer,self.horizonBoarderType)
        self.layoutReactView(verticalRectView,verticalCirclesContainer, self.verticalBoarderType)
        
        return self
    }
    
    //  6X14
    func layoutHorizonCircles(_ itemWidth:Int) -> FretboardBorderLayout {
        let circleWH = 10
        
        for i in 0...5{
            let circleView = UIView()
            
            horizonCirclesContainer.addSubview(circleView)
            
            circleView.backgroundColor = UIColor(named: .resultsBoarder)
            circleView.layer.cornerRadius = CGFloat(circleWH / 2)

            circleView.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(((itemWidth-circleWH)/2) + itemWidth * i)
                make.centerY.equalToSuperview().offset(self.centerHorizonOff)
                make.width.equalTo(circleWH)
                make.height.equalTo(circleWH)
            }
        }
        
        
        return self
    }
    
    
    //  6X14
    func layoutVirticalCircles(_ itemHeight:Int) -> FretboardBorderLayout {
        let circleWH = 10
        
        for i in 0...13{
            let circleView = UIView()
            
            verticalCirclesContainer.addSubview(circleView)
            
            circleView.backgroundColor = UIColor(named: .resultsBoarder)
            circleView.layer.cornerRadius = CGFloat(circleWH / 2)
            
            circleView.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(((itemHeight-circleWH)/2) + itemHeight * i)
                make.centerX.equalToSuperview().offset(self.centerVerticleOff)
                make.width.equalTo(circleWH)
                make.height.equalTo(circleWH)
            }
        }
        
        
        return self
    }
    
    private func convertBoarderType(_ boarderType:FretboardBorderType){
        switch boarderType {
        case .left:
            //   *
            //   *
            //   *
            //   #######
            self.horizonBoarderType = FretboardBorderType.bottom
            self.verticalBoarderType = FretboardBorderType.left
        case .right:
            //   #######
            //         *
            //         *
            //         *
            self.horizonBoarderType = FretboardBorderType.top
            self.verticalBoarderType = FretboardBorderType.right
        case .top:
            //   *******
            //   #
            //   #
            //   #
            self.horizonBoarderType = FretboardBorderType.top
            self.verticalBoarderType = FretboardBorderType.left
        case .bottom:
            //         #
            //         #
            //         #
            //   *******
            self.horizonBoarderType = FretboardBorderType.bottom
            self.verticalBoarderType = FretboardBorderType.right
        }
    }
    
    func layoutReactView(_ rectView: UIView,_ circlesContainer: UIView, _ boarderType:FretboardBorderType) {
        let reactWH = 4
        let offValue = FretboardBorderSchema.outBoardSize()
        switch boarderType {
        case .left:
            rectView.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(offValue-4)
                make.top.equalToSuperview().offset(offValue)
                make.bottom.equalToSuperview().offset(-offValue)
                make.width.equalTo(reactWH)
            }
            circlesContainer.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview()
                make.top.equalToSuperview().offset(offValue)
                make.bottom.equalToSuperview()
                make.width.equalTo(offValue)
            }
        case .right:
            rectView.snp.makeConstraints { (make) -> Void in
                make.trailing.equalToSuperview().offset(-offValue+8)
                make.top.equalToSuperview().offset(offValue)
                make.bottom.equalToSuperview().offset(-offValue)
                make.width.equalTo(reactWH)
            }
            circlesContainer.snp.makeConstraints { (make) -> Void in
                make.trailing.equalToSuperview()
                make.top.equalToSuperview().offset(offValue)
                make.bottom.equalToSuperview()
                make.width.equalTo(offValue)
            }

        case .top:
            rectView.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(offValue-8)
                make.leading.equalToSuperview().offset(offValue)
                make.trailing.equalToSuperview().offset(-offValue)
                make.height.equalTo(reactWH)
            }
            circlesContainer.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview()
                make.leading.equalToSuperview().offset(offValue)
                make.trailing.equalToSuperview()
                make.height.equalTo(offValue)
            }

        case .bottom:
            rectView.snp.makeConstraints { (make) -> Void in
                make.bottom.equalToSuperview().offset(-offValue + 8)
                make.leading.equalToSuperview().offset(offValue)
                make.trailing.equalToSuperview().offset(-offValue)
                make.height.equalTo(reactWH)
            }
            
            circlesContainer.snp.makeConstraints { (make) -> Void in
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview().offset(offValue)
                make.trailing.equalToSuperview()
                make.height.equalTo(offValue)
            }
            
        }
        
    }
    
}
