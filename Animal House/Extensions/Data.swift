//
//  Data.swift
//  Animal House
//
//  Created by Roy Geagea on 8/2/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation

extension NSMutableData {
    
    /// Append string to Data
    ///
    /// Rather than littering my code with calls to `data(using: .utf8)` to convert `String` values to `Data`, this wraps it in a nice convenient little extension to Data. This defaults to converting using UTF-8.
    ///
    /// - parameter string:       The string to be added to the `Data`.
    
    func appendString(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
    
    func convertToBase64() -> String {
        //Encode to base64
        let myBase64Data = self.base64EncodedData(options: NSData.Base64EncodingOptions.endLineWithLineFeed)

        //Decode base64
        let resultData = NSData(base64Encoded: myBase64Data, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)!

        //Convert NSData to NSString
        let resultNSString = NSString(data: resultData as Data, encoding: String.Encoding.utf8.rawValue)!

        //Convert NSString to String
        let resultString = resultNSString as String
        return resultString
    }
    
}
