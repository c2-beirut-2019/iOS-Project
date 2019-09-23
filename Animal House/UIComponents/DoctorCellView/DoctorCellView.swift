//
//  DoctorCellView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/9/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct DoctorCellView: View {
    
    var doctorCellModel: DoctorCellViewViewModel!

    var body: some View {
        HStack() {
            VStack (alignment: .leading) {
                LineInfoView(key: "Name", value: doctorCellModel.fullName)
                .padding(.vertical, 5)
                LineInfoView(key: "Speciality", value: doctorCellModel.speciality)
                .padding(.vertical, 5)
                LineInfoView(key: "Diplomas", value: doctorCellModel.diplomas)
                .padding(.vertical, 5)
            }
        }
    }
}

#if DEBUG
struct DoctorCellView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorCellView()
    }
}
#endif
