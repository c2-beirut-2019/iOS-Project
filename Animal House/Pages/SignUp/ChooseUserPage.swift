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
            NavigationLink(destination: SignInUp(), tag: 1, selection: self.$selection) {
                RoundedButton(title: "Doctor", isDisabled: false, action: {
                    self.entry.isDoctor = true
                    self.selection = 1
                })
                .padding(.vertical, 10)
            }
            NavigationLink(destination: SignInUp(), tag: 2, selection: self.$selection) {
                RoundedButton(title: "Client", isDisabled: false, action: {
                    self.entry.isDoctor = false
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
