//
//  StandardResultsSharpActionCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/4/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit


open class StandardResultsSharpActionCell: UIView {
    public let letterLabel = UILabel()
    public let numberLabel = UILabel()
    
    let backRowView = UIView()
    
    public let sharpLabel = UILabel()
    
    // MARK: Private Methods
    
    // MARK: Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
     Overrides the designated initializer that returns an object initialized from data in a given unarchiver.
     
     - parameter aDecoder: An unarchiver object.
     
     - returns: `self`, initialized using the data in decoder.
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func setUpAppearance() {
        backgroundColor = .clear
        //backgroundColor = UIColor(named: .tableRowBG)
        
        let contentView = self
        
        contentView.addSubview(letterLabel)
        contentView.addSubview(sharpLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        letterLabel.font = UIFont.letterFont()
        letterLabel.textColor = .black
        letterLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
        }
        
        sharpLabel.font = UIFont.letterSharpFont()
        sharpLabel.textColor = .black
        sharpLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(4)
            make.centerY.equalToSuperview().offset(-12)
        }
        
        numberLabel.font = UIFont.letterFont()
        numberLabel.textColor = .black
        numberLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
        
        let edgeInsets = StandResultsColumnSchema.resultsItemEdgeInsets()
        backRowView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(edgeInsets.top)
            make.bottom.equalToSuperview().offset(-edgeInsets.bottom)
            make.leading.equalToSuperview().offset(edgeInsets.left)
            make.trailing.equalToSuperview().offset(-edgeInsets.right)
        }
        backRowView.backgroundColor = UIColor(named: .tableRowBG)
    }
    
}


public struct StandardResultsSharpActionRow:  Row, Equatable {
    public func setSelectedRowAt(_ viewCell:UIView, didSelect: Bool) {
        self.item?.didSelect = didSelect
            (viewCell as! StandardResultsSharpActionCell).backRowView.backgroundColor = didSelect ? .red : UIColor(named: .tableRowBG)
    }
    
    public func setHighlightRowAt(_ viewCell:UIView, didHighlight: Bool) {
            (viewCell as! StandardResultsSharpActionCell).backRowView.backgroundColor = didHighlight ? .blue : UIColor(named: .tableRowBG)
    }
    
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }
    
    public mutating func setItem(_ newItem:StandardResultItem){
        self.item?.copy(newItem)
    }
    
    public var item:StandardResultItem? = nil
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    
    public let cellReuseIdentifier: String = String(describing: StandardResultsSharpActionCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init(item:StandardResultItem, action: ((Row) -> Void)?) {
        self.item = item
        self.action = action
    }
    
    private init() {
    }
    
    public func render(viewCell: UIView) {
        if let cell = (viewCell as? StandardResultsSharpActionCell){
            if let _item = self.item{
                
                cell.letterLabel.text = self.item?.letter
                cell.sharpLabel.text = ""
                if(_item.haveSharp){
                    cell.sharpLabel.text = "#"
                }
                cell.numberLabel.text = self.item?.number
                
            }
        }
    }
}

