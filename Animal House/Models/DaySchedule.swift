/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct DaySchedule : Codable {
    
	let _id : String?
	let day : Int?
	let day_name : String?
	let from_time : String?
	let to_time : String?
	let from_time_formated : String?
	let to_time_formated : String?

	enum CodingKeys: String, CodingKey {
		case _id = "_id"
		case day = "day"
		case day_name = "day_name"
		case from_time = "from_time"
		case to_time = "to_time"
		case from_time_formated = "from_time_formated"
		case to_time_formated = "to_time_formated"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		day = try values.decodeIfPresent(Int.self, forKey: .day)
		day_name = try values.decodeIfPresent(String.self, forKey: .day_name)
		from_time = try values.decodeIfPresent(String.self, forKey: .from_time)
		to_time = try values.decodeIfPresent(String.self, forKey: .to_time)
		from_time_formated = try values.decodeIfPresent(String.self, forKey: .from_time_formated)
		to_time_formated = try values.decodeIfPresent(String.self, forKey: .to_time_formated)
	}

}
