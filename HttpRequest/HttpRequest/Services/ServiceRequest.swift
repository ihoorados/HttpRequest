//
//  Request.swift
//  HttpRequest
//
//  Created by Hoorad on 7/1/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


public typealias HTTPParameters = [String: Any]?
public typealias HTTPHeaders = [String: Any]?

struct ServiceRequest{
    var path: String?
    var host: String?
    var scheme: String?
    var method: HTTPMethod.RawValue?
    var headers: [HTTPHeaders]?
    var parameter: [HTTPHeaders]?
}
