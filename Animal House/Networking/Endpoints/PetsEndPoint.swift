//
//  PetsEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 8/22/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum PetsApi {
    case petsToAdopt(paginationURL: String)
}

extension PetsApi: EndPointType {
    
    var path: String {
        switch self {
            case .petsToAdopt(let paginationURL):
                return "pet/toAdopt?" + paginationURL
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .petsToAdopt:
                return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .petsToAdopt:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}

protocol PetsService {
    func getPetsToAdopt(paginationURL: String) -> Future<PaginationListModel<PetModel>, Error>
}
