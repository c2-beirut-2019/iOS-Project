//
//  DoctorProfilePageViewModel.swift
//  Animal House
//
//  Created by Roy Geagea on 9/5/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import SwiftUI
import Combine

class DoctorPageViewModel: ObservableObject {
    
    var title = "My Profile"

    var didAppear = false

    let objectWillChange = PassthroughSubject<DoctorProfile, Never>()

    var profileImage: Image? = nil {
        didSet {
            
        }
    }

    var doctorProfile: DoctorProfile? {
        didSet {
            objectWillChange.send(self.doctorProfile!)
        }
    }
    
    var isLoading: Bool = false

    var sut: Future<DoctorProfile, Error>?
    var cancellable: AnyCancellable?

    //MARK: - Setup
    
    init() {

    }

    // MARK: - APIs

    func getProfile() {
        self.isLoading = true

        self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorProfileApi.getProfile)

        self.cancellable = sut!
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
            if case let .failure(error) = completion {
                print(error)
            }
            self.isLoading = false
            self.cancellable?.cancel()
        }, receiveValue: { userProfile in
            self.doctorProfile = userProfile
        })
    }
    
    func updateProfile(firstName: String, lastName: String, mobileNumber: String, avatar: UIImage? = nil) {
        let queue = OperationQueue()
        self.isLoading = true

        let dict: NSMutableDictionary = ["firstName": firstName, "lastName": lastName, "phoneNumber": mobileNumber]
        queue.addOperation {
            if avatar != nil {
                let imageDict = ["extension": "jpeg", "name": "profile-avatar-test", "data": avatar!.resizedTo1MB()?.pngData()?.base64EncodedString()]
                dict.setValue(imageDict, forKey: "profilePic")
            }
            
            self.sut = NetworkManager.sharedInstance.request(endPointType: DoctorProfileApi.updateProfile(bodyParameters: dict as! [String : Any]))

            self.cancellable = self.sut!
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { completion in
                if case let .failure(error) = completion {
                    print(error)
                }
                self.isLoading = false
                self.cancellable?.cancel()
            }, receiveValue: { userProfile in
                self.doctorProfile = userProfile
            })
        }
    }
    
    func validateProfileInput(firstName: String, lastName: String, mobileNumber: String) -> Bool {
        if firstName.count < 3 {
            return false
        }
        else if lastName.count < 3 {
            return false
        }
        else if mobileNumber.count != 8 {
            return false
        }
        return true
    }
    
}

extension DoctorPageViewModel {
    
    var avatar: String {
        return self.doctorProfile?.profilePic ?? ""
    }
    
    var userName: String {
        return self.doctorProfile?.username ?? ""
    }
    
    var firstName: String {
        return self.doctorProfile?.firstName ?? ""
    }
    
    var lastName: String {
        return self.doctorProfile?.lastName ?? ""
    }
    
    var mobileNumber: String {
        return self.doctorProfile?.phoneNumber ?? ""
    }
    
    var speciality: String {
        return self.doctorProfile?.speciality ?? ""
    }
    
    var diploma: String {
        return self.doctorProfile?.diplomas ?? ""
    }
    
}

