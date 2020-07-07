    //
//  File.swift
//  HttpRequest
//
//  Created by Hoorad on 7/4/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct ServiceNetworkTools : ServiceToolsProtocol {
    
    // Create a session for a URLSession
    var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    
    
    func ConfigRequestWith(_ ServiceRequest: ServiceRequest) -> URLRequest? {
        
        guard let method = ServiceRequest.method  else {
            return nil
        }
        guard let scheme = ServiceRequest.scheme else{
            return nil
        }
        guard let host = ServiceRequest.host else{
            return nil
        }
        guard let path = ServiceRequest.path else {
            return nil
        }
        
        let url : URL = {
            var component = URLComponents()
            component.scheme = scheme
            component.host = host
            component.path = path
            return component.url!
        }()
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }
    

    
    func StartDataTaskWith(_ request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        let task = session.dataTask(with: request, completionHandler: {(data, response, error) in

            if let data = data {
                completion(data,nil)
            }
            if let error = error {
                print ("\(error)")
                completion(nil,error)
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
