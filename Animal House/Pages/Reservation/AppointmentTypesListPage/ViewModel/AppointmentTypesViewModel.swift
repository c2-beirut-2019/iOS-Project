//
//  AppointmentTypesViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class AppointmentTypesViewModel: ObservableObject {

    var title = "Appointment Types"
    
    @Published var apTypes: [AppointmentTypeViewModel] = [AppointmentTypeViewModel]()

    var didAppear = false
    
    var isLoading: Bool = false

    var sut: Future<[AppointmentType], Error>?
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getAppointmentTypes() {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorsApi.getAppointmentTypesList)
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { apTypes in
            
            var viewModels = [AppointmentTypeViewModel]()
            for each in apTypes {
                viewModels.append(AppointmentTypeViewModel(typeModel: each))
            }
            
            self.apTypes = viewModels
        })
    }
    
}
