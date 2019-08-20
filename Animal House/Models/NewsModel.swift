/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation

struct NewsModel : Codable, Identifiable {
    
    var id = UUID()
	let image : String?
	let _id : String?
	let title : String?
	let content : String?
	let creationDate : String?
    let formatedDate: String?
    
	enum CodingKeys: String, CodingKey {
		case image = "image"
		case _id = "_id"
		case title = "title"
		case content = "content"
		case creationDate = "creationDate"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		creationDate = try values.decodeIfPresent(String.self, forKey: .creationDate)
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormater.date(from: creationDate!)
        dateFormater.dateFormat = "E dd MMM yyyy"
        self.formatedDate = dateFormater.string(from: date!)
	}

}