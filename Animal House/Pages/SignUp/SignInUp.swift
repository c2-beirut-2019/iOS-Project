//
//  SignInUp.swift
//  Animal House
//
//  Created by Roy Geagea on 8/28/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct SignInUp: View {
    
    @EnvironmentObject var entry: Entry
    @State var selection: Int? = nil

    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: CredentialsPage(viewModel: CredentialsPageViewModel(type: self.entry.credentialsType)), tag: 1, selection: self.$selection) {
                RoundedButton(title: "SignIn", isDisabled: false, action: {
                    if self.entry.isDoctor {
                        self.entry.credentialsType = CredentialsPageType.doctorLogin
                    }
                    else {
                        self.entry.credentialsType = CredentialsPageType.userLogin
                    }
                    self.selection = 1
                })
                .padding(.vertical, 10)
            }
            NavigationLink(destination: AccessTokenPage(), tag: 2, selection: self.$selection) {
                RoundedButton(title: "SignUp", isDisabled: false, action: {
                    if self.entry.isDoctor {
                        self.entry.credentialsType = CredentialsPageType.doctorSignup
                    }
                    else {
                        self.entry.credentialsType = CredentialsPageType.userSignup
                    }
                    self.selection = 2
                })
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
    }
}

struct SignInUp_Previews: PreviewProvider {
    static var previews: some View {
        SignInUp()
    }
}
