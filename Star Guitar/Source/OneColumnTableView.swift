//
//  TunningQuickTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/28/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

/// A `UITableViewCell` subclass with the title text center aligned.

open class OneColumnActionCell: UITableViewCell {

    public let sharpLabel = UILabel()


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
        backgroundColor = UIColor(named: .tableRowBG)
        
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(named: .selectedHighLine)
        selectedBackgroundView = selectedView
        
        textLabel?.font = UIFont.oneColumnFont()
        textLabel?.textAlignment = .center
        textLabel?.textColor = .black

        contentView.addSubview(sharpLabel)
        sharpLabel.font = UIFont.oneColumnSharpFont()
        sharpLabel.textColor = .black
        sharpLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-4)
        }
    }

}


public struct OneColumnActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }

    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return OneColumnSchema.oneColumnItemHeight()
    }


    public func render(viewCell: UIView) {
        let row = self
        let cell = viewCell 

        let oneColumnActionCell = (cell as? OneColumnActionCell)
        if (row.haveSharp) {
            oneColumnActionCell?.sharpLabel.text = "#"
        }
    }

    /// The title text of the row.
    public var title: String = ""

    public var haveSharp: Bool = false

    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil

    /// The value is **TapActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: OneColumnActionCell.self)

    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?

    ///
    public init(title: String, action: ((Row) -> Void)?) {
        self.title = title
        self.action = action
    }

    public init(title: String, haveSharp: Bool, action: ((Row) -> Void)?) {
        self.title = title
        self.action = action
        self.haveSharp = haveSharp
    }

    private init() {
    }


}




