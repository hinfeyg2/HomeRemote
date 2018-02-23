//
//  Activities_ViewController.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 24/05/2017.
//  Copyright © 2017 Gavin Hinfey. All rights reserved.
//

import UIKit

class Activities_ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resou rces that can be recreated.
    }
    
    @IBAction func AppleTVMusic(_ sender: Any) {
        print("atv")
        
    }
    
    @IBAction func WatchTV(_ sender: Any) {
        Requests.getRequst(address: "activity/watch_tv")
    }
}
