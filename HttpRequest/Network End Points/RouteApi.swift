//
//  RouteApi.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 7/5/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

import Foundation

public enum RouteApi {
    case routeInfo
}

extension RouteApi: NetworkEndPoint {
    
    
    var Parameters: HTTPParameters {
        get {
            return nil
        }
    }
    
    
    var baseURL: URL? {
        get {
            return buildURL()
        }
    }
    
    
    var path: String {
        switch self {
        case .routeInfo:
            return "/facts"
        }
    }
    
    var host: String {
        switch self {
        case .routeInfo:
            return "cat-fact.herokuapp.com"
        }
    }
    
    var scheme: String {
        switch self {
        case .routeInfo:
            return "https"
        }
    }
    
    var Method: HTTPMethod {
        return .get
    }
    
    var Headers: HTTPHeaders {
        return HTTPHeaders(["Content-Type":"application/json"])
    }
    
}
