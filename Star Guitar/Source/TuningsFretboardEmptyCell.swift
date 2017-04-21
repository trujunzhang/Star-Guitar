//
//  TuningsFretboardEmptyCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/16/17.
//  Copyright © 2017 djzhang. All rights reserved.
//



import Foundation
import UIKit


open class TuningsFretboardEmptyCell: UICollectionViewCell {
    
    
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
        
    }
}


public struct TuningsFretboardEmptyRow: Row, Equatable {
    public func setSelectedRowAt(_ viewCell:UICollectionViewCell, didSelect: Bool) {
        
    }
    
    public func setHighlightRowAt(_ viewCell:UICollectionViewCell, didHighlight: Bool) {
        
    }
    
    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }
    
    public func render(viewCell: UIView) {
    }
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **TuningsFretboardEmptyRow**, as the reuse identifier of the table view cell to display the row.
    public let cellReuseIdentifier: String = String(describing: TuningsFretboardEmptyCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init() {
    }

    
}

