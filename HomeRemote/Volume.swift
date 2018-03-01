//
//  Volume.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 25/02/2018.
//  Copyright © 2018 Gavin Hinfey. All rights reserved.
//

import Foundation
import UIKit

class Volume{
    
    static func test(test: String){
        print(test)
    }
    
    @IBAction func UpLong(recognizer: UIGestureRecognizer) {
        if recognizer.state == .ended
        {
            Requests.getRequst(address: "vol_up_stop")
        } else if recognizer.state == .began {
            Requests.getRequst(address: "vol_up_start")
        }
    }
    
    @IBAction func DownLong(recognizer: UILongPressGestureRecognizer) {
        if recognizer.state == .ended
        {
            Requests.getRequst(address: "vol_down_stop")
        } else if recognizer.state == .began {
            Requests.getRequst(address: "vol_down_start")
        }
    }
    
    @IBAction func UpTap(recognizer: UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_up_one")
    }
    
    @IBAction func DownTap(recognizer: UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_down_one")
    }

    
}
