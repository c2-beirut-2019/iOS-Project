//
//  ChooseUserPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ChooseUserPage: View {
    var body: some View {
        VStack(alignment: .center) {
            RoundedButton(title: "Doctor")
                .padding(.vertical, 10)
            RoundedButton(title: "Client")
        }
    }
}

#if DEBUG
struct ChooseUserPage_Previews: PreviewProvider {
    static var previews: some View {
        ChooseUserPage()
    }
}
#endif
