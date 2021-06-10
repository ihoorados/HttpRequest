//
//  EndPoint.swift
//  HttpRequest
//
//  Created by Hoorad on 7/17/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String: String]?

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

struct HTTPRequest{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: HTTPHeaders?
    var parameter: HTTPParameters?
}

// -----------------------------------------------------------

protocol EndPointType {
    var path:       String            { get }
    var host:       String            { get }
    var scheme:     String            { get }
    var baseURL:    URL               { get }
    var Method:     HTTPMethod        { get }
    var Headers:    HTTPHeaders       { get }
    var Parameters: HTTPParameters    { get }
}

extension EndPointType{
    
    func buildURLRequest() throws -> URLRequest {
        guard let url = buildURL() else {
            throw HTTPNetworkError.missingURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = Method.rawValue
        request.allHTTPHeaderFields = Headers
        return request
    }
    
    fileprivate func buildURL() -> URL? {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        return component.url
    }
}
