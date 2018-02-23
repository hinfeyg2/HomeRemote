//
//  Requests.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 16/02/2018.
//  Copyright © 2018 Gavin Hinfey. All rights reserved.
//

import Foundation

class Requests{
    
    static func http_requst(address: String) {
        // http://192.168.0.235/dothreeleg.py?r=w
        
        print("requests called.")
        
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
    
    
}
