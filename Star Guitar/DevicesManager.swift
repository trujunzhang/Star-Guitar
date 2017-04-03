//
//  DevicesManager.swift
//  Star Guitar
//
//  Created by djzhang on 3/23/17.
//  Copyright © 2017 djzhang. All rights reserved.
//

import Foundation
import DeviceKit

class DevicesManager: AnyObject {


    /**
    * type: 0 - ipad mini
    * type: 1 - 12.9 inch
    */
    public static func getDeviceIndex() -> Int {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height

        //1st generation: 1024×768 px at 163 ppi
        //2, 3 & 4: 2048×1536 pixels at 326 ppi (Retina Display)
        //4: Fully laminated display, antireflective coating
        if (width == 1024 && height == 768) {
            return 0
        }

        if (width == 480 && height == 320) {
            // Just for iPhone4s
            return 2
        }

        return 1 //12.9 inch
    }


}
