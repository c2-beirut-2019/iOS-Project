//
//  ChooseUserPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

struct ChooseUserPage: View {
    
    @EnvironmentObject var entry: Entry
    @State var selection: Int? = nil

    var body: some View {
        VStack(alignment: .center) {
            NavigationLink(destination: ContainerCredentialsView(), tag: 1, selection: self.$selection) {
                RoundedButton(title: "Doctor", isDisabled: false, action: {
                    self.entry.isDoctor = true
                    
                    if self.entry.isLogin {
                        self.entry.credentialsType = CredentialsPageType.doctorLogin
                    }
                    else {
                        self.entry.credentialsType = CredentialsPageType.doctorSignup
                    }
                    
                    self.selection = 1
                })
                .padding(.vertical, 10)
            }
            NavigationLink(destination: ContainerCredentialsView(), tag: 2, selection: self.$selection) {
                RoundedButton(title: "Client", isDisabled: false, action: {
                    self.entry.isDoctor = false
                    
                    if self.entry.isLogin {
                        self.entry.credentialsType = CredentialsPageType.userLogin
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

#if DEBUG
struct ChooseUserPage_Previews: PreviewProvider {
    static var previews: some View {
        ChooseUserPage()
    }
}
#endif
