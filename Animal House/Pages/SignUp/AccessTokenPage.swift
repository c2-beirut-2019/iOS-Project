//
//  AccessTokenPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AccessTokenPage: View {
    
    @State private var accessToken: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Access Token")) {
                    TextField("Enter here", text: $accessToken)
                }
                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                                    print("register account")
                                }) {
                                    Text("Continue")
                                }
                        Spacer()
                    }

                }
            }
            .navigationBarTitle(Text("Registration Form"))
        }
    }
}

#if DEBUG
struct AccessTokenPage_Previews: PreviewProvider {
    static var previews: some View {
        AccessTokenPage()
    }
}
#endif
