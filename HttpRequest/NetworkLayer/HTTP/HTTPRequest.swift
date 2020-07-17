//
//  Request.swift
//  HttpRequest
//
//  Created by Hoorad on 7/1/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//


//  API Request:
//      An API request typically consists the following components:
//          1) Request type or method
//          2) Request URL : Path, Host, Scheme
//          3) Headers
//          4) Request body Or Parameter

import Foundation


public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String: String]?

struct HTTPRequest{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: HTTPHeaders?
    var parameter: HTTPParameters?
}
