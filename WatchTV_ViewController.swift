//
//  WatchTV_ViewController.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 24/05/2017.
//  Copyright © 2017 Gavin Hinfey. All rights reserved.
//

import UIKit

class WatchTV_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resou rces that can be recreated.
    }

    @IBAction func VolumeUpLong(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .ended
        {
            Requests.getRequst(address: "vol_up_stop")
        } else if recognizer.state == .began {
            Requests.getRequst(address: "vol_up_start")
        }
    }

    @IBAction func VolumeUpTap(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_up_one")
    }
}
