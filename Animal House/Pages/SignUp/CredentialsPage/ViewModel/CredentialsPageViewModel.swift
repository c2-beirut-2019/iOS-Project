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
    case login
    case signup
}

class CredentialsPageViewModel: ObservableObject {

    var type = CredentialsPageType.login
    
    var title: String {
        type == CredentialsPageType.login ? "Login" : "Sign Up"
    }

    var didAppear = false

    let objectWillChange = PassthroughSubject<UserProfile, Never>()

    var profileImage: Image? = nil {
        didSet {
            
        }
    }

    var userProfile: UserProfile? {
        didSet {
            objectWillChange.send(self.userProfile!)
        }
    }
    
    var isLoading: Bool = false

    var sut: Future<UserProfile, Error>?
    var cancellable: AnyCancellable?

    //MARK: - Setup
    
    init(type: CredentialsPageType) {
        self.type = type
    }

    // MARK: - APIs

    func createUser(accessCode: String, username: String, password: String) {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.createUser(accessCode: accessCode, username: username, password: password))

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { userProfile in
            self.userProfile = userProfile
        })
    }
    
    func login(username: String, password: String) {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.login(username: username, password: password))

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { userProfile in
            self.userProfile = userProfile
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

