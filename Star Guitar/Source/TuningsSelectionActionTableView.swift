//
//  TuningsSelectionActionTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/28/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation

import UIKit

/// A `UITableViewCell` subclass with the title text center aligned.

open class TuningsSelectionActionCell: UITableViewCell {

    public let iconImageView: UIImageView = UIImageView()

    let backRowView = UIView()


    // MARK: Initializer

    /**
     Overrides `UITableViewCell`'s designated initializer.
     
     - parameter style:           Unused. It always uses `UITableViewCellStyle.Default`.
     - parameter reuseIdentifier: A string used to identify the cell object if it is to be reused for drawing multiple rows of a table view.
     
     - returns: An initialized `TuningsSelectionActionCell` object.
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
        selectionStyle = .none

        contentView.addSubview(iconImageView)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        iconImageView.contentMode = .center
        iconImageView.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-30)
            make.width.equalTo(20)
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


// MARK: - TuningsSelectionActionRow


/// A struct that represents a row that triggers certain action when seleced.

public struct TuningsSelectionActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }

    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return SGSettingsScreen.settingsRowHeightInSection()
    }

    public func render(viewCell: UIView) {
        let cell = (viewCell as? TuningsSelectionActionCell)
        cell?.iconImageView.image = nil
        if let rowImage = self.tableRowImage{
            cell?.iconImageView.image = rowImage
        }
    }
    
    public var tableRowImage: UIImage?

    /// The title text of the row.
    public var title: String = ""

    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil

    /// The value is **TuningsSelectionActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: TuningsSelectionActionCell.self)

    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?

    ///
    public init(title: String, action: ((Row) -> Void)?, tableRowImage: UIImage?) {
        self.title = title
        self.action = action
        self.tableRowImage = tableRowImage
    }


    private init() {
    }

}
