//
//  CredentialsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct CredentialsPage: View {
    
    @EnvironmentObject var entry: Entry
    @ObservedObject var viewModel: CredentialsPageViewModel

    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var isPass: Int? = nil
    
    var body: some View {
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
                            if self.entry.credentialsType == .userLogin || self.entry.credentialsType == .doctorLogin {
                                self.viewModel.login(username: self.userName, password: self.password)
                            }
                            else {
                                self.viewModel.createUser(accessCode: self.entry.accessToken, username: self.userName, password: self.password)
                            }
                        }
                            }) {
                                Text("Continue")
                            }
                    Spacer()
                }
            }
        }
        .onReceive(self.viewModel.objectWillChange) { (session) in
            UserDefaultsManager.shared.setUserLoggedIn(isLogged: true)
            UserDefaultsManager.shared.setAuthToken(token: session.access_token!)
            let tabView = AHTabbedView().environmentObject(self.entry)
            UIApplication.shared.windows[0].setRootView(rootView: tabView)
        }
        .navigationBarTitle(Text(self.viewModel.title), displayMode: .large)
    }
}

#if DEBUG
struct CredentialsPage_Previews: PreviewProvider {
    static var previews: some View {
        CredentialsPage(viewModel: CredentialsPageViewModel(type: CredentialsPageType.userLogin))
    }
}
#endif
