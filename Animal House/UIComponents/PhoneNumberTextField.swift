//
//  PhoneNumberTextField.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct PhoneNumberTextField: View {
    
    @State var countryCode = "+961"
    @State var mobileNumber = ""
    
    var body: some View {
        HStack() {
            TextField("", text: $countryCode)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .disabled(true)
            TextField("Mobile Number", text: $mobileNumber)
            .keyboardType(.phonePad)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
        }
    }
}

#if DEBUG
struct PhoneNumberTextField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberTextField()
    }
}
#endif
