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
    let action: () -> Void
    var isDisabled: Bool = false
    var isLoading: Bool = false
    
    init(title: String, isDisabled: Bool, isLoading: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.action = action
        self.isDisabled = isDisabled
        self.isLoading = isLoading
    }
    
    var body: some View {
        Button(action: self.action) {
            ZStack(alignment: .center) {
                HStack {
                    Spacer()
                    Text(self.title)
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10.0)
                    Spacer()
                }
                if isLoading {
                    RGActivityIndicator(isAnimating: .constant(true), style: .large)
                }
            }
        }
        .background(isDisabled || isLoading ? Color.gray : Color.green)
        .cornerRadius(8.0)
        .frame(height: 48)
        .padding(.horizontal, 24)
        .disabled(self.isDisabled || isLoading)
    }
}

#if DEBUG
struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(title: "Preview", isDisabled: false, action: {})
    }
}
#endif
