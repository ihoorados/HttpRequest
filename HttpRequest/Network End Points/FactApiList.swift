//
//  Api.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 6/9/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

public enum FactApiList {
    case facts
}

extension FactApiList: NetworkEndPoint {
    
    var baseURL: URL? {
        get {
            return buildURL()
        }
    }
    
    
    var path: String {
        switch self {
        case .facts:
            return "/facts"
        }
    }
    
    var host: String {
        switch self {
        case .facts:
            return "cat-fact.herokuapp.com"
        }
    }
    
    var scheme: String {
        switch self {
        case .facts:
            return "https"
        }
    }
    
    var Method: HTTPMethod {
        return .get
    }
    
    var Headers: HTTPHeaders {
        return HTTPHeaders(["Content-Type":"application/json"])
    }
    
    var Parameters: HTTPParameters {
        return nil
    }
    
}









//
//enum ApisList{
//    case Feed
//    var Request : HTTPRequest {
//        switch self {
//        case .Feed:
//            var feedRequest = HTTPRequest()
//            feedRequest.method = HTTPMethod.get.rawValue
//            feedRequest.path = "/facts"
//            feedRequest.scheme = "https"
//            feedRequest.host = "cat-fact.herokuapp.com"
//            feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
//            return feedRequest
//        }
//    }
//}
