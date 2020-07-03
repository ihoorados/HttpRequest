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
    
}

extension ServiceNetworkLayer : ServiceConfigurationProtocol {
    

    func ConfigRequestWith(_ ServiceRequest: GetRequest) -> URLRequest {
        let url : URL = {
            var component = URLComponents()
            component.scheme = ServiceRequest.scheme
            component.host = ServiceRequest.host
            component.path = ServiceRequest.path!
            return component.url!
        }()
        var request = URLRequest(url: url)
        request.httpMethod = ServiceRequest.method
        return request
    }
    
    func StartTaskWith(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in
            if let error = error {
                print ("\(error)")
                completion(nil,error)
            }
            if let data = data {
                completion(data,nil)
            }
        })
        task.resume()
    }
    
    func JSONSerializationWith(_ data: Data, completion: @escaping([String:Any]?, Error?) -> Void) {
        
        do {
            // make sure this JSON is in the format we expect
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                completion(json,nil)
            }
        } catch let error as NSError {
            completion(nil,error)
        }
        
    }
    
    
    
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
