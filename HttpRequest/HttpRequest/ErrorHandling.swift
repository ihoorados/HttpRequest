//
//  Error Handling.swift
//  HttpRequest
//
//  Created by Hoorad on 7/5/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

enum ErrorHandling: Error {
    case invalidRequest
    case invalidData
}


extension ErrorHandling: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidRequest:
            return NSLocalizedString(
                "your request is invalid",
                comment: ""
            )
        case .invalidData:
            return NSLocalizedString(
                "Your data can't be decode",
                comment: ""
            )
        }
    }
}
