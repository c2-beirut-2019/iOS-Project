//
//  NewsList.swift
//  Animal House
//
//  Created by Roy Geagea on 8/17/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct PaginationListModel<T: Codable>: Codable, Identifiable {
    
    var id = UUID()
    let data : [T]?
    let pageCount : Int?
    let totalCount : Int?
    let pageLimit : Int?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case pageCount = "pageCount"
        case totalCount = "totalCount"
        case pageLimit = "pageLimit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([T].self, forKey: .data)
        pageCount = try values.decodeIfPresent(Int.self, forKey: .pageCount)
        totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
        pageLimit = try values.decodeIfPresent(Int.self, forKey: .pageLimit)
    }

}
