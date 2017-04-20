//
//  TuningsQuickTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/28/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

open class StandardResultsNoHighActionCell: StandardResultsActionCell {
    override func setCellHighlighted(_ newValue:Bool) {
        // No Highlighted
    }
    
    override func setCellSelected(_ newValue:Bool) {
        // No Selection
    }
    
}

public class StandardResultsNoHighActionRow: StandardResultsActionRow {
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    public override var cellReuseIdentifier: String { return  String(describing: StandardResultsNoHighActionCell.self)}
    
    public override func shouldHighlightRowAt() -> Bool {
        return false
    }
}

open class StandardResultsActionCell: StandardResultsBasicActionCell {
    // MARK: Private Methods
    
    override func setUpAppearance() {
        backgroundColor = .clear
        //backgroundColor = UIColor(named: .tableRowBG)
        
        contentView.addSubview(letterLabel)
        contentView.addSubview(numberLabel)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        letterLabel.font = UIFont.letterFont()
        letterLabel.textColor = .black
        letterLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(-(10 + SGScreenLayout.sharedInstance.deviceIndex * 2))
            make.centerY.equalToSuperview()
        }
        
        numberLabel.font = UIFont.letterFont()
        numberLabel.textColor = .black
        numberLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview().offset(10 + SGScreenLayout.sharedInstance.deviceIndex * 2)
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


public class StandardResultsActionRow: StandardResultsBasicActionRow {
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    public override var cellReuseIdentifier: String { return  String(describing: StandardResultsActionCell.self)}
    
    public override func render(viewCell: UIView) {
        let cell = (viewCell as? StandardResultsActionCell)
        
        cell?.letterLabel.text = self.item?.letter
        cell?.numberLabel.text = self.item?.number
    }
    
}


