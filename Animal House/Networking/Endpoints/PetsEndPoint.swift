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
    case myPets
}

extension PetsApi: EndPointType {
    
    var path: String {
        switch self {
            case .petsToAdopt(let paginationURL):
                return "pet/toAdopt?" + paginationURL
            case .myPets:
                return "pet/client"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
            case .petsToAdopt:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: nil)
            case .myPets:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol PetsService {
    func getPetsToAdopt(paginationURL: String) -> Future<PaginationListModel<PetModel>, Error>
    func getMyPets() -> Future<[PetModel], Error>
}
