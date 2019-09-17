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
    case validateAccessCode(code: String)
    case createDoctor(accessCode: String, username: String, password: String)
    case login(username: String, password: String)
    case appointmentsList
}

extension DoctorProfileApi: EndPointType {
    
    var path: String {
        switch self {
            case .getProfile, .updateProfile:
                return "doctor/profile"
            case .validateAccessCode:
                return "doctor/code"
            case .createDoctor:
                return "doctor/username"
            case .login:
                return "doctor/authenticate"
            case .appointmentsList:
                return "appointment/doctorAppointment"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getProfile, .appointmentsList:
                return .get
            case .updateProfile, .createDoctor, .login, .validateAccessCode:
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
            case .createDoctor(let accessCode, let username, let password):
                return .requestParametersAndHeaders(bodyParameters: ["accessCode": accessCode, "username": username, "password": password],
                                                    bodyEncoding: .jsonEncoding,
                                                    urlParameters: [:], additionHeaders: nil)
            case .login(let username, let password):
                return .requestParameters(bodyParameters: ["grant_type": "password", "username": username, "password": password],
                                                    bodyEncoding: .jsonBodyUrlEncoded,
                                                    urlParameters: [:])
            case .appointmentsList:
                 return .requestParametersAndHeaders(bodyParameters: nil,
                                           bodyEncoding: .urlEncoding,
                                           urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol DoctorProfileService {
    func getProfile() -> Future<DoctorProfile, Error>
    func updateProfile(parameters: [String: Any]) -> Future<DoctorProfile, Error>
    func validateAccessCode(code: String)
    func createUser(accessCode: String, username: String, password: String) -> Future<Session, Error>
    func login(username: String, password: String) -> Future<Session, Error>
    func getAppointmentsList() -> Future<[AppointmentModel], Error>
}
