//
//  ProfileImageView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/25/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ProfileImageView: View {
    
    var localImage: Image?

    var body: some View {
        localImage!
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
