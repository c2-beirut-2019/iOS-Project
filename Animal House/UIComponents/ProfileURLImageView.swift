//
//  ProfileImageView.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import URLImage

struct ProfileURLImageView: View {
    
    var serverImage: String?
    var localImage: Image?
    
    var body: some View {
        URLImage(URL(string: serverImage!) ?? URL(string: "https://www.apple.com")!, placeholder: Image("profilepic").resizable(capInsets: .init(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch))
        .frame(width: 100, height: 100, alignment: .center)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct ProfileURLImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileURLImageView(serverImage: "https://s3.eu-west-1.amazonaws.com/animal-house-s3/animalHouse/image1_1566514022072_iZWFu.png")
    }
}
#endif
