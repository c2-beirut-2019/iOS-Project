/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct ProductModel: Codable {
    
	let _id : String?
	let colorsAvailable : [String]?
	let images : [String]?
	let title : String?
	let description : String?
	let price : Int?
	let quantityAvailable : Int?
	let createDate : String?

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case colorsAvailable = "colorsAvailable"
		case images = "images"
		case title = "title"
		case description = "description"
		case price = "price"
		case quantityAvailable = "quantityAvailable"
		case createDate = "createDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		colorsAvailable = try values.decodeIfPresent([String].self, forKey: .colorsAvailable)
		images = try values.decodeIfPresent([String].self, forKey: .images)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		price = try values.decodeIfPresent(Int.self, forKey: .price)
		quantityAvailable = try values.decodeIfPresent(Int.self, forKey: .quantityAvailable)
		createDate = try values.decodeIfPresent(String.self, forKey: .createDate)
	}

}
