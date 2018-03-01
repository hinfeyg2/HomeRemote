//
//  Requests.swift
//  HomeRemote
//
//  Created by Gavin Hinfey on 16/02/2018.
//  Copyright © 2018 Gavin Hinfey. All rights reserved.
//

import Foundation

class Requests{
    
    static func getRequst(address: String) {

        let endPoint = "http://192.168.0.235/" + address
//        let endPoint = "http://0.0.0.0:80/" + address
        print(endPoint)
        var request = URLRequest(url: URL(string: endPoint)!)
        request.httpMethod = "GET"
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
