//
//  TuningsQuickTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/28/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

/// A `UITableViewCell` subclass with the title text center aligned.

open class TuningsEventsActionCell: UICollectionViewCell {

    public let eventLabel = UILabel()

    
    override open var isHighlighted: Bool {
        willSet { // make lightgray background show immediately(使灰背景立即出现)
            eventLabel.backgroundColor = newValue ? UIColor(named: .selectedHighLine) : UIColor(named: .transparent)
        }
    }
    
    override open var isSelected: Bool {
        willSet { // keep lightGray background (保留灰背景)
            eventLabel.backgroundColor = newValue ? UIColor(named: .selectedHighLine): UIColor(named: .transparent)
        }
    }


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
        backgroundColor = UIColor(named: .transparent)

        contentView.addSubview(eventLabel)
        eventLabel.font = UIFont.TuningsEventsFont()
        eventLabel.textColor = .black
        eventLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}


public struct TuningsEventsActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }

    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }


    public func render(viewCell: UIView) {
        let row = self

        let TuningsEventsActionCell = (viewCell as? TuningsEventsActionCell)

        TuningsEventsActionCell?.eventLabel.text = row.title
    }

    /// The title text of the row.
    public var title: String = ""

    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil

    /// The value is **TapActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: TuningsEventsActionCell.self)

    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?

    ///
    public init(title: String, action: ((Row) -> Void)?) {
        self.title = title
        self.action = action
    }

    private init() {
    }


}


