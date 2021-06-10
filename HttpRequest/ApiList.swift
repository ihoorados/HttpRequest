//
//  Api.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 6/9/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

public enum CatFactApi {
    case facts
}

extension CatFactApi: EndPointType {
    
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
    
    var baseURL: URL {
        return URL(fileURLWithPath: "")
    }
    
    var Headers: HTTPHeaders {
        return HTTPHeaders(["Content-Type":"application/json"])
    }
    
    var Parameters: HTTPParameters {
        return nil
    }
    
    var Method: HTTPMethod {
        return .get
    }

    var headers: HTTPHeaders? {
        return HTTPHeaders(["Content-Type":"application/json"])
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
