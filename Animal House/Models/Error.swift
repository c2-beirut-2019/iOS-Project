/*
 Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation

let AUTHENTICATION_FAILED = "AUTHENTICATION_FAILED"

class Error400: Error, Codable {
    
    let field : [String]?
    let location : String?
    let messages : [String]?
    let types : [String]?

    enum CodingKeys: String, CodingKey {

        case field = "field"
        case location = "location"
        case messages = "messages"
        case types = "types"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        field = try values.decodeIfPresent([String].self, forKey: .field)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        messages = try values.decodeIfPresent([String].self, forKey: .messages)
        types = try values.decodeIfPresent([String].self, forKey: .types)
    }
    
}

class ErrorModal: Error, Codable {
    
    let error : [Error400]?
    
    enum CodingKeys: String, CodingKey {
        case error = "errors"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        error = try values.decodeIfPresent([Error400].self, forKey: .error)
    }
    
}

