//
//  AppointmentTypesListPage.swift
//  Animal House
//
//  Created by Roy Geagea on 9/30/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AppointmentTypesListPage: View {
    
    @EnvironmentObject var shared: ReserveAppointmentViewModel
    @ObservedObject var viewModel: AppointmentTypesViewModel
    
    @Binding var selectedType: String

    var body: some View {
        List {
            ForEach(self.viewModel.apTypes) { apType in
                Button(action: {
                    self.shared.appointmentType = apType.typeModel
                    self.$selectedType.wrappedValue = apType.name
                }) {
                    Text(apType.name)
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
            self.viewModel.getAppointmentTypes()
        }
    }
}
