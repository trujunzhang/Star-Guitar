//
//  SGEffectLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/25/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import UIKit

class SGEffectLayout {
    
    init(_ contain: UIView) {
        TableHeaderViewController.addToContainer(contain, withHeight: SGSettingsScreen.settingsSectionHeaderHeight(), withTitle: "Effects")
    }
    
    func layoutMuteStrings(_ muteStringsCell: UIView, _ muteStringsLabel: UILabel) -> SGEffectLayout {
        muteStringsCell.snp.makeConstraints { (make) -> Void in
            make.top.equalToSuperview().offset(SGSettingsScreen.firstCellOffYInEffectSection() + 12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(SGSettingsScreen.settingsRowHeightInSection())
        }
        
        muteStringsLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
        
        muteStringsCell.backgroundColor = UIColor(named: .tableRowBG)
        muteStringsLabel.text = "Mute Strings"
        muteStringsLabel.font = UIFont.tableRowFont()
        
        return self
    }
    
    // 6 mute buttons
    func layoutButtons(_ buttons: [UIButton], topCell cell: UIView) -> SGEffectLayout {
        let muteArray: [String] = GuitarConfigureAsync.sharedInstance.parseMuteArray()
        
        for (index, button) in buttons.enumerated() {
            button.tag = index
            button.isSelected = (muteArray[index] == "1")
            
            button.snp.makeConstraints { (make) -> Void in
                make.top.equalTo(cell).offset(SGSettingsScreen.secondButtonsMarginInEffectSection())
                make.leading.equalToSuperview().offset(10 + index * SGSettingsScreen.secondButtonsOffXInEffectSection())
                make.width.equalTo(SGSettingsScreen.secondButtonsWHInEffectSection())
                make.height.equalTo(SGSettingsScreen.secondButtonsWHInEffectSection())
            }
        }
        
        return self
    }
    
    func layoutFingerSlide(_ fingerSlideCell: UIView, _ fingerSlideLabel: UILabel, _ rightSwitchPanel: UIView, topCell cell: UIView) {
        
        fingerSlideCell.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cell).offset(SGSettingsScreen.secondButtonsMarginInEffectSection())
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(SGSettingsScreen.settingsRowHeightInSection())
        }
        
        fingerSlideLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }
        
        rightSwitchPanel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview().offset(SGSettingsScreen.fingerSlideMarginTop())
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(130)
            make.height.equalTo(30)
        }
        
        
        fingerSlideCell.backgroundColor = UIColor(named: .tableRowBG)
        /*
         *  And the finger slide is spelled wrong. It is "finger slide" not "figure slider". Everything else looks great
         *
         */
        fingerSlideLabel.text = "Finger Slide"
        fingerSlideLabel.font = UIFont.tableRowFont()
    }
    
}
