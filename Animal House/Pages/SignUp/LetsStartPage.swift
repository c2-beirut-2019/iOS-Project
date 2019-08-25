//
//  ContentView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct LetsStartPage: View {
    var body: some View {
        VStack {
            Spacer()
            RoundedButton(title: "Let's Start", isDisabled: false, action: {})
            .offset(y: -20)
            .padding(.bottom, 20)
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
