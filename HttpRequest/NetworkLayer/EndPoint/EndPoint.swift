//
//  EndPoint.swift
//  HttpRequest
//
//  Created by Hoorad on 7/17/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol EndPointType {
    var path:           String      { get }
    var baseURL:        URL         { get }
    var httpMethod:     HTTPMethod  { get }
    var httpHeaders:    HTTPHeaders { get }
} 
