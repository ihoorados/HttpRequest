//
//  ServicesProtocol.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func get(_ request: ServiceRequest,completion: @escaping(Data?, Error?) -> Void)
    func post(_ request: ServiceRequest,completion: @escaping(Data?, Error?) -> Void)
}

protocol ServiceToolsProtocol {
    func ConfigRequestWith(_ Request:ServiceRequest) -> URLRequest
    func StartDataTaskWith(_ request:URLRequest, completion:@escaping(Data?,Error?) -> Void)
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}

