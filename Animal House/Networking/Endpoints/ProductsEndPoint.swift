//
//  ProductsEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 9/27/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum ProductsApi {
    case getProducts(paginationURL: String)
}

extension ProductsApi: EndPointType {
    
    var path: String {
        switch self {
            case .getProducts(let paginationURL):
                return "product?" + paginationURL
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getProducts:
                return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .getProducts:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}

protocol ProductsService {
    func getProducts(paginationURL: String) -> Future<PaginationListModel<ProductModel>, Error>
}
