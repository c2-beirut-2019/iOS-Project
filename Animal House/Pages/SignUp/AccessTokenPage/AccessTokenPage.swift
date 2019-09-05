//
//  AccessTokenPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AccessTokenPage: View {
    
    @EnvironmentObject var entry: Entry
    @ObservedObject var viewModel: AccessTokenViewViewModel

    @State private var accessToken: String = ""
    @State var selection: Int? = nil
    
    var body: some View {
        Form {
            Section(header: Text("Access Token")) {
                TextField("Enter here", text: $accessToken)
            }
            Section {
                HStack(alignment: .center) {
                    Spacer()
                        Button(action: {
                            self.entry.accessToken = self.accessToken
//                            self.selection = 1
                            self.viewModel.validateCode(code: self.accessToken)
                        }) {
                                    Text("Continue")
                    }
                    .disabled(!self.viewModel.isValidInput(code: accessToken))
                    Spacer()
                }
            }
            NavigationLink(destination: CredentialsPage(viewModel: CredentialsPageViewModel(type: self.entry.credentialsType)), tag: 1, selection: self.$selection) {
                Spacer()
            }
        }
        .onReceive(self.viewModel.objectWillChange) { (emptyResponse) in
            self.selection = 1
        }
        .navigationBarTitle(Text("Registration Form"), displayMode: .large)
    }
}

#if DEBUG
struct AccessTokenPage_Previews: PreviewProvider {
    static var previews: some View {
        AccessTokenPage(viewModel: AccessTokenViewViewModel(type: AccessTokenType.client))
    }
}
#endif
