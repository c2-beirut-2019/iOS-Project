//
//  ProfilePageViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 8/23/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class ProfilePageViewModel: ObservableObject {

    var title = "My Profile"

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
    
    init() {
        
    }

    // MARK: - APIs

    func getProfile() {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.getProfile)

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
    
    func updateProfile(firstName: String, lastName: String, mobileNumber: String, dob: Date, emergencyPerson: String, emergencyNumber: String, avatar: UIImage? = nil) {
        let queue = OperationQueue()
        self.isLoading = true

        let dict: NSMutableDictionary = ["firstName": firstName, "lastName": lastName, "phoneNumber": mobileNumber, "dateOfBirth": dob.animalHouseDate(), "emergencyPerson": emergencyPerson, "emergencyNumber": emergencyNumber]
        queue.addOperation {
            if avatar != nil {
                let imageDict = ["extension": "jpeg", "name": "profile-avatar-test", "data": avatar!.resizedTo1MB()?.pngData()?.base64EncodedString()]
                dict.setValue(imageDict, forKey: "profilePic")
            }
            
            self.sut = NetworkManager.sharedInstance.request(endPointType: UserProfileApi.updateProfile(bodyParameters: dict as! [String : Any]))

            self.cancellable = self.sut!
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
    }
    
    func validateProfileInput(firstName: String, lastName: String, mobileNumber: String, emergencyPerson: String, emergencyNumber: String) -> Bool {
        if firstName.count < 3 {
            return false
        }
        else if lastName.count < 3 {
            return false
        }
        else if mobileNumber.count != 8 {
            return false
        }
        else if emergencyPerson.count < 3 {
            return false
        }
        else if emergencyNumber.count != 8 {
            return false
        }
        return true
    }
    
}

extension ProfilePageViewModel {
    
    var avatar: String {
        return self.userProfile?.profilePic ?? ""
    }
    
    var userName: String {
        return self.userProfile?.username ?? ""
    }
    
    var firstName: String {
        return self.userProfile?.firstName ?? ""
    }
    
    var lastName: String {
        return self.userProfile?.lastName ?? ""
    }
    
    var mobileNumber: String {
        return self.userProfile?.phoneNumber ?? ""
    }
    
    var birthDate: Date {
        return (self.userProfile?.dateOfBirth?.animalHouseDate())!
    }
    
    var emegencyPerson: String {
        return self.userProfile?.emergencyPerson ?? ""
    }
    
    var emegencyPersonPhoneNumber: String {
        return self.userProfile?.emergencyNumber ?? ""
    }
    
}

