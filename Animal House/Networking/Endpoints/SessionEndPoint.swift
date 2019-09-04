//
//  SessionEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 9/4/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum SessionApi {
    case userRefreshToken(refreshToken: String)
    case doctorRefreshToken(refreshToken: String)
}

extension SessionApi: EndPointType {
    
    var path: String {
        switch self {
            case .userRefreshToken:
                return "client/authenticate"
            case .doctorRefreshToken:
                return "doctor/authenticate"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .post
    }
    
    var task: HTTPTask {
        switch self {
            case .userRefreshToken(let refreshToken), .doctorRefreshToken(let refreshToken):
                return .requestParametersAndHeaders(bodyParameters: ["grant_type": "refresh_token", "refresh_token": refreshToken], bodyEncoding: .jsonBodyUrlEncoded,
                                          urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getRefreshTokenHeader(), "x-api-key": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol SessionService {
    func refreshToken() -> Future<Session, Error>
}
