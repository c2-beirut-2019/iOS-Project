//
//  DoctorsListPage.swift
//  Animal House
//
//  Created by Roy Geagea on 9/3/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

struct DoctorsListPage: View {
    
    @EnvironmentObject var shared: ReserveAppointmentViewModel
    @ObservedObject var viewModel: DoctorsListViewViewModel
    
    var isReservation: Bool = false
    
    @Binding var selectedDoctor: String

    var body: some View {
        VStack {
            if isReservation {
                List {
                    ForEach(self.viewModel.doctors) { doctor in
                        Button(action: {
                            self.shared.doctor = doctor.doctorModel
                            self.$selectedDoctor.wrappedValue = doctor.fullName
                        }) {
                            DoctorCellView(doctorCellModel: doctor)
                                .accentColor(.black)
                        }
                    }
                }
                .navigationBarTitle(Text(self.viewModel.title))
                .onAppear {
                    guard !self.viewModel.didAppear else {
                        return
                    }
                    self.viewModel.didAppear = true
                    self.viewModel.getDoctors()
                }
            }
            else {
                NavigationView {
                    List {
                        ForEach(self.viewModel.doctors) { doctor in
                            DoctorCellView(doctorCellModel: doctor)
                        }
                    }
                    .navigationBarTitle(Text(self.viewModel.title))
                }
                .onAppear {
                    guard !self.viewModel.didAppear else {
                        return
                    }
                    self.viewModel.didAppear = true
                    self.viewModel.getDoctors()
                }
            }
        }
    }
}
