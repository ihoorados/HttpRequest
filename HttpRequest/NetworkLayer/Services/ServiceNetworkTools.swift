    //
//  File.swift
//  HttpRequest
//
//  Created by Hoorad on 7/4/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
    
    
protocol ServiceToolsProtocol {
    func configureRequestForDataTask(_ HTTPRequest:HTTPRequest) throws -> URLRequest
}

struct ServiceNetworkTools : ServiceToolsProtocol {
    
    func configureRequestForDataTask(_ httpRequest: HTTPRequest) throws -> URLRequest {
        
        guard let method = httpRequest.method  else {
            throw HTTPNetworkError.failed
        }
        guard let scheme = httpRequest.scheme else{
            throw HTTPNetworkError.missingURL
        }
        guard let host = httpRequest.host else{
            throw HTTPNetworkError.missingURL
        }
        guard let path = httpRequest.path else {
            throw HTTPNetworkError.missingURL
        }
        guard let url = buildURL(scheme: scheme, path: path, host: host) else {
            throw HTTPNetworkError.missingURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method

        if let headers = httpRequest.headers{
            guard let headerfeilds = headers else {
                throw HTTPNetworkError.headersNil
            }
            request.allHTTPHeaderFields = headerfeilds
        }
        
        return request
    }
    
    private func buildURL(scheme:String,path:String,host:String) -> URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        return component.url
    }
    
    
}
