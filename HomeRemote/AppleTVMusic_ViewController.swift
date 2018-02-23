//
//  AppleTVMusic_ViewController.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 24/05/2017.
//  Copyright © 2017 Gavin Hinfey. All rights reserved.
//

import UIKit

class WatchTV_ViewController: UIViewController {
    
    @IBOutlet weak var amp_vol_up: UIButton!
    @IBOutlet weak var amp_vol_down: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap_gesture_vol_up = UITapGestureRecognizer(target: self, action: #selector(vol_up_normal(_:)))
        let long_gesture_vol_up = UILongPressGestureRecognizer(target: self, action: #selector(vol_up_long(_:)))

        let tap_gesture_vol_down = UITapGestureRecognizer(target: self, action: #selector(vol_down_normal(_:)))
        let long_gesture_vol_down = UILongPressGestureRecognizer(target: self, action: #selector(vol_down_long(_:)))
        
        tap_gesture_vol_up.numberOfTapsRequired = 1
        tap_gesture_vol_down.numberOfTapsRequired = 1
        
        amp_vol_up.addGestureRecognizer(tap_gesture_vol_up)
        amp_vol_up.addGestureRecognizer(long_gesture_vol_up)
        
        amp_vol_down.addGestureRecognizer(tap_gesture_vol_down)
        amp_vol_down.addGestureRecognizer(long_gesture_vol_down)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resou rces that can be recreated.
    }

    @objc func http_requst(address: String) {
        // http://192.168.0.234/dothreeleg.py?r=w
        
        var request = URLRequest(url: URL(string: address)!)
        request.httpMethod = "POST"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
        }
        task.resume()
    }
    
//    @IBAction func upc(_ sender: Any) {
//        http_requst(address: "http://192.168.0.234/dothreeleg.py?r=w")
//    }

    @IBAction func vol_up_normal(_ sender: Any) {
        print("Normal tap up")
        http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_up_normal=on")
    }
    
    @objc func vol_up_long(_ sender: UIGestureRecognizer){
        print("Long tap up")
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
            http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_up_long=off")
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
            http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_up_long=on")
        }
    }
    
    @IBAction func vol_down_normal(_ sender: UIGestureRecognizer) {
        print("Normal tap down")
        http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_down_normal=on")
    }

    @objc func vol_down_long(_ sender: UIGestureRecognizer){
        print("Long tap down")
        if sender.state == .ended {
            print("UIGestureRecognizerStateEnded")
            //Do Whatever You want on End of Gesture
            http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_down_long=off")
        }
        else if sender.state == .began {
            print("UIGestureRecognizerStateBegan.")
            //Do Whatever You want on Began of Gesture
            http_requst(address: "http://192.168.0.234/dothreeleg.py?vol_down_long=on")
        }
    }
    
}
