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
        let muteArray: [String] = GuitarSettingsUtils.sharedInstance.getMuteArray()

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

    func layoutSlider(_ fingerSliderCell: UIView, _ fingerSliderLabel: UILabel, _ rightSwitchPanel: UIView, topCell cell: UIView) {

        fingerSliderCell.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(cell).offset(SGSettingsScreen.secondButtonsMarginInEffectSection())
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(SGSettingsScreen.settingsRowHeightInSection())
        }

        fingerSliderLabel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
        }

        rightSwitchPanel.snp.makeConstraints { (make) -> Void in
            make.centerY.equalToSuperview().offset(SGSettingsScreen.sliderMarginTop())
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(130)
            make.height.equalTo(30)
        }


        fingerSliderCell.backgroundColor = UIColor(named: .tableRowBG)
        fingerSliderLabel.text = "Finger Slide"
        fingerSliderLabel.font = UIFont.tableRowFont()
    }

}
