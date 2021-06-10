//
//  Model.swift
//  HttpRequest
//
//  Created by Hoorad on 7/3/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import Foundation

struct CatFactModel: Codable {
    let status: Status
    let type: String
    let text: String
    let updatedAt, createdAt: String
}

// MARK: - Status
struct Status: Codable {
    let verified: Bool
    let sentCount: Int
}
