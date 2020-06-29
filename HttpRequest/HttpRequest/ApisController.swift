//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

extension Services {
    
    enum Apis{
        
        case Feed
        case FeedDetails
        
        private var url:URL {
            var components = URLComponents()
            components.path = path
            components.host = baseURL
            components.scheme = "https"
            return components.url!
        }
        
        var path: String {
            switch self {
            case .Feed:
                return "/feedpath"
            case .FeedDetails:
                return "/FeedDetailsPath"
            }
        }
        
        var method: String {
            switch self {
            case .Feed:
                return HTTPMethod.get.rawValue
            case .FeedDetails:
                return HTTPMethod.get.rawValue
            }
        }
        var headers: Headers? {
            switch self {
            case .Feed:
                return nil
            case .FeedDetails:
                return nil
            }
        }
        
        var request:URLRequest  {
            var request = URLRequest(url: url)
            request.httpMethod = method
            return request
        }
        
        
    }

    
}
