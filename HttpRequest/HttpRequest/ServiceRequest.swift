//
//  Request.swift
//  HttpRequest
//
//  Created by Hoorad on 7/1/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


typealias Headers = [String: String]

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

struct GetRequest{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: [Headers]?
}

struct PostRequest{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: [Headers]?
    var parameter: [String:Any]?
}

