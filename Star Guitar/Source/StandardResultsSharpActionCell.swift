//
//  StandardResultsSharpActionCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/4/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation
import UIKit

open class StandardResultsNoHighSharpActionCell: StandardResultsSharpActionCell {
    override func setCellHighlighted(_ newValue:Bool) {
        // No Highlighted
    }
    
    override func setCellSelected(_ newValue:Bool) {
        // No Selection
    }
    
}

public class StandardResultsNoHighSharpActionRow: StandardResultsSharpActionRow {
    
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    public override var cellReuseIdentifier: String { return  String(describing: StandardResultsNoHighSharpActionCell.self)}
}

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


public class StandardResultsSharpActionRow: StandardResultsBasicActionRow {
    
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    public override var cellReuseIdentifier: String { return  String(describing: StandardResultsSharpActionCell.self)}
    
    public override func render(viewCell: UIView) {
        let cell = (viewCell as? StandardResultsSharpActionCell)
        
        cell?.letterLabel.text = self.item?.letter
        cell?.sharpLabel.text = "#"
        cell?.numberLabel.text = self.item?.number
    }
    
    
}

