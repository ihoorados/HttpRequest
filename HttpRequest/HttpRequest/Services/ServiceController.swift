//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


struct ServiceController {
    
    var ServiceShared : ServiceNetworkLayer = {
        let service = ServiceNetworkLayer()
        return service
    }()
    
    enum ApisList{
        
        case Feed
        
        var Request : HTTPRequest {
            switch self {
            case .Feed:
                var feedRequest = HTTPRequest()
                feedRequest.method = HTTPMethod.get.rawValue
                feedRequest.path = "/facts"
                feedRequest.scheme = "https"
                feedRequest.host = "cat-fact.herokuapp.com"
                feedRequest.headers = HTTPHeaders(["Content-Type":"application/json"])
                return feedRequest
            }
        }
    }
    
    func RequestFor(api:ApisList,completion: @escaping (Data?, Error?) -> Void){        
        ServiceShared.DataTask(api.Request) { (data, err) in
            completion(data,err)
        }
    }
    // End Of MakeRequestFor Func
    
}
