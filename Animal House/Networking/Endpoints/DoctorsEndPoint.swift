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
    case getDoctorSchedule(doctorID: String)
    case getDoctorAppointment(doctorID: String)
    case getAppointmentTypesList
    case addAppointment(petID: String, doctorID: String, appointmentTypeID: String, startDate: String)
}

extension DoctorsApi: EndPointType {
    
    var path: String {
        switch self {
            case .getDoctorsList:
                return "doctor/list"
            case .getDoctorSchedule(let doctorID):
                return "doctor/schedule?id=" + doctorID
            case .getDoctorAppointment(let doctorID):
                return "appointment?id=" + doctorID
            case .getAppointmentTypesList:
                return "appointmentType"
            case .addAppointment:
                return "appointment"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
            case .getDoctorsList, .getDoctorSchedule, .getDoctorAppointment, .getAppointmentTypesList:
                return .get
            case .addAppointment:
                return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
            case .getDoctorsList, .getDoctorSchedule, .getDoctorAppointment, .getAppointmentTypesList:
                return .requestParametersAndHeaders(bodyParameters: nil,
                                          bodyEncoding: .urlEncoding,
                                          urlParameters: [:], additionHeaders: headers)
            case .addAppointment(let petID, let doctorID, let appointmentTypeID, let startDate):
                return .requestParametersAndHeaders(bodyParameters: ["pet": petID, "doctor": doctorID, "appointmentType": appointmentTypeID, "startDate": startDate],
                                                 bodyEncoding: .jsonEncoding,
                                                 urlParameters: [:], additionHeaders: headers)
        }
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": UserDefaultsManager.shared.getAuthToken()]
    }
    
}

protocol DoctorsService {
    func getDoctorsList() -> Future<[Doctor], Error>
    func getDoctorSchedule(doctorID: String) -> Future<[DaySchedule], Error>
    func getDoctorAppointments(doctorID: String) -> Future<[DayAppointment], Error>
    func getAppointmentsTypes() -> Future<[AppointmentType], Error>
    func addAppointment(petID: String, doctorID: String, appointmentTypeID: String, startDate: String) -> Future<EmptyResponse, Error>
}
