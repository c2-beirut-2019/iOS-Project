//
//  NetworkManager.swift
//  Kodmus
//
//  Created by Roy Geagea on 4/26/19.
//  Copyright © 2019 KODMUS. All rights reserved.
//

import Foundation
import Combine

enum BaseUrl: String {
    case development = "http://34.247.71.103:4444/"
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
    static let baseUrl : BaseUrl = .development
    
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
    
    func request<T: Codable, W: EndPointType>(endPointType: W) -> Future<T, Error>  {
        let router = Router<W>()
        return Future { resolver in
            router.request(endPointType) { data, response, error in
                
                if let error = error {
                    return resolver(.failure(error))
                }
                
                if let response = response as? HTTPURLResponse {
                    let result = self.handleNetworkResponse(response)
                    switch result {
                    case .success:
                        guard let responseData = data else {
                            return resolver(.failure(NSError(domain: "", code: noDataErrorCode, userInfo: [NSLocalizedDescriptionKey: NetworkResponse.noData.rawValue])))
                        }
                        do {
                            var emptyString = String(data: responseData, encoding: .utf8)
                            if emptyString == "" {
                                emptyString = "{\"success\": true}"
                                let emptyResponseData = Data(emptyString!.utf8)
                                let apiResponse = try JSONDecoder().decode(T.self, from: emptyResponseData)
                                return resolver(.success(apiResponse))
                            }
                            else {
                                let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                                return resolver(.success(apiResponse))
                            }
                        } catch {
                            print(error)
                            return resolver(.failure(NSError(domain: "", code: unabletoDecodeErrorCode, userInfo: [NSLocalizedDescriptionKey: NetworkResponse.unableToDecode.rawValue])))
                        }
                    case .failure(let networkFailureError):
                        return resolver(.failure(NSError(domain: "", code: failedErrorCode, userInfo:
                        [NSLocalizedDescriptionKey: networkFailureError])))
                    case .fourHundredErrorCode:
                        guard let responseData = data else {
                            return resolver(.failure(NSError(domain: "", code: noDataErrorCode, userInfo: [NSLocalizedDescriptionKey: NetworkResponse.noData.rawValue])))
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode(ErrorModal.self, from: responseData)
                            let err : Error400 = apiResponse.error![0];
                            return resolver(.failure(NSError(domain: "", code: Int(err.code!) ?? unProcessedCall, userInfo: [NSLocalizedDescriptionKey: (err.message ??  NetworkResponse.unknownError.rawValue)])))
                        } catch {
                            print(error)
                            return resolver(.failure(NSError(domain: "", code: unabletoDecodeErrorCode, userInfo: [NSLocalizedDescriptionKey: NetworkResponse.unableToDecode.rawValue])))
                        }
                    }
                }
            }
        }
    }
}
