//
//  UITableViewCellExtensions.swift
//  Star Guitar
//
//  Created by djzhang on 4/5/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell{
    
    
    func setupSelectedBackground() -> UIView {
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(named: .selectedHighLine)
        self.selectedBackgroundView = selectedView
        
        self.contentView.sendSubview(toBack: self.selectedBackgroundView!)
        
        return selectedView
    }
    
}
