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
        NavigationView {
            VStack(alignment: .center) {
                Image("heartPaw")
                    .resizable()
                    .frame(width: 150, height: 115, alignment: .center)
                    .aspectRatio(1, contentMode: .fill)
                Text(AppConfig.appName)
                    .font(.largeTitle)
                    .foregroundColor(.green)
                Spacer()
                NavigationLink(destination: ChooseUserPage(), tag: 1, selection: self.$selection) {
                    RoundedButton(title: "Sign In", isDisabled: false, action: {
                        self.entry.isLogin = true
                        self.selection = 1
                    })
                }
                NavigationLink(destination: ChooseUserPage(), tag: 2, selection: self.$selection) {
                    RoundedButton(title: "Sign Up", isDisabled: false, action: {
                        self.entry.isLogin = false
                        self.selection = 2
                    })
                }
                Button(action: {
                    let tabView = AHTabbedView()
                    UIApplication.shared.windows[0].setRootView(rootView: tabView)
                }) {
                    ZStack(alignment: .center) {
                        HStack {
                            Spacer()
                            Text("SKIP")
                            .font(.headline)
                                .foregroundColor(.gray)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 10.0)
                            Spacer()
                        }
                    }
                }
                .cornerRadius(8.0)
                .frame(height: 48)
                .padding(.horizontal, 24)
            }
        }
    }
}

struct SignInUp_Previews: PreviewProvider {
    static var previews: some View {
        SignInUp()
    }
}
