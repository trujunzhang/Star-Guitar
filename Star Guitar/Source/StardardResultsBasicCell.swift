//
//  StardardResultsBasicCell.swift
//  Star Guitar
//
//  Created by djzhang on 4/19/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit


open class StandardResultsBasicActionCell: BasicCollectionCell {
    
    public let letterLabel = UILabel()
    public let numberLabel = UILabel()
    
    let backRowView = UIView()
    
    override func setCellHighlighted(_ newValue:Bool) {
        backRowView.backgroundColor = newValue ? UIColor(named: .selectedHighLine) : UIColor(named: .tableRowBG)
    }
    
    override func setCellSelected(_ newValue:Bool) {
        backRowView.backgroundColor = newValue ? UIColor(named: .selectedHighLine): UIColor(named: .tableRowBG)
    }
    

}

public class StandardResultsBasicActionRow: Row, Equatable {
    public func setSelectedRowAt(didSelect: Bool) {
        
    }
    
    public func setHighlightRowAt(didHighlight: Bool) {

    }

    public func shouldHighlightRowAt() -> Bool {
        return true
    }
    
    public func getRowHeight(indexPath: IndexPath) -> CGFloat {
        return -1
    }
    
    public func render(viewCell: UIView) {
        fatalError("Subclasses need to implement the `render()` method.")
    }
    
    public func setAction(action: ((Row) -> Void)?){
        self.action = action
    }
    
    public var item:StandardResultItem? = nil
    
    /// The title text of the row.
    public var title: String = ""
    
    /// Subtitle is disabled in TapActionRow.
    public let subtitle: Subtitle? = nil
    
    /// The value is **StandardResultsActionCell**, as the reuse identifier of the table view cell to display the row.
    
    public var cellReuseIdentifier: String { return  String(describing: StandardResultsBasicActionCell.self)}
    //public let cellReuseIdentifier: String = String(describing: StandardResultsBasicActionCell.self)
    
    /// A closure as the tap action when the row is selected.
    public var action: ((Row) -> Void)?
    
    ///
    public init(item:StandardResultItem, action: ((Row) -> Void)?) {
        self.item = item
        self.action = action
    }
    
    private init() {
    }
    
    
}
