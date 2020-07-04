    //
//  File.swift
//  HttpRequest
//
//  Created by Hoorad on 7/4/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

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
