//
//  ContentView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct LetsStartPage: View {
    
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: ChooseUserPage(), tag: 1, selection: self.$selection) {
                    RoundedButton(title: "Let's Start", isDisabled: false, action: {
                        self.selection = 1
                    })
                }
                .offset(y: -20)
                .padding(.bottom, 20)
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LetsStartPage()
    }
}
#endif
