//
//  CredentialsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct CredentialsPage: View {
    
    @State private var userName: String = ""
    @State private var password: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Username")) {
                    TextField("Enter here", text: $userName)
                }
                Section(header: Text("Password")) {
                    TextField("Enter here", text: $password)
                }
                Section {
                    HStack(alignment: .center) {
                        Spacer()
                        Button(action: {
                                    print("register account")
                                }) {
                                    Text("Confirm")
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
struct CredentialsPage_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsPage()
    }
}
#endif
