//
//  NewPage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/12/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct NewDetailsPage: View {
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: UIImage(imageLiteralResourceName: "test.jpeg"))
                VStack(alignment: .trailing) {
                    Text("date")
                    .padding(10)
                }
                VStack(alignment: .leading) {
                    Text("Title")
                    .font(.headline)
                    Text("content")
                    .font(.subheadline)
                }
                Spacer()
            }
        }
    }
}

#if DEBUG
struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        NewDetailsPage()
    }
}
#endif
