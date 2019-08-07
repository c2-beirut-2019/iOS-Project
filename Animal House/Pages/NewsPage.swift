//
//  NewsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct NewsPage: View {
    var body: some View {
        NavigationView {
            List {
                 NewsView()
                 NewsView()
             }
            .navigationBarTitle(Text("News"))
        }
    }
}

#if DEBUG
struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage()
    }
}
#endif
