//
//  Appointment.swift
//  Animal House
//
//  Created by Roy Geagea on 9/16/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AppointmentCellView: View {
    
    @State var showImagePicker = false
    @State var finalImage: Image? = nil
    
    var appointmentCellModel: AppointmentViewModel!
    
    var body: some View {
        VStack {
            ProfileHeader(finalImage: self.$finalImage, showImagePicker: self.$showImagePicker, avatar: self.appointmentCellModel.petImage, userName: self.appointmentCellModel.petName)
            if !appointmentCellModel.isDoctor {
                HStack {
                    Text("Doctor: ").fixedSize()
                    Text(self.appointmentCellModel.doctorFullName).fixedSize()
                }
                .padding(.vertical, 5)
                HStack {
                    Text("Speciality: ").fixedSize()
                    Text(self.appointmentCellModel.doctorSpeciality).fixedSize()
                }
                .padding(.vertical, 5)
            }
            else {
                HStack {
                    Text("Customer: ").fixedSize()
                    Text(self.appointmentCellModel.customerFullName).fixedSize()
                }
            }
            HStack {
                Text("State Date: ").fixedSize()
                Text(self.appointmentCellModel.startDate).fixedSize()
            }
            .padding(.vertical, 5)
            HStack {
                Text("End Date: ").fixedSize()
                Text(self.appointmentCellModel.endDate).fixedSize()
            }
            .padding(.vertical, 5)
            HStack {
                if self.appointmentCellModel.isConfirmed {
                    Text("CONFIRMED")
                        .foregroundColor(Color.green)
                        .fixedSize()
                }
                else {
                    Text("NOT CONFIRMED")
                        .foregroundColor(Color.red)
                        .fixedSize()
                }
            }
            .padding(.vertical, 5)
        }
        .padding(.vertical, 10)
    }
    
}
