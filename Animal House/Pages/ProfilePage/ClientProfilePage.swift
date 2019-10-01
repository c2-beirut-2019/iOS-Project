//
//  ProfilePage.swift
//  Animal House
//
//  Created by Roy Geagea on 8/10/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct ClientProfilePage: View {
    
    @ObservedObject var viewModel: ProfilePageViewModel

    @State var showImagePicker: Bool = false
    @State var showImageEditor: Bool = false
    @State var chosenimage: UIImage? = nil
    @State var finalImage: Image? = nil
    @State var isButtonLoading: Bool = false
    
    @State var isValidData = true
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var mobileNumber: String = ""
    @State var dateOfBirth: Date = Date()
    @State var emergencyPerson: String = ""
    @State var emergencyNumber: String = ""

    var body: some View {
        ZStack {
            NavigationView {
                if UserDefaultsManager.shared.isUserLoggedIn() {
                    Form {
                        Section() {
                            ProfileHeader(finalImage: self.$finalImage, showImagePicker: self.$showImagePicker, avatar: self.viewModel.avatar, userName: self.viewModel.userName)
                        }
                        Section() {
                            InputTextField(placeholder: "First Name", value: $firstName)
                            InputTextField(placeholder: "Last Name", value: $lastName)
                        }
                        Section() {
                            PhoneNumberTextField(mobileNumber: $mobileNumber)
                        }
                        Section(header: Text("Date of birth")) {
                            CustomDatePicker(birthDate: $dateOfBirth)
                        }
                        Section(header: Text("Emergency Informations")) {
                            InputTextField(placeholder: "Emergency Person", value: $emergencyPerson)
                            PhoneNumberTextField(mobileNumber: $emergencyNumber)
                        }
                        RoundedButton(title: "Save", isDisabled: !self.viewModel.validateProfileInput(firstName: self.firstName, lastName: self.lastName, mobileNumber: self.mobileNumber, emergencyPerson: self.emergencyPerson, emergencyNumber: self.emergencyNumber), isLoading: self.isButtonLoading, action: {
                            self.isButtonLoading = true
                            self.viewModel.updateProfile(firstName: self.firstName, lastName: self.lastName, mobileNumber: self.mobileNumber, dob: self.dateOfBirth, emergencyPerson: self.emergencyPerson, emergencyNumber: self.emergencyNumber, avatar: self.finalImage != nil ? self.chosenimage : nil)
                        })
                    }
                    .navigationBarTitle(self.viewModel.title)
                    .navigationBarItems(trailing:
                        Button(action: {
                            AppDelegate.sharedDelegate().logout()
                        }) {
                            Text("Logout").bold()
                        })
                    .onReceive(self.viewModel.objectWillChange) { (userProfile) in
                        self.isButtonLoading = false
                        
                        self.firstName = self.viewModel.firstName
                        self.lastName = self.viewModel.lastName
                        self.mobileNumber = self.viewModel.mobileNumber
                        self.dateOfBirth = self.viewModel.birthDate
                        self.emergencyPerson = self.viewModel.emegencyPerson
                        self.emergencyNumber = self.viewModel.emegencyPersonPhoneNumber
                    }
                    .sheet(isPresented: $showImageEditor, content: {
                        RGImageEditor(isShown: self.$showImageEditor, inputImage: self.chosenimage, outputImage: self.$finalImage).edgesIgnoringSafeArea(.all)
                    })
                }
                else {
                    FeaturePermission()
                    Spacer()
                }
            }
            .onAppear {
                guard !self.viewModel.didAppear else {
                    return
                }
                self.viewModel.didAppear = true
                if UserDefaultsManager.shared.isUserLoggedIn() {
                    self.viewModel.getProfile()
                }
            }
            .sheet(isPresented: $showImagePicker, content: {
                RGImagePicker(isShown: self.$showImagePicker, isShowEditor: self.$showImageEditor, image: self.$chosenimage).edgesIgnoringSafeArea(.all)
            })
        }
    }
}

#if DEBUG
struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ClientProfilePage(viewModel: ProfilePageViewModel())
    }
}
#endif
