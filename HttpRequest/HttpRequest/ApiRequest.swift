//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


// The Api Request could be a core of our moudl of a HttpRequest
//      We Want to use URLSession!
//      The URLSession have some child in it :
//          1.Delegate
//          2.URLSessionTask
//          3.URLSessionConfiguration
//
//      For the first step we need URLSessionTask wich contain
//          1.DataTask
//          2.UploadTask
//          3.DownloadTask

enum URLSessionTasks {
    case DataTask
    case UploadTask
    case DownloadTask
}


struct ApiRequest {
    
    // Create a session for a URLSession
    lazy var session : URLSession = {
        let session = URLSession.shared
        return session
    }()
    
    
    func Request(completion: @escaping (Bool,String?,Error?) -> ()) {
        
        
        
    }

    
    
    
    
}
