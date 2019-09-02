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
    
    @ObservedObject var viewModel: DoctorsListViewViewModel

    var body: some View {
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

struct DoctorsListPage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsListPage(viewModel: DoctorsListViewViewModel())
    }
}
