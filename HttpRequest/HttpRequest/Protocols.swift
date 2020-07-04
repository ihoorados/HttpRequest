//
//  ServicesProtocol.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func get(_ request: GetRequest,completion: @escaping(Data?, Error?) -> Void)
    func post(_ request: PostRequest,completion: @escaping(Data?, Error?) -> Void)
}

protocol ServiceToolsProtocol {
    func ConfigRequestWith(_ request:GetRequest) -> URLRequest
    func StartTaskWith(_ request:URLRequest, completion:@escaping(Data?,Error?) -> Void)
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}

