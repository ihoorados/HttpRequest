//
//  ApiRequestConfig.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation



struct ApiRequestConfig {
    
    

    // Create a session for a URLSession
    lazy var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    private static let baseUrl = ""
    
    
    enum EndPoint {
        
        
        case firstcall(path:String)
        
        private var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            return components.url
        }
        
        private var path:String {
            switch self {
            case .firstcall(let path):
                return path
            }
        }
        
    }

    
    
    
    
}
