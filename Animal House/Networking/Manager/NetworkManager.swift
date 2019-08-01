//
//  NetworkManager.swift
//  Kodmus
//
//  Created by Roy Geagea on 4/26/19.
//  Copyright © 2019 KODMUS. All rights reserved.
//

import Foundation

enum BaseUrl: String {
    case development = "https://api.animalhouse.dev/"
    case production = "https://api.animalhouse.prod/"
}

enum NetworkResponse: String {
    case success
    case noData = "Response returned with no data."
    case failed = "Network request failed."
    case unableToDecode = "We could not understand the returned data."
    case unknownError = "Unknown Error"
}

enum Result<String> {
    case success
    case fourHundredErrorCode
    case failure(String)
}

let noDataErrorCode = -1
let failedErrorCode = -2
let unProcessedCall = 400
let unabletoDecodeErrorCode = -3

class NetworkManager: NSObject {
    static let baseUrl : BaseUrl = .production

    class var sharedInstance: NetworkManager {
        struct Singleton {
            static let instance = NetworkManager()
        }
        return Singleton.instance
    }
    
    override init() {
        super.init()
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 400 : return.fourHundredErrorCode
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
