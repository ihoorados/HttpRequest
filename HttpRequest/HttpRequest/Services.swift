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

struct Services{
    
    static let baseURL = "baseurl.com"
    
    func MakeRequest(){
        
        print(Apis.FeedDetails.request)
        print("---------------")
    }
}
