//
//  LineInfoView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/13/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct LineInfoView: View {
    
    var key: String!
    var value: String!
    
    var body: some View {
        HStack {
            Text(key + ": ")
                .font(.headline)
            Text(value)
                .font(.subheadline)
            Spacer()
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

#if DEBUG
struct LineInfoView_Previews: PreviewProvider {
    static var previews: some View {
        LineInfoView()
    }
}
#endif
