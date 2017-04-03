//
//  ResultsBoarderLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

public enum ResultsBoarderType: Int {
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}



struct ResultsBoarderSchema {
    
    // ==== ResultsBoarder
    public static func outBoardSize() -> Int {
        return 40
    }
        
}

class ResultsBoarderHelper{
        let customResultsBoarderView =  CustomResultsBoarderView()
    
    func addAsBoarder(_ pageContainer:UIView,_ tuningResultContainer:UIView, _ boarderType:ResultsBoarderType)  {
        
        pageContainer.addSubview(customResultsBoarderView)
        
        
        customResultsBoarderView.snp.makeConstraints { (make) -> Void in
            make.leading.equalTo(tuningResultContainer).offset(-ResultsBoarderSchema.outBoardSize())
            make.trailing.equalTo(tuningResultContainer).offset(ResultsBoarderSchema.outBoardSize())
            make.top.equalTo(tuningResultContainer).offset(-ResultsBoarderSchema.outBoardSize())
            make.bottom.equalTo(tuningResultContainer).offset(ResultsBoarderSchema.outBoardSize())
        }
        
        pageContainer.sendSubview(toBack: customResultsBoarderView)
        
        //let type = ResultsBoarderType.left
        
        //customResultsBoarderView.backgroundColor = .blue
        
        // 6X14
        // 6 * 70(w), 14 * 40(h)
        customResultsBoarderView.drawBoarder(boarderType,CustomResultsColumnSchema.resultsItemWidth(),CustomResultsColumnSchema.resultsItemHeight())
    }
    
}



class ResultsBoarderLayout: BaseTunningLayout {
    
    var horizonBoarderType:ResultsBoarderType =  ResultsBoarderType.left
    var verticalBoarderType:ResultsBoarderType =  ResultsBoarderType.left
    
    let horizonCirclesContainer = UIView()
    let verticalCirclesContainer = UIView()
    
    init(_ pageView: UIView,withType boarderType:ResultsBoarderType) {
        super.init(pageView)
        
        horizonCirclesContainer.backgroundColor = .clear
        verticalCirclesContainer.backgroundColor = .clear
        
        pageView.addSubview(horizonCirclesContainer)
        pageView.addSubview(verticalCirclesContainer)
        
        self.convertBoarderType(boarderType)
    }
    
    func layoutBoarderView(_ horizonRectView: UIView,_ verticalRectView: UIView) -> ResultsBoarderLayout {               
        self.layoutReactView(horizonRectView,horizonCirclesContainer,self.horizonBoarderType)
        self.layoutReactView(verticalRectView,verticalCirclesContainer, self.verticalBoarderType)
        
        return self
    }
    
    //  6X14
    func layoutHorizonCircles(_ itemWidth:Int) -> ResultsBoarderLayout {
        var views:[UIView] = [UIView]()

        let circleWH = 10
        
        for i in 0...5{
            let circleView = UIView()
            
            horizonCirclesContainer.addSubview(circleView)
            
            circleView.backgroundColor = UIColor(named: .resultsBoarder)
            circleView.layer.cornerRadius = CGFloat(circleWH / 2)

            circleView.snp.makeConstraints { (make) -> Void in
                make.leading.equalToSuperview().offset(((itemWidth-circleWH)/2) + itemWidth * i)
                make.centerY.equalToSuperview()
                make.width.equalTo(circleWH)
                make.height.equalTo(circleWH)
            }
        }
        
        
        return self
    }
    
    
    //  6X14
    func layoutVirticalCircles(_ itemHeight:Int) -> ResultsBoarderLayout {
        var views:[UIView] = [UIView]()
        
        let circleWH = 10
        
        for i in 0...13{
            let circleView = UIView()
            
            verticalCirclesContainer.addSubview(circleView)
            
            circleView.backgroundColor = UIColor(named: .resultsBoarder)
            circleView.layer.cornerRadius = CGFloat(circleWH / 2)
            
            circleView.snp.makeConstraints { (make) -> Void in
                make.top.equalToSuperview().offset(((itemHeight-circleWH)/2) + itemHeight * i)
                make.centerX.equalToSuperview()
                make.width.equalTo(circleWH)
                make.height.equalTo(circleWH)
            }
        }
        
        
        return self
    }
    
    private func convertBoarderType(_ boarderType:ResultsBoarderType){
        switch boarderType {
        case .left:
            //   *
            //   *
            //   *
            //   #######
            self.horizonBoarderType = ResultsBoarderType.bottom
            self.verticalBoarderType = ResultsBoarderType.left
        case .right:
            //   #######
            //         *
            //         *
            //         *
            self.horizonBoarderType = ResultsBoarderType.top
            self.verticalBoarderType = ResultsBoarderType.right
        case .top:
            //   *******
            //   #
            //   #
            //   #
            self.horizonBoarderType = ResultsBoarderType.top
            self.verticalBoarderType = ResultsBoarderType.left
        case .bottom:
            //         #
            //         #
            //         #
            //   *******
            self.horizonBoarderType = ResultsBoarderType.bottom
            self.verticalBoarderType = ResultsBoarderType.right
        }
    }
    
    func layoutReactView(_ rectView: UIView,_ circlesContainer: UIView, _ boarderType:ResultsBoarderType) {
        let reactWH = 4
        let offValue = ResultsBoarderSchema.outBoardSize()
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
