//
//  ThreeColumnTableView.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit


/// A `UITableViewCell` subclass with the title text center aligned.

open class ThreeColumnActionCell: UITableViewCell {
    
    // MARK: Initializer
    
    /**
     Overrides `UITableViewCell`'s designated initializer.
     
     - parameter style:           Unused. It always uses `UITableViewCellStyle.Default`.
     - parameter reuseIdentifier: A string used to identify the cell object if it is to be reused for drawing multiple rows of a table view.
     
     - returns: An initialized `ThreeColumnActionCell` object.
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
        
        self.setupSelectedBackground()
        
        textLabel?.font = UIFont.TuningsThreeColumnFont()
        textLabel?.textAlignment = .left
        textLabel?.textColor = .black
    }
    
}


public struct ThreeColumnActionRow: Row, Equatable {
    public func setSelectedRowAt(didSelect: Bool) {
        
    }

    public func setHighlightRowAt(didHighlight: Bool) {
        
    }
    
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return CGFloat(integerLiteral: ThreeColumnSchema.threeColumnItemHeight())
    }
    
    
    public func render(viewCell: UIView) {
        _ = (viewCell as? ThreeColumnActionCell)
    }
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **ThreeColumnActionCell**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: ThreeColumnActionCell.self)
    
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
