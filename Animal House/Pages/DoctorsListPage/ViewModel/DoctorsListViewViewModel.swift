//
//  DoctorListViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/3/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class DoctorsListViewViewModel: ObservableObject {

    var title = "Doctors"
    
    @Published var doctors: [DoctorCellViewViewModel] = [DoctorCellViewViewModel]()

    var didAppear = false
    
    var isLoading: Bool = false

    var sut: Future<[Doctor], Error>?
    var cancellable: AnyCancellable?
    
    //MARK: - Setup
    
    init() {
        
    }
    
    // MARK: - APIs
    
    func getDoctors() {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorsApi.getDoctorsList)
        
        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false

        }, receiveValue: { doctors in
            var viewModels = [DoctorCellViewViewModel]()
            for each in doctors {
                viewModels.append(DoctorCellViewViewModel(doctorModel: each))
            }
            
            self.doctors = viewModels
        })
    }
    
}
