//
//  AHTabbedView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/14/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct AHTabbedView: View {
    @State private var selection = 1
     
     var body: some View {
            TabView {
                ListPage()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
                ListPage()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
            }
     }
}

#if DEBUG
struct AHTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        AHTabbedView()
    }
}
#endif
