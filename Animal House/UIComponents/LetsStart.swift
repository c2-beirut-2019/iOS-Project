//
//  ContentView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct LetsStart: View {
    var body: some View {
        VStack {
            Spacer()
            RoundedButton(title: "Commençons")
            .offset(y: -20)
            .padding(.bottom, 20)
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LetsStart()
    }
}
#endif
