//
//  AppointmentsListPage.swift
//  Animal House
//
//  Created by Roy Geagea on 9/16/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AppointmentsListPage: View {
    
    @State private var scrollEffectValue: Double = 13
    @State private var activePageIndex: Int = 0
    
    @ObservedObject var viewModel: ApointmentsListViewViewModel
    @State var date = Date()
    
    let tileWidth: CGFloat = 250
    let tilePadding: CGFloat = 20
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                if UserDefaultsManager.shared.isUserLoggedIn() {
                    List {
                        RGCalendar(apppointmentsList: self.viewModel.appointments, date: self.$date)
                            .frame(height: 300, alignment: .top)
                        
                        RGPagingScrollView(activePageIndex: self.$activePageIndex, itemCount:self.viewModel.aps.filter{ Calendar.current.isDate($0.date.animalHouseDate(), inSameDayAs: self.date) }.count ,pageWidth:geometry.size.width, tileWidth:self.tileWidth, tilePadding: self.tilePadding){
                            ForEach(self.viewModel.aps.filter{ Calendar.current.isDate($0.date.animalHouseDate(), inSameDayAs: self.date) }) { ap in
                                GeometryReader { geometry2 in
                                    AppointmentCellView(showImagePicker: false, finalImage: nil, appointmentCellModel: ap)
                                        .rotation3DEffect(Angle(degrees: Double((geometry2.frame(in: .global).minX - self.tileWidth*0.5) / -10 )), axis: (x: 2, y: 11, z: 1))
                                        .onTapGesture {

                                        }
                                }
                            }
                        }.frame(height: 300, alignment: .top)
                    }
                }
                else {
                    FeaturePermission()
                    Spacer()
                }
            }
            .navigationBarTitle(Text(self.viewModel.title), displayMode: .inline)
        }
        .onAppear {
            guard !self.viewModel.didAppear else {
                return
            }
            self.viewModel.didAppear = true
            if UserDefaultsManager.shared.isUserLoggedIn() {
                self.viewModel.getAppointments()
            }
        }
    }
    
}
