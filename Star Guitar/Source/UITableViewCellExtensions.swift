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
    
    
    func setupSelectedBackground()  {
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor(named: .selectedHighLine)
        selectedBackgroundView = selectedView
    }
    
}
