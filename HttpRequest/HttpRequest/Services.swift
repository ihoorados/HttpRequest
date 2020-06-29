//
//  ApiRequest.swift
//  HttpRequest
//
//  Created by Hoorad on 6/28/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation
import UIKit


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

enum HTTP {
    enum Method:String {
        case get = "GET"
        case post = "POST"
    }
}


struct Services {
    
    
    
    func MakeRequest(type:URLSessionTasks) -> Data? {
        let data = Data()
        return data
    }
    
    func RequestDataTask(completion: @escaping (Bool,Data?,Error?) -> ()) {
            
    }
    
    func RequestUploadTask(completion: @escaping (Bool,Data?,Error?) -> ()) {
        
    }
        
    func RequestDownloadTask(completion: @escaping (Bool,Data?,Error?) -> ()) {
            
    }

    
    
    
    
}
