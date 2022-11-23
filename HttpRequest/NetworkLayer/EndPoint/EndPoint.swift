//
//  EndPoint.swift
//  HttpRequest
//
//  Created by Hoorad on 7/17/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders    = [String: String]?

public enum HTTPMethod: String {
    
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

protocol NetworkEndPoint {
    
    var path:       String             { get }
    var host:       String             { get }
    var scheme:     String             { get }
    var Method:     HTTPMethod         { get }

    var baseURL:    URL?               { get }
    var Headers:    HTTPHeaders        { get }
    var Parameters: HTTPParameters     { get }
}

extension NetworkEndPoint{
    
    func buildURLRequest(with url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        if let headers = Headers{
            for header in headers{
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        return request
    }
        
    func buildURL() -> URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        return component.url
    }
    
    fileprivate func encodeParameters(request:inout URLRequest){
        do {
            guard let parameter = Parameters else {
                return
            }
            request.httpBody = try JSONSerialization.data(withJSONObject: parameter, options: [])
        } catch let err {
            print(err)
        }
    }
}




