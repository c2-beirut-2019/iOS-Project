//
//  InputTextField.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct InputTextField: View {
    
    var placeholder: String!
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value)
        .frame(height: 40, alignment: .leading)
    }
}

//#if DEBUG
//struct InputTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        InputTextField(value: "")
//    }
//}
//#endif
