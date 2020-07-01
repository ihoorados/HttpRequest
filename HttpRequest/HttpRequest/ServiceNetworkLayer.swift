//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import UIKit


// The Api Request could be a core of our moudl of a HttpRequest
//      We Want to use URLSession!
//      The URLSession have some child in it :
//          1.Delegate
//          2.URLSessionTask
//          3.URLSessionConfiguration
//
//      For the first step we need URLSessionTask wich contains :
//          1.DataTask
//          2.UploadTask
//          3.DownloadTask

struct ServiceNetworkLayer : ServiceProtocol{
    
    // Create a session for a URLSession
    lazy var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    func get(_ ServiceRequest: Request, completion: (Data, Error) -> Void) {
        
        let url : URL = {
            var component = URLComponents()
            component.scheme = ServiceRequest.scheme
            component.host = ServiceRequest.host
            component.path = ServiceRequest.path!
            return component.url!
        }()
        
        var request = URLRequest(url: url)
        request.httpMethod = ServiceRequest.method
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            if let response = response {
                let nsHTTPResponse = response as! HTTPURLResponse
                let statusCode = nsHTTPResponse.statusCode
                print ("fetch reviews api : status code = \(statusCode)")
            }
            if let error = error {
                print ("\(error)")
            }
            
            if let data = data {
                print("We have data \(data)")
            }
        })
        task.resume()
        
    }
    
}


protocol URLSessionProtocol {
    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {
    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: completionHandler)
    }
}
