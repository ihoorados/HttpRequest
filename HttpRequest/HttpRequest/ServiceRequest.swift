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
    case put = "PUT"
    case delete = "DELETE"
}

struct Request{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: [Headers]?
}

