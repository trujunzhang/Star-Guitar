//
//  StringsLayoutSchema.swift
//  Star Guitar
//
//  Created by djzhang on 3/18/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import SnapKit


//var bounds = UIScreen.main.bounds
//var width = bounds.size.width
//var height = bounds.size.height

class StringsLayoutSchema: AnyObject {
    let trailingOffY = [0, 0, 0, 0, 0, 0]
    let trailingOffX = [
            [0, 4, 8, 0, 4, 9],
    ]

    let layoutOffs = [
            // iPad
            // 1024×768
            //[226, -144, 57], //iPad mini,iPad Air,iPad Air2,iPad Pro(9.7)
            [230, -144, 57], //iPad mini,iPad Air,iPad Air2,iPad Pro(9.7)

            // 1366×1024
            [311, -192, 76], //iPadPro12Inch

            // Testing(iPhone)
            [42, -70, 34], //iPhone4s
    ]


    func layout(_ bgImageView: UIImageView, _ stringsView: Array<UIView>, _ backgroundIndex: Int) {
        let tralingOffXArray = self.trailingOffX[backgroundIndex]

        var off = self.layoutOffs[DevicesManager.getDeviceIndex()]
        let boxHeight = 44
        let topY = off[0]
        for (index, box) in stringsView.enumerated() {
            box.tag = index

            box.backgroundColor = .clear

            //box.backgroundColor = .yellow

            box.snp.makeConstraints { (make) -> Void in
                make.leading.equalTo(0)
                make.trailing.equalTo(off[1] + tralingOffXArray[index])
                make.height.equalTo(boxHeight)
                make.top.equalToSuperview().offset(topY + off[2] * index)
            }

            for view in box.subviews {
                if let button = view as? UIButton {
                    button.snp.makeConstraints { (make) -> Void in
                        make.leading.equalToSuperview()
                        make.trailing.equalToSuperview()
                        make.height.equalToSuperview()
                        make.top.equalToSuperview()
                    }
                    //button.setTitleColor(UIColor(named: .tableRowBG), for: .normal)
                } else if let imageView = view as? UIImageView {
                    imageView.snp.makeConstraints { (make) -> Void in
                        make.leading.equalToSuperview()
                        make.trailing.equalToSuperview()
                        make.height.equalTo(8)
                        make.centerY.equalToSuperview()
                    }
                    imageView.backgroundColor = .clear
                    imageView.image = UIImage(asset: .string14)
                }
            }
        }

    }


}
