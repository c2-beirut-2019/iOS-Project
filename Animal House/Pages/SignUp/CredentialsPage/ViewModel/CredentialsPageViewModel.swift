//
//  CredentialsPageViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/26/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

enum CredentialsPageType {
    case userLogin
    case userSignup
    case doctorLogin
    case doctorSignup
}

class CredentialsPageViewModel: ObservableObject {

    var type: CredentialsPageType!
    
    var title: String {
        if type == CredentialsPageType.userLogin || type == CredentialsPageType.doctorLogin {
            return "Login"
        }
        else {
            return "Sign Up"
        }
    }

    var didAppear = false

    let objectWillChange = PassthroughSubject<Session, Never>()

    var profileImage: Image? = nil {
        didSet {
            
        }
    }

    var session: Session? {
        didSet {
            objectWillChange.send(self.session!)
        }
    }
    
    var isLoading: Bool = false

    var sut: Future<Session, Error>?
    var cancellable: AnyCancellable?

    //MARK: - Setup
    
    init(type: CredentialsPageType) {
        self.type = type
    }

    // MARK: - APIs

    func createUser(accessCode: String, username: String, password: String) {
        self.isLoading = true
        
        if self.type == CredentialsPageType.doctorSignup {
            self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorProfileApi.createDoctor(accessCode: accessCode, username: username, password: password))
        }
        else {
            self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.createUser(accessCode: accessCode, username: username, password: password))
        }

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { session in
            self.session = session
        })
    }
    
    func login(username: String, password: String) {
        self.isLoading = true

        if self.type == CredentialsPageType.doctorLogin {
            self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorProfileApi.login(username: username, password: password))
        }
        else {
            self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.login(username: username, password: password))
        }

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { session in
            self.session = session
        })
    }
    
    func isValidInput(username: String, password: String) -> Bool {
        if username.count < 3 {
            return false
        }
        else if password.count < 6 {
            return false
        }
        return true
    }
    
}

