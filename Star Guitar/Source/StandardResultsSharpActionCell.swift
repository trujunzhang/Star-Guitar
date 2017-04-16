//
//  StandardResultsSharpActionCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/4/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit

open class StandardResultsSharpActionCell: StandardResultsActionCell {
    
    public let sharpLabel = UILabel()
   
    // MARK: Private Methods
    
     override func setUpAppearance() {
        backgroundColor = .clear
        //backgroundColor = UIColor(named: .tableRowBG)
        
        contentView.addSubview(letterLabel)
        contentView.addSubview(sharpLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        letterLabel.font = UIFont.letterFont()
        letterLabel.textColor = .black
        letterLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        
        sharpLabel.font = UIFont.letterSharpFont()
        sharpLabel.textColor = .black
        sharpLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-12)
        }
        
        numberLabel.font = UIFont.letterFont()
        numberLabel.textColor = .black
        numberLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(16)
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


public struct StandardResultsSharpActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }
    
    public func render(viewCell: UIView) {
        let cell = (viewCell as? StandardResultsSharpActionCell)
        
        cell?.letterLabel.text = self.letter
        cell?.sharpLabel.text = "#"
        cell?.numberLabel.text = self.number
    }
    
    public var item:ColumnResultItem? = nil
    
    public var letter: String = ""
    
    public var number: String = ""
    
    public var haveSharp: Bool = false
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **StandardResultsSharpActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: StandardResultsSharpActionCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init(item:ColumnResultItem, action: ((Row) -> Void)?) {
        self.item = item
        self.letter = item.letter
        self.number = item.number
        self.action = action
    }
    
    private init() {
    }
    
    
}

