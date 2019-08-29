//
//  NewsEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 8/17/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum NewsApi {
    case getNews(paginationURL: String)
}

extension NewsApi: EndPointType {
    
    var path: String {
        switch self {
            case .getNews(let paginationURL):
                return "news?" + paginationURL
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getNews:
                return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .getNews:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}

protocol NewsService {
    func getNews(paginationURL: String) -> Future<PaginationListModel<NewsModel>, Error>
}
