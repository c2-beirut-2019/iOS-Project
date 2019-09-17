/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct AppointmentModel: Codable {
    
	let _id : String?
	let is_confirmed : Bool?
	let startDate : String?
	let endDate : String?
	let doctor : String?
	let doctor_id : String?
	let doctor_firstName : String?
	let doctor_lastName : String?
	let doctor_name : String?
	let user_id : String?
	let user_firstName : String?
	let user_lastName : String?
	let user_name : String?
	let doctor_speciality : String?
	let pet : String?
	let pet_id : String?
	let pet_name : String?
	let pet_image : String?
	let appointmentType : String?
	let appointmentType_id : String?
	let appointmentType_name : String?

	enum CodingKeys: String, CodingKey {
		case _id = "_id"
		case is_confirmed = "is_confirmed"
		case startDate = "startDate"
		case endDate = "endDate"
		case doctor = "doctor"
		case doctor_id = "doctor_id"
		case doctor_firstName = "doctor_firstName"
		case doctor_lastName = "doctor_lastName"
		case doctor_name = "doctor_name"
		case user_id = "user_id"
		case user_firstName = "user_firstName"
		case user_lastName = "user_lastName"
		case user_name = "user_name"
		case doctor_speciality = "doctor_speciality"
		case pet = "pet"
		case pet_id = "pet_id"
		case pet_name = "pet_name"
		case pet_image = "pet_image"
		case appointmentType = "appointmentType"
		case appointmentType_id = "appointmentType_id"
		case appointmentType_name = "appointmentType_name"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		is_confirmed = try values.decodeIfPresent(Bool.self, forKey: .is_confirmed)
		startDate = try values.decodeIfPresent(String.self, forKey: .startDate)
		endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
		doctor = try values.decodeIfPresent(String.self, forKey: .doctor)
		doctor_id = try values.decodeIfPresent(String.self, forKey: .doctor_id)
		doctor_firstName = try values.decodeIfPresent(String.self, forKey: .doctor_firstName)
		doctor_lastName = try values.decodeIfPresent(String.self, forKey: .doctor_lastName)
		doctor_name = try values.decodeIfPresent(String.self, forKey: .doctor_name)
		user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
		user_firstName = try values.decodeIfPresent(String.self, forKey: .user_firstName)
		user_lastName = try values.decodeIfPresent(String.self, forKey: .user_lastName)
		user_name = try values.decodeIfPresent(String.self, forKey: .user_name)
		doctor_speciality = try values.decodeIfPresent(String.self, forKey: .doctor_speciality)
		pet = try values.decodeIfPresent(String.self, forKey: .pet)
		pet_id = try values.decodeIfPresent(String.self, forKey: .pet_id)
		pet_name = try values.decodeIfPresent(String.self, forKey: .pet_name)
		pet_image = try values.decodeIfPresent(String.self, forKey: .pet_image)
		appointmentType = try values.decodeIfPresent(String.self, forKey: .appointmentType)
		appointmentType_id = try values.decodeIfPresent(String.self, forKey: .appointmentType_id)
		appointmentType_name = try values.decodeIfPresent(String.self, forKey: .appointmentType_name)
	}

}
