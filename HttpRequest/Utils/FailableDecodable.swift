//
//  FailableDecodable.swift
//  HttpRequest
//
//  Created by Hoorad Ramezani on 6/10/21.
//  Copyright © 2021 Hoorad. All rights reserved.
//

import Foundation

struct FailableDecodable<Base : Decodable> : Decodable {
    let base: Base?
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Base.self)
    }
}
