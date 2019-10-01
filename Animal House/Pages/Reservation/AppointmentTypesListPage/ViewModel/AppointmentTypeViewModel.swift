//
//  AppointmentTypeViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

struct AppointmentTypeViewModel: Identifiable {

    let id = UUID()
    var typeModel: AppointmentType!
    
    init(typeModel: AppointmentType) {
        self.typeModel = typeModel
    }
}

extension AppointmentTypeViewModel {
    
    var name: String {
        return typeModel.name ?? ""
    }
    
    
}
