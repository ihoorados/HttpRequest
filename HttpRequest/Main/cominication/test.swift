//
//  test.swift
//  HttpRequest
//
//  Created by Hoorad on 8/30/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    associatedtype Unpacker
    
    var baseURL: URL {  get  }
    var path: String {  get  }
    var method: HTTPMethod {  get  }
    
}


protocol Communicator {
    
}
