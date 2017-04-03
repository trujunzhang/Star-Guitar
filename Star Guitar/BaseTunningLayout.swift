//
//  TunningLayouts.swift
//  Star Guitar
//
//  Created by djzhang on 3/31/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

class BaseTunningLayout {

    var pageView: UIView?
    init(_ pageView: UIView) {
        self.pageView = pageView
    }

    func layoutContainer(_ leftColumn: UIView, forColumnView columnView: UIView) {
        fatalError("Subclasses need to implement the `layoutContainer()` method.")
    }

    func layoutResultsContainer(_ leftColumn: UIView, forResultView resultView: UIView,_ offLeading:Int) {
        fatalError("Subclasses need to implement the `layoutResultContainer()` method.")
    }

    func layoutContainer(_ leftColumn: UIView, forView containerView: UIView) {
        fatalError("Subclasses need to implement the `layoutContainer()` method.")
    }

}
