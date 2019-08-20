//
//  LoadingRow.swift
//  Animal House
//
//  Created by Roy Geagea on 8/7/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct LoadingRow : View {
    @State var isLoading: Bool

    var body: some View {
        HStack {
            Spacer()
            LoadingView(isLoading: isLoading)
            Spacer()
        }
    }
}

#if DEBUG
struct LoadingRow_Previews : PreviewProvider {
    static var previews: some View {
        LoadingRow(isLoading: true)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
#endif
