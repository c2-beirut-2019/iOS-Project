//
//  AccessTokenViewViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/5/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

enum AccessTokenType {
    case client
    case doctor
}

class AccessTokenViewViewModel: ObservableObject {

    var type: AccessTokenType!
    
    var title: String {
        return "Registration Form"
    }

    var didAppear = false

    let objectWillChange = PassthroughSubject<Void, Never>()

    var emptyResponse: EmptyResponse? {
        didSet {
            objectWillChange.send()
        }
    }
    
    var isLoading: Bool = false

    var sut: Future<EmptyResponse, Error>?
    var cancellable: AnyCancellable?

    //MARK: - Setup
    
    init(type: AccessTokenType) {
        self.type = type
    }

    // MARK: - APIs
    
    func validateCode(code: String) {
        self.isLoading = true

        if self.type == AccessTokenType.client {
            self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.validateAccessCode(code: code))
        }
        else {
            self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorProfileApi.validateAccessCode(code: code))
        }

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { emptyResponse in
            self.emptyResponse = emptyResponse
        })
    }
    
    func isValidInput(code: String) -> Bool {
        return code.count == 6
    }
    
}

