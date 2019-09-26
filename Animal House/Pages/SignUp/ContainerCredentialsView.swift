//
//  ContainerCredentialsView.swift
//  Animal House
//
//  Created by Roy Geagea on 9/26/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ContainerCredentialsView: View {
    
    @EnvironmentObject var entry: Entry

    var body: some View {
        VStack {
            if self.entry.isLogin {
                CredentialsPage(viewModel: CredentialsPageViewModel(type: self.entry.credentialsType))
            }
            else {
                AccessTokenPage(viewModel: AccessTokenViewViewModel(type: self.entry.isDoctor ? AccessTokenType.doctor : AccessTokenType.client))
            }
        }
    }
}

struct ContainerCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerCredentialsView()
    }
}
