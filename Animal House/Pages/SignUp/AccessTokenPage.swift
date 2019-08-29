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
                    NavigationLink(destination: CredentialsPage(viewModel: CredentialsPageViewModel(type: self.entry.credentialsType)), tag: 1, selection: self.$selection) {
                        Button(action: {
                            self.entry.accessToken = self.accessToken
                            self.selection = 1
                        }) {
                                    Text("Continue")
                                }
                    }
                    Spacer()
                }

            }
        }
        .navigationBarTitle(Text("Registration Form"), displayMode: .large)
    }
}

#if DEBUG
struct AccessTokenPage_Previews: PreviewProvider {
    static var previews: some View {
        AccessTokenPage()
    }
}
#endif
