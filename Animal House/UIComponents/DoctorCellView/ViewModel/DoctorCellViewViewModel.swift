//
//  DoctorCellViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/3/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct DoctorCellViewViewModel: Identifiable {

    let id = UUID()
    var doctorModel: Doctor!
    
    init(doctorModel: Doctor) {
        self.doctorModel = doctorModel
    }
}

extension DoctorCellViewViewModel {
    
    var fullName: String {
        return (self.doctorModel.firstName ?? "") + " " + (self.doctorModel.lastName ?? "")
    }
    
    var speciality: String {
        return self.doctorModel.speciality ?? ""
    }
    
    var diplomas: String {
        return self.doctorModel.diplomas ?? ""
    }
    
}
