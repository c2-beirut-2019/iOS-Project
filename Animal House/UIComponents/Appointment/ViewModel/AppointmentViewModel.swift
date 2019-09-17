//
//  AppointmentViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/16/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct AppointmentViewModel: Identifiable {

    let id = UUID()
    fileprivate var appointment: AppointmentModel!
    fileprivate var dateFormatter = DateFormatter()
    
    var isDoctor = UserDefaultsManager.shared.isUserADoctor()
    
    init(appointment: AppointmentModel) {
        self.appointment = appointment
        dateFormatter.dateFormat = "h:m a"
    }
}

extension AppointmentViewModel {
    
    var petImage: String {
        return self.appointment.pet_image ?? ""
    }
    
    var petName: String {
        return self.appointment.pet_name ?? ""
    }
    
    var doctorFullName: String {
        return (self.appointment.doctor_firstName ?? "") + " " + (self.appointment.doctor_lastName ?? "")
    }
    
    var customerFullName: String {
        return (self.appointment.user_firstName ?? "") + " " + (self.appointment.user_lastName ?? "")
    }
    
//    var date: String {
//        let date = self.newsModel.creationDate!.animalHouseDate()
//        let dateFormater = DateFormatter()
//        dateFormater.dateFormat = "E dd MMM yyyy"
//        return dateFormater.string(from: date)
//    }
    
    var doctorSpeciality: String {
        return self.appointment.doctor_speciality ?? ""
    }
    
    var date: String {
        return self.appointment.startDate ?? ""
    }
    
    var startDate: String {
        return self.dateFormatter.string(from: (self.appointment.startDate?.animalHouseDate())!)
    }
    
    var endDate: String {
        return self.dateFormatter.string(from: (self.appointment.endDate?.animalHouseDate())!)
    }
    
    var isConfirmed: Bool {
        return self.appointment.is_confirmed!
    }
}
