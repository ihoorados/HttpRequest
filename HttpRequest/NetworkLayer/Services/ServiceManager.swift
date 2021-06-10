//
//  ServiceManager.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 6/9/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

protocol ServiceManagerDelegate {
    
}

struct FailableDecodable<Base : Decodable> : Decodable {
    let base: Base?
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}

// The Service Network Layer is a core of our moudl of a Request


//      URLSession:
//          1.Delegate
//          2.URLSessionTask
//          3.URLSessionConfiguration


//      URLSessionTask :
//          1.DataTask
//          2.UploadTask
//          3.DownloadTask
