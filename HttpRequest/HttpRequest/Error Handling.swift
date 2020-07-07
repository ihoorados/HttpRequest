//
//  Error Handling.swift
//  HttpRequest
//
//  Created by Hoorad on 7/5/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

enum ValidationError: Error {
    case tooShort
    case tooLong
    case invalidCharacterFound(Character)
}
