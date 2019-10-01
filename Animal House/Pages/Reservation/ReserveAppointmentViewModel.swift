//
//  ReserveAppointmentViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class ReserveAppointmentViewModel: ObservableObject {

    var title = "Reservation"
    var description = "Please fill your information to set your appointment"
    
    var didAppear = false

    let objectWillChange = PassthroughSubject<String, Never>()

    var emptyResponse: String? {
        didSet {
            objectWillChange.send(self.emptyResponse!)
        }
    }
    
    var pet: PetModel?
    var appointmentType: AppointmentType?
    var doctor: Doctor?
    var apDate: String?
    var apTime: String?
    
    var isLoading: Bool = false

    var sut: Future<EmptyResponse, Error>?
    var cancellable: AnyCancellable?

    //MARK: - Setup
    
    init() {
        
    }

    // MARK: - APIs
    
    func addAppointment(date: Date, time: Date) {
            self.isLoading = true
            
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let dateString = formatter.string(from: date)
        let timeString = formatter.string(from: time)
        
        let firstPart = dateString.split(separator: "T")[0]
        let secondPart = timeString.split(separator: "T")[1]

        let startDate = firstPart + "T" + secondPart
        
        self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorsApi.addAppointment(petID: (self.pet?._id)!, doctorID: (self.doctor?._id)!, appointmentTypeID: (self.appointmentType?._id)!, startDate: String(startDate)))
        
        self.cancellable = self.sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
            self.emptyResponse = ""
        }, receiveValue: { empty in
            self.emptyResponse = ""
        })
    }
    
    func validateInput() -> Bool {
        if pet == nil {
            return false
        }
        else if appointmentType == nil {
            return false
        }
        else if doctor == nil {
            return false
        }
        return true
    }
    
}
