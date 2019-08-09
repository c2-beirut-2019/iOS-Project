//
//  NewsPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ListPage: View {
    var body: some View {
        NavigationView {
            List {
                 NewsCellView()
                 NewsCellView()
                 DoctorCellView()
                 DoctorCellView()
             }
            .navigationBarTitle(Text("News"))
        }
    }
}

#if DEBUG
struct ListPage_Previews: PreviewProvider {
    static var previews: some View {
        ListPage()
    }
}
#endif
