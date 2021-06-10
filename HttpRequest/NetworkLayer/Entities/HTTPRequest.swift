//
//  HTTPMethod.swift
//  HttpRequest
//
//  Created by Hoorad on 7/7/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

//  API Request:
//      An API request typically consists the following components:
//          1) Request type or method
//          2) Request URL : Path, Host, Scheme
//          3) Headers
//          4) Request body Or Parameter

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
