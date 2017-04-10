//
//  TuningsSettingsTableView.swift
//  Star Guitar
//
//  Created by djzhang on 4/10/17.
//  Copyright © 2017 djzhang. All rights reserved.
//


import Foundation

import UIKit

/// A `UITableViewCell` subclass with the title text center aligned.

open class TuningsActionCell: UITableViewCell {
    
    public let iconImageView: UIImageView = UIImageView()
    
    let backRowView = UIView()
    
    
    // MARK: Initializer
    
    /**
     Overrides `UITableViewCell`'s designated initializer.
     
     - parameter style:           Unused. It always uses `UITableViewCellStyle.Default`.
     - parameter reuseIdentifier: A string used to identify the cell object if it is to be reused for drawing multiple rows of a table view.
     
     - returns: An initialized `TapActionCell` object.
     */
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
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
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        // Here, First send 'backRowView' to back.
        self.setupSelectedBackground()
        
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(12)
            make.height.equalTo(20)
        }
        
        backRowView.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(SGSettingsScreen.settingsRowMarginTopInSection())
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        backRowView.backgroundColor = UIColor(named: .tableRowBG)
        
        textLabel?.font = UIFont.tableRowFont()
    }
    
}


// MARK: - TapActionRow


/// A struct that represents a row that triggers certain action when seleced.

public struct TuningsActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return SGSettingsScreen.settingsRowHeightInSection()
    }
    
    public func render(viewCell: UIView) {
        let cell = (viewCell as? TuningsActionCell)
        cell?.iconImageView.image = tableRowType.getImage()
    }
    public var tableRowType: TableRowType = TableRowType.Empty
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **TapActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: TuningsActionCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init(title: String, action: ((Row) -> Void)?, tableRowType: TableRowType) {
        self.title = title
        self.action = action
        self.tableRowType = tableRowType
    }
    
    public init(title: String, action: ((Row) -> Void)?) {
        self.init(title: title, action: action, tableRowType: TableRowType.RightArrow)
    }
    
    private init() {
    }
    
}


