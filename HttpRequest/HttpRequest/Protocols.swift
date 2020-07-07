//
//  ServicesProtocol.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func DataTask(_ request: ServiceRequest,completion: @escaping(Data?, Error?) -> Void)
    func UploadTask(_ request: ServiceRequest,completion: @escaping(Data?, Error?) -> Void)
    func DownloadTask(_ request: ServiceRequest,completion: @escaping(Data?, Error?) -> Void)

}

protocol ServiceToolsProtocol {
    func ConfigRequestWith(_ ServiceRequest:ServiceRequest) -> URLRequest?
    func StartDataTaskWith(_ request:URLRequest, completion:@escaping(Data?,Error?) -> Void)
    func JSONSerializationWith(_ data:Data, completion:@escaping(Dictionary<String, Any>?,Error?) -> Void)
}

