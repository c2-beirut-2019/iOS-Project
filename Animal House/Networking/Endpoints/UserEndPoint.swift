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
    case validateAccessCode(code: String)
    case createUser(accessCode: String, username: String, password: String)
    case login(username: String, password: String)
}

extension UserProfileApi: EndPointType {
    
    var path: String {
        switch self {
            case .getProfile, .updateProfile:
                return "client/profile"
            case .validateAccessCode:
                return "client/code"
            case .createUser:
                return "client/username"
            case .login:
                return "client/authenticate"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getProfile:
                return .get
        case .updateProfile, .createUser, .login, .validateAccessCode:
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
            case .validateAccessCode(let code):
                return .requestParametersAndHeaders(bodyParameters: ["accessCode": code],
                                                    bodyEncoding: .jsonEncoding,
                                                    urlParameters: [:], additionHeaders: nil)
            case .createUser(let accessCode, let username, let password):
                return .requestParametersAndHeaders(bodyParameters: ["accessCode": accessCode, "username": username, "password": password],
                                                    bodyEncoding: .jsonEncoding,
                                                    urlParameters: [:], additionHeaders: nil)
            case .login(let username, let password):
                return .requestParameters(bodyParameters: ["grant_type": "password", "username": username, "password": password],
                                                    bodyEncoding: .jsonBodyUrlEncoded,
                                                    urlParameters: [:])
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol UserProfileService {
    func getProfile() -> Future<UserProfile, Error>
    func updateProfile(parameters: [String: Any]) -> Future<UserProfile, Error>
    func validateAccessCode(code: String)
    func createUser(accessCode: String, username: String, password: String) -> Future<EmptyResponse, Error>
    func login(username: String, password: String) -> Future<Session, Error>
}
