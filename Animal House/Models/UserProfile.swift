/*
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct UserProfile: Codable {
    
    let isActive : Bool?
    let _id : String?
    let firstName : String?
    let lastName : String?
    let phoneNumber : String?
    let referredBy : String?
    let emergencyPerson : String?
    let emergencyNumber : String?
    let registrationDate : String?
    let password : String?
    let username : String?
    let lastLoginDate : String?
    let dateOfBirth : String?
    let profilePic : String?

    enum CodingKeys: String, CodingKey {

        case isActive = "isActive"
        case _id = "_id"
        case firstName = "firstName"
        case lastName = "lastName"
        case phoneNumber = "phoneNumber"
        case referredBy = "referredBy"
        case emergencyPerson = "emergencyPerson"
        case emergencyNumber = "emergencyNumber"
        case registrationDate = "registrationDate"
        case password = "password"
        case username = "username"
        case lastLoginDate = "lastLoginDate"
        case dateOfBirth = "dateOfBirth"
        case profilePic = "profilePic"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isActive = try values.decodeIfPresent(Bool.self, forKey: .isActive)
        _id = try values.decodeIfPresent(String.self, forKey: ._id)
        firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
        lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
        phoneNumber = try values.decodeIfPresent(String.self, forKey: .phoneNumber)
        referredBy = try values.decodeIfPresent(String.self, forKey: .referredBy)
        emergencyPerson = try values.decodeIfPresent(String.self, forKey: .emergencyPerson)
        emergencyNumber = try values.decodeIfPresent(String.self, forKey: .emergencyNumber)
        registrationDate = try values.decodeIfPresent(String.self, forKey: .registrationDate)
        password = try values.decodeIfPresent(String.self, forKey: .password)
        username = try values.decodeIfPresent(String.self, forKey: .username)
        lastLoginDate = try values.decodeIfPresent(String.self, forKey: .lastLoginDate)
        dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
        profilePic = try values.decodeIfPresent(String.self, forKey: .profilePic)
    }

}
