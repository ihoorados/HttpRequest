//
//  ServicesProtocol.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceProtocol {
    func post(_ request: Request, completion: (Data, Error) -> Void)
    func get(_ request: Request,completion: (Data, Error) -> Void)
}

protocol GetRequestProtocol {
    var URL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [Headers] { get }
}

protocol PostRequestProtocol {
    var URL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [Headers] { get }
    var parameter : [String:String] { get }
}
