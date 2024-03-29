//
//  Router.swift
//  Kodmus
//
//  Created by Roy Geagea on 8/1/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import UIKit

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    private var refreshTask: URLSessionTask?

    func request(_ route: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 60.0
        sessionConfig.timeoutIntervalForResource = 60.0
        let session = URLSession.shared

        do {
            if route.headers != nil && self.didSessionExpire() {
                var refreshEndpointType = SessionApi.userRefreshToken(refreshToken: UserDefaultsManager.shared.getRefreshToken())
                if UserDefaultsManager.shared.isUserADoctor() {
                    refreshEndpointType = SessionApi.doctorRefreshToken(refreshToken: UserDefaultsManager.shared.getRefreshToken())
                }
                let refreshRequest = try self.buildRequest(from: refreshEndpointType)
                refreshTask = session.dataTask(with: refreshRequest, completionHandler: { (data, response, error) in
                    if error != nil {
                        completion(data, response, error)
                    }
                    else {
                        if let responseData = data {
                            do {
                                let apiResponse = try JSONDecoder().decode(Session.self, from: responseData)
                                UserDefaultsManager.shared.setAuthToken(token: apiResponse.access_token!)
                                UserDefaultsManager.shared.setRefreshToken(token: apiResponse.refresh_token!)
                                UserDefaultsManager.shared.setExpiry(seconds: apiResponse.expires_in!)
                            }
                            catch {
                            
                            }
                        }
                        var request: URLRequest?
                        do {
                            request = try self.buildRequest(from: route)
                            NetworkLogger.log(request: request!)
                        }
                        catch {
                            
                        }                        
                        request?.setValue(UserDefaultsManager.shared.getAuthToken(), forHTTPHeaderField: "Authorization")
                        self.task = session.dataTask(with: request!, completionHandler: { data, response, error in
                            NetworkLogger.log(response: response, data: data, error: error)
                            completion(data, response, error)
                        })
                        self.task?.resume()
                    }
                })
            }
            else {
                let request = try self.buildRequest(from: route)
                task = session.dataTask(with: request, completionHandler: { data, response, error in
                    NetworkLogger.log(response: response, data: data, error: error)
                    completion(data, response, error)
                })
            }
        } catch {
            NetworkLogger.log(response: nil, data: nil, error: error)
            completion(nil, nil, error)
        }
        if route.headers != nil && self.didSessionExpire() {
            self.refreshTask?.resume()
        }
        else {
            self.task?.resume()
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPointType) throws -> URLRequest {
        var request = URLRequest(url: URL(string: NetworkManager.baseUrl.rawValue + route.path)!,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .requestParameters(let bodyParameters,
                                    let bodyEncoding,
                                    let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestParametersAndHeaders(let bodyParameters,
                                              let bodyEncoding,
                                              let urlParameters,
                                              let additionalHeaders):
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             bodyEncoding: bodyEncoding,
                                             urlParameters: urlParameters,
                                             request: &request)
                
            case .requestBodyAndHeaders(let body,
                                        _,
                                        _,
                                        let additionHeaders):
                
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                self.addAdditionalHeaders(additionHeaders, request: &request)
                request.httpBody = body
                //                try self.configureParameters(bodyParameters: bodyParameters,
                //                                             bodyEncoding: bodyEncoding,
                //                                             urlParameters: urlParameters,
            //                                             request: &request)
                
            case .uploadFileWithParametersAndHeaders(
                                        let body,
                                        let additionHeaders,
                                        let boundary):
                
                request.setValue("multipart/form-data; boundary=" + boundary, forHTTPHeaderField: "Content-Type")
                self.addAdditionalHeaders(additionHeaders, request: &request)
                request.httpBody = body
            case .request:
                break
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Parameters?,
                                         bodyEncoding: ParameterEncoding,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            try bodyEncoding.encode(urlRequest: &request,
                                    bodyParameters: bodyParameters, urlParameters: urlParameters)
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
    
    /// Create boundary string for multipart/form-data request
    ///
    /// - returns:            The boundary string that consists of "Boundary-" followed by a UUID string.
    
    private func generateBoundaryString() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
//    private func mimeType(for path: String) -> String {
//        let url = URL(fileURLWithPath: path)
//        let pathExtension = url.pathExtension
//
//        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension as NSString, nil)?.takeRetainedValue() {
//            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
//                return mimetype as String
//            }
//        }
//        return "application/octet-stream"
//    }
    
    func didSessionExpire() -> Bool {
        let expiryDate = UserDefaultsManager.shared.getExpiryDate()
        if expiryDate == nil {
            return false
        }
        else {
            return expiryDate! < Date()
        }
    }
    
}
