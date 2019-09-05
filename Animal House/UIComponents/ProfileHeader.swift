//
//  ProfileHeader.swift
//  Animal House
//
//  Created by Roy Geagea on 9/5/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ProfileHeader: View {
    
    @Binding var finalImage: Image?
    @Binding var showImagePicker: Bool
    var avatar: String = ""
    var userName: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            if self.finalImage != nil {
                ProfileImageView(localImage: self.finalImage)
                .onTapGesture {
                    self.showImagePicker.toggle()
                }
            }
            else {
                ProfileURLImageView(serverImage: self.avatar)
                .onTapGesture {
                    self.showImagePicker.toggle()
                }
            }
            Text(self.userName)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal, 15)
        }
    }
}

//struct ProfileHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeader()
//    }
//}
