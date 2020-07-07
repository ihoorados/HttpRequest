//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import UIKit

// The Service Network Layer is a core of our moudl of a Request


//      URLSession:
//          1.Delegate
//          2.URLSessionTask
//          3.URLSessionConfiguration

//      URLSessionTask :
//          1.DataTask
//          2.UploadTask
//          3.DownloadTask

struct ServiceNetworkLayer{
    
    var tools : ServiceNetworkTools = {
        let tools = ServiceNetworkTools()
        return tools
    }()
    
    
}

extension ServiceNetworkLayer : ServiceProtocol {
    
    
    func UploadTask(_ request: ServiceRequest, completion: @escaping (Data?, Error?) -> Void) {
        
    }
    
    func DownloadTask(_ request: ServiceRequest, completion: @escaping (Data?, Error?) -> Void) {
        
    }
    
    func DataTask(_ ServiceRequest: ServiceRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        if let request = tools.ConfigRequestWith(ServiceRequest){
            tools.StartDataTaskWith(request) { (data, error) in
                completion(data,error)
            }
        }
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
