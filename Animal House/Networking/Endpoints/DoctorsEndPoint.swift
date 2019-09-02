//
//  DoctorsEndPoints.swift
//  Animal House
//
//  Created by Roy Geagea on 9/3/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

public enum DoctorsApi {
    case getDoctorsList
}

extension DoctorsApi: EndPointType {
    
    var path: String {
        switch self {
            case .getDoctorsList:
                return "doctor/list"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getDoctorsList:
                return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .getDoctorsList:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol DoctorsService {
    func getDoctorsList() -> Future<[Doctor], Error>
}
