//
//  File.swift
//  
//
//  Created by Eder Baldrighi on 15/12/22.
//

import Foundation

extension EndPoint {
    // MARK: - Variables
    /// Request object based on EndPoint protocol
    var request: URLRequest {
        let url = self.baseUrl.appendingPathComponent(self.path)
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30.0)
        request.httpMethod = self.httpMethod.rawValue
        request.configureHeaders(self.headers)
        request.configureUrl(self.urlParameters?.dictionary)
        request.configureBody(self.bodyParameters)
        return request
    }
    // MARK: - Functions
    /// Function responsile to make request
    /// - Parameters:
    ///   - T: Codable response type
    ///   - success: Success trailing closures
    ///   - failure: Failure trailing closures
    func request<T: Codable>(success: ((T) -> Void)? = nil, failure: ((Error)-> Void)? = nil) {
        Network().request(endPoint: self, success: success, failure: failure)
    }
}
