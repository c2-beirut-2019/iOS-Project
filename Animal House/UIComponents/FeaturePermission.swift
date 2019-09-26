//
//  FeaturePermission.swift
//  Animal House
//
//  Created by Roy Geagea on 9/26/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct FeaturePermission: View {
    
    var body: some View {
        VStack(alignment: .center) {
            RoundedButton(title: "Login to use this feature", isDisabled: false) {
                AppDelegate.sharedDelegate().logout()
            }
        }
        .padding(.vertical, 100)
    }
}

struct FeaturePermission_Previews: PreviewProvider {
    static var previews: some View {
        FeaturePermission()
    }
}
