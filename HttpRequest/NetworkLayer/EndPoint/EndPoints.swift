//
//  EndPoints.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 7/5/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation


struct HTTPRequest{
    var path: String
    var host: String
    var scheme: String
    var method: HTTPMethod.RawValue
    var headers: HTTPHeaders
    var parameter: HTTPParameters
}

extension HTTPRequest{
    
    func buildURLRequest(with url: URL) -> URLRequest {
        let request = URLRequest(url: url)
        return request
    }
        
    func buildURL() -> URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = getQurey()
        return component.url
    }
    
    func getQurey() -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        if let parameter = parameter{
            for item in parameter{
                queryItems.append(URLQueryItem(name: item.key, value: item.value as? String))
            }
        }
        return queryItems
    }

    
}
