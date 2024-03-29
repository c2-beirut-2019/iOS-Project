//
//  DoctorProfilePage.swift
//  Animal House
//
//  Created by Roy Geagea on 9/5/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI

struct DoctorProfilePage: View {
    
    @ObservedObject var viewModel: DoctorPageViewModel

    @State var showImagePicker: Bool = false
    @State var showImageEditor: Bool = false
    @State var chosenimage: UIImage? = nil
    @State var finalImage: Image? = nil
    @State var isButtonLoading: Bool = false
    
    @State var isValidData = true
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var mobileNumber: String = ""

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
                        Section(header: Text("Speciality")) {
                            Text(self.viewModel.speciality)
                                .font(.subheadline)
                        }
                        Section(header: Text("Diploma")) {
                            Text(self.viewModel.diploma)
                                .font(.subheadline)
                        }
                        RoundedButton(title: "Save", isDisabled: !self.viewModel.validateProfileInput(firstName: self.firstName, lastName: self.lastName, mobileNumber: self.mobileNumber), isLoading: self.isButtonLoading, action: {
                            self.isButtonLoading = true
                            self.viewModel.updateProfile(firstName: self.firstName, lastName: self.lastName, mobileNumber: self.mobileNumber, avatar: self.finalImage != nil ? self.chosenimage : nil)
                            })
                    }
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
            .navigationBarTitle(self.viewModel.title)
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

struct DoctorProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        DoctorProfilePage(viewModel: DoctorPageViewModel())
    }
}
