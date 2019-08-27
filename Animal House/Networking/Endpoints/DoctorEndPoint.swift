//
//  UserEndPoint.swift
//  Animal House
//
//  Created by Roy Geagea on 8/23/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum DoctorProfileApi {
    case getProfile
    case updateProfile(bodyParameters: [String: Any])
    case createDoctor(accessCode: String, username: String, password: String)
    case login(username: String, password: String)
}

extension DoctorProfileApi: EndPointType {
    
    var path: String {
        switch self {
            case .getProfile, .updateProfile:
                return "doctor/profile"
            case .createDoctor:
                return "doctor/username"
            case .login:
                return "doctor/authenticate"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getProfile:
                return .get
            case .updateProfile, .createDoctor, .login:
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
            case .createDoctor(let accessCode, let username, let password):
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
        return ["Authorization": "Bearer 9ac71e3a91ae05a66112baaea9ae7c2a1e2ebb69"]
    }
    
}

protocol DoctorProfileService {
    func getProfile() -> Future<DoctorProfile, Error>
    func updateProfile(parameters: [String: Any]) -> Future<DoctorProfile, Error>
    func createUser(accessCode: String, username: String, password: String) -> Future<Session, Error>
    func login(username: String, password: String) -> Future<Session, Error>
}
