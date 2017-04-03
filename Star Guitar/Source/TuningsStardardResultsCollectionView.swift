//
//  TuningsQuickTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/28/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

open class TuningsStandardResultsActionCell: UICollectionViewCell {
    
    override open var isHighlighted: Bool {
        willSet { // make lightgray background show immediately(使灰背景立即出现)
            backRowView.backgroundColor = newValue ? UIColor(named: .selectedHighLine) : UIColor(named: .tableRowBG)
        }
    }
    
    override open var isSelected: Bool {
        willSet { // keep lightGray background (保留灰背景)
            backRowView.backgroundColor = newValue ? UIColor(named: .selectedHighLine): UIColor(named: .tableRowBG)
        }
    }
    

    public let eventLabel = UILabel()
    
    let backRowView = UIView()

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
        //backgroundColor = UIColor(named: .tableRowBG)

        contentView.addSubview(eventLabel)
        contentView.addSubview(backRowView)
        contentView.sendSubview(toBack: backRowView)
        
        eventLabel.font = UIFont.tableRowFont()
        eventLabel.textColor = .black
        eventLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
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


public struct TuningsStandardResultsActionRow: Row, Equatable {
    public func shouldHighlightRowAt() -> Bool {
        return true
    }

    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }

    public func render(viewCell: UIView) {
        let row = self

        let cell = (viewCell as? TuningsStandardResultsActionCell)

        cell?.eventLabel.text = row.title
    }

    public var letter: String = ""
    
    public var number: String = ""
    
    public var haveSharp: Bool = false

    /// The title text of the row.
    public var title: String = ""

    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil

    /// The value is **TapActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: TuningsStandardResultsActionCell.self)

    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?

    ///
    public init(letter: String,number: String, action: ((Row) -> Void)?) {
        self.letter = letter
        self.number = number
        self.action = action
    }

    private init() {
    }


}


