//
//  ProfilePage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        NavigationView {
            Form {
                ProfileImageView()
                Section() {
                    InputTextField(placeholder: "First Name", value: "")
                    InputTextField(placeholder: "Last Name", value: "")
                }
                Section() {
                    PhoneNumberTextField()
                }
                Section(header: Text("Date of birth")) {
                    CustomDatePicker()
                }
                Section(header: Text("Emergency Informations")) {
                    InputTextField(placeholder: "Emergency Person", value: "")
                    PhoneNumberTextField()
                }
            }
            .navigationBarTitle(Text("Profile"))
        }
    }
}

#if DEBUG
struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
#endif
