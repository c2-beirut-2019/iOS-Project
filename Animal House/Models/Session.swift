/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct Session : Codable {
    
	let firstName : String?
	let lastName : String?
	let username : String?
	let _id : String?
	let access_token : String?
	let expires_in : Int?
	let refresh_token : String?
	let refresh_token_header : String?

	enum CodingKeys: String, CodingKey {

		case firstName = "firstName"
		case lastName = "lastName"
		case username = "username"
		case _id = "_id"
		case access_token = "access_token"
		case expires_in = "expires_in"
		case refresh_token = "refresh_token"
		case refresh_token_header = "refresh_token_header"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		firstName = try values.decodeIfPresent(String.self, forKey: .firstName)
		lastName = try values.decodeIfPresent(String.self, forKey: .lastName)
		username = try values.decodeIfPresent(String.self, forKey: .username)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		access_token = try values.decodeIfPresent(String.self, forKey: .access_token)
		expires_in = try values.decodeIfPresent(Int.self, forKey: .expires_in)
		refresh_token = try values.decodeIfPresent(String.self, forKey: .refresh_token)
		refresh_token_header = try values.decodeIfPresent(String.self, forKey: .refresh_token_header)
	}

}
