//
//  UserEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 8/23/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum UserProfileApi {
    case getProfile
    case updateProfile(bodyParameters: [String: Any])
}

extension UserProfileApi: EndPointType {
    
    var path: String {
        switch self {
            case .getProfile, .updateProfile:
                return "client/profile"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getProfile:
                return .get
            case .updateProfile:
                return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .getProfile:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: headers)
            case .updateProfile(let bodyParameters):
                return .requestParametersAndHeaders(bodyParameters: bodyParameters,
                                                    bodyEncoding: .jsonEncoding,
                                                    urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": "Bearer cfcd92b3a9fbf26bb94fd8f40e48b2ae35fbf6cf"]
    }
    
}

protocol UserProfileService {
    func getProfile() -> Future<UserProfile, Error>
    func updateProfile(parameters: [String: Any]) -> Future<UserProfile, Error>
}
