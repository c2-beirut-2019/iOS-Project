//
//  ApointmentsListViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/16/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class ApointmentsListViewViewModel: ObservableObject {

    var title = "Appointments"
    
    @Published var aps: [AppointmentViewModel] = [AppointmentViewModel]()

    var didAppear = false
    
    var isLoading: Bool = false
    
    /// Bindable Property used for ending the pagination loading view
    @Published var isEndPagination: Bool = false
        
    var sut: Future<[AppointmentModel], Error>?
    var appointments = [AppointmentModel]()
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getAppointments() {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.appointmentsList)
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { appointments in
            self.appointments = appointments
            var viewModels = [AppointmentViewModel]()
            for each in appointments {
                viewModels.append(AppointmentViewModel(appointment: each))
            }
            
            self.aps = viewModels
        })
    }
}

