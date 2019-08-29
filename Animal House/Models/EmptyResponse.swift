//
//  EmptyResponse.swift
//  Animal House
//
//  Created by Roy Geagea on 8/29/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct EmptyResponse: Codable {
    
    let success : Bool?

    enum CodingKeys: String, CodingKey {
        case success = "success"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
    }

}
