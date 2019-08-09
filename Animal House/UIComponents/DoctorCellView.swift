//
//  DoctorCellView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/9/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct DoctorCellView: View {
    var body: some View {
        HStack() {
            VStack (alignment: .leading) {
                Text("FirsName LastName")
                .font(.headline)
                    .padding(.vertical, 4)
                Text("speciality")
                .font(.subheadline)
                .padding(.vertical, 4)
            }
            .padding()
            Spacer(minLength: 8)
            VStack(alignment: .trailing) {
                Text("diplomas")
                .offset(x: 0, y: -25)
            }
            .padding(.horizontal, 8)
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
