//
//  ReserveAppointment.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ReserveAppointmentPage: View {
    
    @EnvironmentObject var viewModel: ReserveAppointmentViewModel
    @State var apDate: Date = Date()
    @State var apTime: Date = Date()

    @State var selectedPet: String = "Select Pet"
    @State var selectedType: String = "Select Your Appointment Type"
    @State var selectedDoctor: String = "Select Doctor"
    @State var isButtonLoading: Bool = false

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Your Pet")) {
                    NavigationLink(destination: MyPetsListPage(viewModel: PetsToAdoptListViewModel(), selectedPet: self.$selectedPet)) {
                        Text(selectedPet)
                    }
                }
                Section(header: Text("Appointment Type")) {
                    NavigationLink(destination: AppointmentTypesListPage(viewModel: AppointmentTypesViewModel(), selectedType: self.$selectedType)) {
                        Text(selectedType)
                    }
                }
                Section(header: Text("Your Doctor")) {
                    NavigationLink(destination: DoctorsListPage(viewModel: DoctorsListViewViewModel(), isReservation: true, selectedDoctor: self.$selectedDoctor)) {
                        Text(selectedDoctor)
                    }
                }
                Section(header: Text("Appointment Date")) {
                    CustomDatePicker(birthDate: $apDate)
                }
                Section(header: Text("Appointment Time")) {
                    VStack {
                        DatePicker(selection: $apTime, displayedComponents: .hourAndMinute) {
                            Text("")
                        }
                    }
                }
                
                RoundedButton(title: "Reserve", isDisabled: !self.viewModel.validateInput(), isLoading: self.isButtonLoading, action: {
                    self.isButtonLoading = true
                    self.viewModel.addAppointment(date: self.apDate, time: self.apTime)
                })
            }
        }
        .onReceive(self.viewModel.objectWillChange) { (userProfile) in
            self.isButtonLoading = false
        }
    }
}
