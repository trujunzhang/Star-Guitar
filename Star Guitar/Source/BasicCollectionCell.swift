//
//  BasicCollectionCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

open class BasicCollectionCell: UICollectionViewCell {
    
    override open var isHighlighted: Bool {
        willSet { // make lightgray background show immediately(使灰背景立即出现)
            self.setCellHighlighted(newValue ? true : false)
        }
    }
    
    override open var isSelected: Bool {
        willSet { // keep lightGray background (保留灰背景)
            self.setCellSelected(newValue ? true : false)
        }
    }
    
    func setCellHighlighted(_ newValue:Bool) {
        fatalError("Subclasses need to implement the `setCellHighlighted()` method.")
    }
    
    func setCellSelected(_ newValue:Bool) {
        fatalError("Subclasses need to implement the `setCellSelected()` method.")
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
    
    func setUpAppearance() {
       fatalError("Subclasses need to implement the `setUpAppearance()` method.")
    }

}
