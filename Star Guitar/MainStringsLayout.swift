//
//  MainStringsLayout.swift
//  Star Guitar
//
//  Created by djzhang on 3/18/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import SnapKit



class MainStringsSchema: AnyObject {
    
    public static func tralingOffXArray(_ backgroundIndex:Int) -> [Int]{
        return [[0, 4, 8, 0, 4, 9]][backgroundIndex]
    }
    
    public static func marginTop() -> Int{
        return [230,297,42][SGScreenLayout.sharedInstance.deviceIndex]
    }
    
    public static func marginRight() -> Int{
        return [-144,-192,-70][SGScreenLayout.sharedInstance.deviceIndex]
    }
    
    public static func itemHeight() -> Int{
        return [57,78,34][SGScreenLayout.sharedInstance.deviceIndex]
    }
    
}

//var bounds = UIScreen.main.bounds
//var width = bounds.size.width
//var height = bounds.size.height

class MainStringsLayout: AnyObject {

    func layout(_ bgImageView: UIImageView, _ stringsView: Array<UIView>, _ backgroundIndex: Int) {
        let tralingOffXArray = MainStringsSchema.tralingOffXArray(backgroundIndex)

        let boxHeight = 44
        let topY = MainStringsSchema.marginTop()
        for (index, box) in stringsView.enumerated() {
            box.tag = index

            box.backgroundColor = .clear

            //box.backgroundColor = .yellow

            box.snp.makeConstraints { (make) -> Void in
                make.leading.equalTo(0)
                make.trailing.equalTo(MainStringsSchema.marginRight() + tralingOffXArray[index])
                make.height.equalTo(boxHeight)
                make.top.equalToSuperview().offset(topY + MainStringsSchema.itemHeight() * index)
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
