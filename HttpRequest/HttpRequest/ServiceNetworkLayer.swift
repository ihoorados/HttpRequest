//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import UIKit

// The Service Network Layer could be a core of our moudl of a HttpRequest

//      We Want to use URLSession!
//      The URLSession have some child in it :

//          1.Delegate
//          2.URLSessionTask
//          3.URLSessionConfiguration

//      For the first step we need URLSessionTask wich contains :

//          1.DataTask
//          2.UploadTask
//          3.DownloadTask

struct ServiceNetworkLayer{
    
    // Create a session for a URLSession
    var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    
    
}

extension ServiceNetworkLayer : ServiceProtocol {
    
    func get(_ ServiceRequest: GetRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        let request = ConfigRequestWith(ServiceRequest)
        StartTaskWith(request) { (data, error) in
            completion(data,error)
        }
    }
    
    func post(_ request: PostRequest, completion: (Data?, Error?) -> Void) {
        
    }
    
    // Pull
    // Delete
    // Update
    
}

//protocol URLSessionProtocol {
//    typealias DataTaskResult = (Data?, URLResponse?, Error?) -> ()
//    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
//}
//
//extension URLSession: URLSessionProtocol {
//    func dataTask(request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask {
//        return dataTask(with: request, completionHandler: completionHandler)
//    }
//}
