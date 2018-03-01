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
        // Dispose of any resources that can be recreated.
    }

    @IBAction func VolumeUpLong(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .ended
        {
            Requests.getRequst(address: "vol_up_stop")
        } else if recognizer.state == .began {
            Requests.getRequst(address: "vol_up_start")
        }
    }

    @IBAction func VolumeDownLong(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .ended
        {
            Requests.getRequst(address: "vol_down_stop")
        } else if recognizer.state == .began {
            Requests.getRequst(address: "vol_down_start")
        }
    }

    @IBAction func VolumeUpTap(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_up_one")
    }
    
    @IBAction func VolumeDownTap(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_down_one")
    }
    
    @IBAction func MuteTap(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "vol_mute")
    }
    
    @IBAction func NavLeft(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/left")
    }
    
    @IBAction func NavRight(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/right")
    }
    
    @IBAction func NavUp(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/up")
    }
    
    @IBAction func NavDown(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/down")
    }
    
    @IBAction func NavOk(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/ok")
    }
    
    @IBAction func NavBack(recognizer:UITapGestureRecognizer) {
        Requests.getRequst(address: "nav/back")
    }

}
