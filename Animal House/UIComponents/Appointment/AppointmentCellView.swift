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
                LineInfoView(key: "Doctor", value: self.appointmentCellModel.doctorFullName)
                LineInfoView(key: "Speciality", value: self.appointmentCellModel.doctorSpeciality)
            }
            else {
                LineInfoView(key: "Customer", value: self.appointmentCellModel.customerFullName)
            }
            LineInfoView(key: "State Date", value: self.appointmentCellModel.startDate)
            LineInfoView(key: "End Date", value: self.appointmentCellModel.endDate)
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
