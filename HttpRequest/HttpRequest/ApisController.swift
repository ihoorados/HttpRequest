//
//  Apis.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation


enum Apis {
    case Feed
    case FeedDetails
}

protocol ApisController {
    func RequestFeedData(completion: @escaping (Bool,Data?,Error?) -> ())
    func RequestFeedDetailsData(completion: @escaping (Bool,Data?,Error?) -> ())
}
