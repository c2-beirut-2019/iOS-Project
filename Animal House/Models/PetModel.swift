/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct PetModel: Codable {
    
	let _id : String?
	let name : String?
	let image : String?
	let color : String?
	let dateOfBirth : String?
	let registrationDate : String?
	let category_name : String?
	let category_id : String?
	let specie_name : String?
	let specie_id : String?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case name = "name"
		case image = "image"
		case color = "color"
		case dateOfBirth = "dateOfBirth"
		case registrationDate = "registrationDate"
		case category_name = "category_name"
		case category_id = "category_id"
		case specie_name = "specie_name"
		case specie_id = "specie_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		dateOfBirth = try values.decodeIfPresent(String.self, forKey: .dateOfBirth)
		registrationDate = try values.decodeIfPresent(String.self, forKey: .registrationDate)
		category_name = try values.decodeIfPresent(String.self, forKey: .category_name)
		category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
		specie_name = try values.decodeIfPresent(String.self, forKey: .specie_name)
		specie_id = try values.decodeIfPresent(String.self, forKey: .specie_id)
	}

}
