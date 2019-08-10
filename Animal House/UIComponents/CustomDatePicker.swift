//
//  CustomDatePicker.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct CustomDatePicker: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State var birthDate = Date()

    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, displayedComponents: .date) {
                Text("")
            }

            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}

#if DEBUG
struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
#endif
