//
//  CredentialsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct CredentialsPage: View {
    
    @ObservedObject var viewModel: CredentialsPageViewModel

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
                            if self.viewModel.isValidInput(username: self.userName, password: self.password) {
                                self.viewModel.login(username: self.userName, password: self.password)
                            }
                                }) {
                                    Text("Continue")
                                }
                        Spacer()
                    }
                }
            }
            .navigationBarTitle(Text(self.viewModel.title))
        }

    }
}

#if DEBUG
struct CredentialsPage_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsPage(viewModel: CredentialsPageViewModel(type: CredentialsPageType.userLogin))
    }
}
#endif
