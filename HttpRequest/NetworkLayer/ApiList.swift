//
//  Api.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 6/9/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

enum ApisList{
    case Feed
    var Request : HTTPRequest {
        switch self {
        case .Feed:
            var feedRequest = HTTPRequest()
            feedRequest.method = HTTPMethod.get.rawValue
            feedRequest.path = "/facts"
            feedRequest.scheme = "https"
            feedRequest.host = "cat-fact.herokuapp.com"
            feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
            return feedRequest
        }
    }
}



