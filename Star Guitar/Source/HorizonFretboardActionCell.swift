//
//  HorizonFretboardActionCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/16/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


open class HorizonTuningsFretboardActionCell: UICollectionViewCell {
    
    override open var isSelected: Bool {
        willSet { // keep lightGray background (保留灰背景)
            //backRowView.backgroundColor = newValue ? UIColor(named: .selectedHighLine): UIColor(named: .tableRowBG)
        }
    }
    
    let circleView = UIView()
    let circleWH = 10
    let rectView = UIView()
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpAppearance()
    }
    
    /**
     Overrides the designated initializer that returns an object initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     
     - returns: `self`, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpAppearance()
    }
    
    // MARK: Private Methods
    
    private func setUpAppearance() {
        backgroundColor = .clear
        
        contentView.addSubview(circleView)
        contentView.addSubview(rectView)
        
        rectView.backgroundColor = UIColor(named: .resultsBoarder)
        circleView.backgroundColor = UIColor(named: .resultsBoarder)
        circleView.layer.cornerRadius = CGFloat(circleWH / 2)

    }
}


public struct HorizonTuningsFretboardActionRow: Row, Equatable {
    public func setSelectedRowAt(didSelect: Bool) {

    }
    
    public func setHighlightRowAt(didHighlight: Bool) {
        
    }
    
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }
    
    public func render(viewCell: UIView) {
        let reactWH = 4
        let circleWH = 10
        
        if let cell = (viewCell as? HorizonTuningsFretboardActionCell){
            var circleOff = -CustomResultsHeaderTitlesSchema.horizonCircleViewOffY()
            if(self.item?.isTop)!{
                circleOff = CustomResultsHeaderTitlesSchema.horizonCircleViewOffY()
                cell.rectView.snp.makeConstraints { (make) -> Void in
                    make.bottom.equalToSuperview()
                    make.leading.equalToSuperview()
                    make.trailing.equalToSuperview()
                    make.height.equalTo(reactWH)
                }
            }else{
                cell.rectView.snp.makeConstraints { (make) -> Void in
                    make.top.equalToSuperview()
                    make.leading.equalToSuperview()
                    make.trailing.equalToSuperview()
                    make.height.equalTo(reactWH)
                }
            }
            
            cell.circleView.snp.makeConstraints { (make) -> Void in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview().offset(circleOff)
                make.width.equalTo(circleWH)
                make.height.equalTo(circleWH)
            }
        }
        
    }
    
    public var item:FretboardBorderGreenItem?
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **TuningsFretboardActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: HorizonTuningsFretboardActionCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init(item:FretboardBorderGreenItem, action: ((Row) -> Void)?) {
        self.item = item
        self.action = action
    }
    
    private init() {
    }
    
    
}



