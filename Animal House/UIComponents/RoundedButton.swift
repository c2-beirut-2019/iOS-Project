//
//  RoundedButton.swift
//  Animal House
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct RoundedButton : View {
    
    let title: String!
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text(self.title)
                .font(.headline)
                .foregroundColor(Color.white)
                .padding(.horizontal, 50)
                .padding(.vertical, 10.0)
                Spacer()
            }
        }
        .background(Color.green)
        .cornerRadius(8.0)
        .frame(height: 48)
        .padding(.horizontal, 24)
    }
}

#if DEBUG
struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Preview")
    }
}
#endif
